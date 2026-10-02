-- One-time, source-preserving Typst -> native LaTeX migration adapter.
-- Runs before qlnotes.lua; marker names come from the same authored content.
local markers = {}
local authored_labels = {}
local label_path = os.getenv('QLNOTES_NATIVE_LABELS')
if label_path then
  local handle = assert(io.open(label_path, 'r'))
  for _, name in ipairs(pandoc.json.decode(handle:read('*a'))) do authored_labels[name] = true end
  handle:close()
end
local function header(el)
  -- HTML's generated heading slugs such as "a" repeat between worksheets.
  -- Only labels explicitly authored in the source become LaTeX labels.
  if not authored_labels[el.identifier] then el.identifier = '' end
  return el
end
local replacements = {}
local math_path = os.getenv('QLNOTES_NATIVE_MATH')
if math_path then
  local handle = assert(io.open(math_path, 'r'))
  replacements = pandoc.json.decode(handle:read('*a'))
  handle:close()
end
local function math(el)
  -- Child binomials are recorded first; expand repeatedly for nested ones.
  for _ = 1, 10 do
    local before = el.text
    el.text = el.text:gsub('\\text{(QLNATIVEMATH%d+END)}', function(key)
      return assert(replacements[key], 'missing native math replacement')
    end)
    if before == el.text then return el end
  end
  error('native math replacement recursion exceeded')
end
local function attribute(el, name)
  return el.attributes['data-' .. name] or el.attributes[name]
end

local function has_class(el, name)
  for _, item in ipairs(el.classes) do
    if item == name then return true end
  end
  return false
end

local function latex(inlines)
  return pandoc.write(pandoc.Pandoc({pandoc.Plain(inlines)}), 'latex')
    :gsub('^%s+', ''):gsub('%s+$', ''):gsub('\\%((.-)\\%)', '$%1$')
    :gsub('%^{([%w])}', '^%1'):gsub('_{([%w])}', '_%1')
end

local function str(el)
  if el.text:find('⇐', 1, true) then
    local rendered = pandoc.write(pandoc.Pandoc({pandoc.Plain({el})}), 'latex'):gsub('%s+$', '')
    return pandoc.RawInline('latex', rendered:gsub('⇐', '\\(\\Leftarrow\\)'))
  end
end

local function span(el)
  local kind = has_class(el, 'ql-native-kn') and 'kn'
    or (has_class(el, 'ql-native-ref') and 'knref' or nil)
  if kind then
    local name = latex(el.content)
    table.insert(markers, {key=attribute(el, 'native-key'), kind=kind, latex=name})
    return pandoc.RawInline('latex', '\\' .. kind .. '{' .. name .. '}')
  end
  if has_class(el, 'ql-native-label-ref') then
    return pandoc.RawInline('latex', '\\ref{' .. attribute(el, 'native-label') .. '}')
  end
end

local function div(el)
  if has_class(el, 'ql-native-raw') then
    return pandoc.RawBlock('latex', attribute(el, 'native-tex'))
  end
  if has_class(el, 'ql-statement-anchor') then
    for _, child in ipairs(el.content) do
      if child.t == 'Div' then
        child.identifier = el.identifier
        return child
      end
    end
    error('statement anchor lost its body')
  end
  if has_class(el, 'ql-native-input') then
    return pandoc.RawBlock('latex', '\\input{' .. attribute(el, 'native-path') .. '}')
  end
  if has_class(el, 'ql-native-tikz') then
    return pandoc.RawBlock('latex', '\\begin{center}\n\\csname '
      .. attribute(el, 'native-command') .. '\\endcsname\n\\end{center}')
  end
end

local function figure(el)
  if #el.content == 1 and el.content[1].t == 'Table' then
    local table = el.content[1]
    table.identifier = el.identifier
    table.caption = el.caption
    return table
  end
  -- A diagram is kept as native drawing code instead of a rendered snapshot.
  if has_class(el, 'ql-diagram') then
    local name = attribute(el, 'native-command')
    if not name then error('diagram has no native drawing command') end
    local blocks = pandoc.List({pandoc.RawBlock('latex', '\\begin{figure}[htbp]\n\\centering\n\\csname '
      .. name .. '\\endcsname')})
    if el.caption and #el.caption.long > 0 then
      local caption = pandoc.write(pandoc.Pandoc(el.caption.long), 'latex'):gsub('%s+$', '')
      blocks:insert(pandoc.RawBlock('latex', '\\caption{' .. caption .. '}'))
    end
    if el.identifier ~= '' then
      blocks:insert(pandoc.RawBlock('latex', '\\label{' .. el.identifier .. '}'))
    end
    blocks:insert(pandoc.RawBlock('latex', '\\end{figure}'))
    return blocks
  end
  -- Authored figures may be inside a theorem's tcolorbox, where floats cannot
  -- exist. Keep their caption and number in normal flow in both contexts.
  local blocks = pandoc.List({pandoc.RawBlock('latex', '\\begin{center}')})
  blocks:extend(el.content)
  if el.caption and #el.caption.long > 0 then
    local caption = pandoc.write(pandoc.Pandoc(el.caption.long), 'latex'):gsub('%s+$', '')
    caption = caption:gsub('^Figure[~%s]+[%d%.]+:%s*', ''):gsub('^Table[~%s]+[%d%.]+:%s*', '')
    blocks:insert(pandoc.RawBlock('latex', '\\captionof{figure}{' .. caption .. '}'))
  end
  if el.identifier ~= '' then
    blocks:insert(pandoc.RawBlock('latex', '\\label{' .. el.identifier .. '}'))
  end
  blocks:insert(pandoc.RawBlock('latex', '\\end{center}'))
  return blocks
end

local function finish(doc)
  local output = os.getenv('QLNOTES_NATIVE_MARKERS')
  if output then
    local handle = assert(io.open(output, 'w'))
    handle:write(pandoc.json.encode(markers))
    handle:close()
  end
  return doc
end

return {{Math=math, Str=str}, {Header=header, Span=span, Div=div, Figure=figure}, {Pandoc=finish}}
