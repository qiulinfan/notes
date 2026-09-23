-- Preserve QLNotes semantics while Pandoc migrates legacy LaTeX to Typst.

local chapter = os.getenv("QLNOTES_CHAPTER") or "chapter"
local counters = {}
local used_ids = {}
local label_map = {}

local statements = {
  definition = "def",
  axiom = "ax",
  theorem = "thm",
  lemma = "lem",
  corollary = "cor",
  proposition = "prop",
  example = "ex",
}

local supporting = {
  proof = true,
  solution = true,
  remark = true,
  note = true,
}

local function has_class(element, wanted)
  for _, class in ipairs(element.classes) do
    if class == wanted then
      return true
    end
  end
  return false
end

local function environment_kind(element)
  for kind, _ in pairs(statements) do
    if has_class(element, kind) then
      return kind
    end
  end
  for kind, _ in pairs(supporting) do
    if has_class(element, kind) then
      return kind
    end
  end
  return nil
end

local function slug(value)
  -- Strip non-ASCII text before applying byte-oriented Lua string
  -- operations. This keeps identifiers valid even when a title contains
  -- Chinese text and prevents truncation in the middle of a UTF-8 codepoint.
  value = string.gsub(value, "[^A-Za-z0-9]+", "-")
  value = string.lower(value)
  value = string.gsub(value, "[’']", "")
  value = string.gsub(value, "^-+", "")
  value = string.gsub(value, "-+$", "")
  return value
end

local function typst_string(value)
  value = string.gsub(value, "\\", "\\\\")
  value = string.gsub(value, '"', '\\"')
  value = string.gsub(value, "[\r\n]+", " ")
  return value
end

local function label_from_span(span)
  if span.identifier ~= "" then
    return span.identifier
  end
  return span.attributes["label"]
end

local function find_label_inlines(inlines)
  for _, inline in ipairs(inlines) do
    if inline.t == "Span" then
      local label = label_from_span(inline)
      if label ~= nil and label ~= "" then
        return label
      end
      local nested = find_label_inlines(inline.content)
      if nested ~= nil then
        return nested
      end
    end
  end
  return nil
end

local function find_label(blocks)
  for _, block in ipairs(blocks) do
    if block.t == "Para" or block.t == "Plain" then
      local label = find_label_inlines(block.content)
      if label ~= nil then
        return label
      end
    end
  end
  return nil
end

local function title_inlines(element)
  local first = element.content[1]
  if first == nil or (first.t ~= "Para" and first.t ~= "Plain") then
    return {}
  end
  local candidate = first.content[1]
  if candidate == nil or candidate.t ~= "Span" then
    return {}
  end
  if label_from_span(candidate) ~= nil then
    return {}
  end
  return candidate.content
end

local function unique_id(candidate)
  if candidate == "" then
    candidate = "node"
  end
  local result = candidate
  local suffix = 2
  while used_ids[result] do
    result = candidate .. "-" .. tostring(suffix)
    suffix = suffix + 1
  end
  used_ids[result] = true
  return result
end

local function prepare_div(element)
  local kind = environment_kind(element)
  if statements[kind] == nil then
    return nil
  end

  counters[kind] = (counters[kind] or 0) + 1
  local title = pandoc.utils.stringify(title_inlines(element))
  local concept = slug(title)
  if concept == "" then
    concept = kind .. "-" .. string.format("%03d", counters[kind])
  end
  if #concept > 64 then
    concept = string.sub(concept, 1, 64)
    concept = string.gsub(concept, "-+$", "")
  end

  local identifier = unique_id(
    statements[kind] .. "-" .. chapter .. "-" .. concept
  )
  local old_label = find_label(element.content)
  if old_label ~= nil then
    label_map[old_label] = identifier
  end

  element.attributes["qlnotes-id"] = identifier
  element.attributes["qlnotes-concept"] = concept
  element.attributes["qlnotes-alias"] = title
  return element
end

local function render_inlines(inlines)
  if #inlines == 0 then
    return ""
  end
  local document = pandoc.Pandoc({ pandoc.Plain(inlines) })
  local rendered = pandoc.write(document, "typst")
  rendered = string.gsub(rendered, "^%s+", "")
  rendered = string.gsub(rendered, "%s+$", "")
  return rendered
end

local function strip_environment_prefix(element)
  local title = title_inlines(element)
  local first = element.content[1]
  if first == nil or (first.t ~= "Para" and first.t ~= "Plain") then
    return title
  end

  if #title > 0 then
    table.remove(first.content, 1)
  end
  while #first.content > 0 do
    local inline = first.content[1]
    if
      inline.t == "Span"
      and label_from_span(inline) ~= nil
    then
      table.remove(first.content, 1)
    elseif inline.t == "SoftBreak" or inline.t == "LineBreak" then
      table.remove(first.content, 1)
    else
      break
    end
  end
  if #first.content == 0 then
    table.remove(element.content, 1)
  end
  return title
end

local function wrapped_blocks(opening, body)
  local blocks = pandoc.List({ pandoc.RawBlock("typst", opening) })
  blocks:extend(body)
  blocks:insert(pandoc.RawBlock("typst", "]"))
  return blocks
end

local function strip_proof_markers(element)
  local first = element.content[1]
  if first ~= nil and (first.t == "Para" or first.t == "Plain") then
    local leading = first.content[1]
    if
      leading ~= nil
      and leading.t == "Emph"
      and pandoc.utils.stringify(leading) == "Proof."
    then
      table.remove(first.content, 1)
      if first.content[1] ~= nil and first.content[1].t == "Space" then
        table.remove(first.content, 1)
      end
    end
  end

  local last = element.content[#element.content]
  if last ~= nil and (last.t == "Para" or last.t == "Plain") then
    local trailing = last.content[#last.content]
    if trailing ~= nil and trailing.t == "Str" then
      trailing.text = string.gsub(trailing.text, "\194\160◻$", "")
      trailing.text = string.gsub(trailing.text, "◻$", "")
      if trailing.text == "" then
        table.remove(last.content, #last.content)
      end
    end
  end
end

local function convert_div(element)
  local kind = environment_kind(element)
  if kind == nil then
    if has_class(element, "center") or has_class(element, "minipage") then
      return element.content
    end
    return nil
  end

  local title = strip_environment_prefix(element)
  local rendered_title = render_inlines(title)

  if statements[kind] ~= nil then
    local identifier = element.attributes["qlnotes-id"]
    local concept = element.attributes["qlnotes-concept"]
    local alias = element.attributes["qlnotes-alias"] or ""
    local arguments = {}
    if rendered_title ~= "" then
      table.insert(arguments, "  title: [" .. rendered_title .. "]")
    end
    table.insert(arguments, '  id: "' .. typst_string(identifier) .. '"')
    table.insert(arguments, '  concepts: ("' .. typst_string(concept) .. '",)')
    table.insert(arguments, "  depends: ()")
    if alias ~= "" then
      table.insert(
        arguments,
        '  aliases: ("' .. typst_string(alias) .. '",)'
      )
    end
    local opening = "#" .. kind .. "(\n" ..
      table.concat(arguments, ",\n") .. ",\n)["
    return wrapped_blocks(opening, element.content)
  end

  if kind == "proof" then
    strip_proof_markers(element)
    return wrapped_blocks("#proof[", element.content)
  end

  local opening = "#" .. kind
  if rendered_title ~= "" then
    opening = opening .. "(title: [" .. rendered_title .. "])"
  end
  return wrapped_blocks(opening .. "[", element.content)
end

local function convert_code(element)
  local language, body = string.match(
    element.text,
    "^QLNOTESCODE:([%w-]+)\n(.*)$"
  )
  if language == nil then
    return nil
  end
  element.text = body
  element.classes = { language }
  return element
end

local function convert_diagram(element)
  local text = pandoc.utils.stringify(element)
  local identifier = string.match(text, "^QLNOTESDIAGRAM:([%w-]+)$")
  if identifier == nil then
    return nil
  end
  local opening = table.concat({
    "#diagram(",
    "  " .. identifier .. ",",
    '  id: "fig-' .. identifier .. '",',
    "  caption: [Migrated probability diagram],",
    '  alt: "Probability diagram migrated from the legacy TikZ source.",',
    ")",
  }, "\n")
  return pandoc.RawBlock("typst", opening)
end

local function remove_label_span(element)
  if label_from_span(element) ~= nil then
    return {}
  end
  return nil
end

local function rewrite_link(element)
  if element.target == "qlkn:" or element.target == "qlknref:" then
    local function_name = element.target == "qlkn:" and "kn" or "ref"
    local inlines = pandoc.List({
      pandoc.RawInline("typst", "#" .. function_name .. "["),
    })
    inlines:extend(element.content)
    inlines:insert(pandoc.RawInline("typst", "]"))
    return inlines
  end
  if string.sub(element.target, 1, 1) ~= "#" then
    return nil
  end
  local old = string.sub(element.target, 2)
  local replacement = label_map[old]
  if replacement ~= nil then
    element.target = "#" .. replacement
    return element
  end
  return nil
end

return {
  {
    Div = prepare_div,
  },
  {
    CodeBlock = convert_code,
    Para = convert_diagram,
    Plain = convert_diagram,
    Span = remove_label_span,
    Link = rewrite_link,
    Div = convert_div,
  },
}
