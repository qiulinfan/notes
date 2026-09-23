// Shared QLNotes Typst template and semantic authoring API.
// The same semantic components render to paged PDF and semantic HTML.

#import "generated/knowledge-registry.typ": knowledge-registry

#let palette = (
  ink: rgb("#172033"),
  muted: rgb("#667085"),
  paper: rgb("#ffffff"),
  canvas: rgb("#f4f7fb"),
  blue: rgb("#2574d8"),
  blue-soft: rgb("#eef6ff"),
  teal: rgb("#17a89a"),
  teal-soft: rgb("#ecfbf8"),
  orange: rgb("#f27a24"),
  orange-soft: rgb("#fff5ec"),
  violet: rgb("#7657c8"),
  violet-soft: rgb("#f5f1ff"),
  border: rgb("#dce4ef"),
)

#let fonts = (
  serif: ("Libertinus Serif", "Songti SC"),
  sans: ("PingFang SC", "Arial"),
  mono: ("DejaVu Sans Mono",),
  math: "New Computer Modern Math",
)

#let chaptered-number(number) = context {
  let chapter = counter(heading.where(level: 1)).get().first()
  if chapter > 0 {
    numbering("1.1", chapter, number)
  } else {
    numbering("1", number)
  }
}

#let knowledge-entry(name) = knowledge-registry.find(
  entry => entry.names.any(candidate => candidate == name)
)

// Define one globally unique knowledge name. Machine IDs stay in the generated
// registry; authors write only #kn[Name].
#let kn(body) = context {
  let entry = knowledge-entry(body)
  if entry == none {
    text(fill: palette.ink, weight: "bold")[#body]
  } else if target() == "html" {
    let anchor = "kn-" + entry.id
    let record = metadata((schema: "qlkg-node-v2", id: entry.id))
    [
      #record
      #html.elem(
        "span",
        attrs: (
          id: anchor,
          class: "ql-kn",
          data-ql-kn: entry.id,
        ),
      )[#strong(body)]
    ]
  } else {
    let anchor = "kn-" + entry.id
    let record = metadata((schema: "qlkg-node-v2", id: entry.id))
    [#record #text(fill: palette.ink, weight: "bold")[#body] #label(anchor)]
  }
}

// Refer to the unique definition point with the same semantic name. Authors
// write only #ref[Name]; unresolved names remain readable until the next sync.
#let typst-ref = ref
#let ref(name, ..arguments) = context {
  if type(name) == label {
    typst-ref(name)
  } else {
    let entry = knowledge-entry(name)
    if entry == none {
      name
    } else if target() == "html" {
      html.elem(
        "a",
        attrs: (
          class: "ql-ref",
          href: entry.url,
          data-ql-ref: entry.id,
        ),
      )[#name]
    } else {
      link(entry.url, name)
    }
  }
}

#let semantic-wrapper(
  body,
  id: none,
  kind: none,
  concepts: (),
  depends: (),
  aliases: (),
) = context {
  let labelled-body = if id == none {
    body
  } else {
    [#body #label(id)]
  }

  if target() == "html" and id != none {
    html.elem(
      "div",
      attrs: (
        id: id,
        class: "ql-statement-anchor",
        data-ql-statement-id: id,
      ),
    )[#labelled-body]
  } else {
    labelled-body
  }
}

#let statement(
  kind: none,
  supplement: none,
  body,
  title: none,
) = figure(
  body,
  kind: kind,
  supplement: supplement,
  caption: if title == none { none } else { title },
  numbering: chaptered-number,
  outlined: false,
)

#let definition(
  body,
  title: none,
  id: none,
  concepts: (),
  depends: (),
  aliases: (),
) = semantic-wrapper(
  id: id,
  kind: "definition",
  concepts: concepts,
  depends: depends,
  aliases: aliases,
  statement(
    kind: "definition",
    supplement: [Definition],
    title: title,
    body,
  ),
)

#let theorem(
  body,
  title: none,
  id: none,
  concepts: (),
  depends: (),
  aliases: (),
) = semantic-wrapper(
  id: id,
  kind: "theorem",
  concepts: concepts,
  depends: depends,
  aliases: aliases,
  statement(
    kind: "theorem",
    supplement: [Theorem],
    title: title,
    body,
  ),
)

#let lemma(
  body,
  title: none,
  id: none,
  concepts: (),
  depends: (),
  aliases: (),
) = semantic-wrapper(
  id: id,
  kind: "lemma",
  concepts: concepts,
  depends: depends,
  aliases: aliases,
  statement(
    kind: "lemma",
    supplement: [Lemma],
    title: title,
    body,
  ),
)

#let corollary(
  body,
  title: none,
  id: none,
  concepts: (),
  depends: (),
  aliases: (),
) = semantic-wrapper(
  id: id,
  kind: "corollary",
  concepts: concepts,
  depends: depends,
  aliases: aliases,
  statement(
    kind: "corollary",
    supplement: [Corollary],
    title: title,
    body,
  ),
)

#let proposition(
  body,
  title: none,
  id: none,
  concepts: (),
  depends: (),
  aliases: (),
) = semantic-wrapper(
  id: id,
  kind: "proposition",
  concepts: concepts,
  depends: depends,
  aliases: aliases,
  statement(
    kind: "proposition",
    supplement: [Proposition],
    title: title,
    body,
  ),
)

#let axiom(
  body,
  title: none,
  id: none,
  concepts: (),
  depends: (),
  aliases: (),
) = semantic-wrapper(
  id: id,
  kind: "axiom",
  concepts: concepts,
  depends: depends,
  aliases: aliases,
  statement(
    kind: "axiom",
    supplement: [Axiom],
    title: title,
    body,
  ),
)

#let example(
  body,
  title: none,
  id: none,
  concepts: (),
  depends: (),
  aliases: (),
) = semantic-wrapper(
  id: id,
  kind: "example",
  concepts: concepts,
  depends: depends,
  aliases: aliases,
  statement(
    kind: "example",
    supplement: [Example],
    title: title,
    body,
  ),
)

#let statement-head(it) = [
  #strong[
    #it.supplement #context it.counter.display(it.numbering)
    #if it.caption != none { [: #it.caption.body] }
  ]
]

#let render-statement(it, accent, tint) = context {
  if target() == "html" {
    html.elem(
      "section",
      attrs: (
        class: "ql-callout ql-callout--" + it.kind,
        role: if it.kind == "definition" { "definition" } else { "note" },
      ),
    )[
      #html.elem("div", attrs: (class: "ql-callout__head"))[
        #statement-head(it)
      ]
      #html.elem("div", attrs: (class: "ql-callout__body"))[
        #it.body
      ]
    ]
  } else {
    block(
      width: 100%,
      breakable: true,
      fill: tint,
      stroke: (left: 2.4pt + accent, rest: 0.6pt + accent.lighten(58%)),
      radius: 4pt,
      inset: (x: 11pt, y: 9pt),
      above: 0.9em,
      below: 0.9em,
    )[
      #align(left)[
        #text(font: fonts.sans, fill: accent, size: 0.93em)[
          #statement-head(it)
        ]
        #v(0.45em)
        #it.body
      ]
    ]
  }
}

#let note(body, title: [Note]) = context {
  if target() == "html" {
    html.elem("aside", attrs: (class: "ql-note", role: "note"))[
      #html.elem("div", attrs: (class: "ql-note__title"))[#title]
      #body
    ]
  } else {
    block(
      width: 100%,
      fill: palette.blue-soft,
      stroke: (left: 2pt + palette.blue),
      radius: 3pt,
      inset: 10pt,
      above: 0.8em,
      below: 0.8em,
    )[
      #text(font: fonts.sans, fill: palette.blue, weight: "semibold")[#title]
      #h(0.6em)
      #body
    ]
  }
}

#let remark(body, title: [Remark]) = context {
  if target() == "html" {
    html.elem("aside", attrs: (class: "ql-remark", role: "note"))[
      #html.elem("div", attrs: (class: "ql-remark__title"))[#title]
      #body
    ]
  } else {
    block(
      width: 100%,
      stroke: (left: 2pt + palette.orange),
      inset: 10pt,
      above: 0.8em,
      below: 0.8em,
    )[
      #text(font: fonts.sans, fill: palette.orange, weight: "semibold")[#title]
      #h(0.6em)
      #body
    ]
  }
}

#let diagram(
  draw,
  caption: none,
  alt: "",
  id: none,
) = context {
  assert(alt != "", message: "diagram requires non-empty alt text")
  if target() == "html" {
    let attrs = if id == none {
      (
        class: "ql-diagram",
        role: "img",
        aria-label: alt,
      )
    } else {
      (
        id: id,
        class: "ql-diagram",
        role: "img",
        aria-label: alt,
        data-ql-id: id,
      )
    }
    html.elem("figure", attrs: attrs)[
      #html.frame(draw())
      #if caption != none {
        html.elem("figcaption")[#caption]
      }
    ]
  } else {
    let visual = figure(
      block(width: 100%)[#align(left)[#draw()]],
      caption: caption,
    )
    if id == none {
      visual
    } else {
      [#visual #label(id)]
    }
  }
}

#let proof(body) = context {
  if target() == "html" {
    html.elem("section", attrs: (class: "ql-proof"))[
      #html.elem("div", attrs: (class: "ql-proof__title"))[Proof]
      #body
      #html.elem("span", attrs: (class: "ql-proof__qed"))[□]
    ]
  } else {
    block(above: 0.8em, below: 0.8em)[
      #text(font: fonts.sans, fill: palette.orange, weight: "semibold")[Proof.]
      #h(0.55em)
      #body
      #h(1fr)
      #text(fill: palette.orange)[□]
    ]
  }
}

#let solution(body, title: [Solution]) = context {
  if target() == "html" {
    html.elem("section", attrs: (class: "ql-solution"))[
      #html.elem("div", attrs: (class: "ql-solution__title"))[#title]
      #body
    ]
  } else {
    block(above: 0.8em, below: 0.8em)[
      #text(font: fonts.sans, fill: palette.teal, weight: "semibold")[#title.]
      #h(0.55em)
      #body
    ]
  }
}

#let render-heading(it) = {
  let number = if it.numbering != none {
    context counter(heading).display(it.numbering)
  } else {
    none
  }
  let accent = if it.level == 1 {
    palette.blue
  } else if it.level == 2 {
    palette.teal
  } else {
    palette.muted
  }
  let size = if it.level == 1 {
    18pt
  } else if it.level == 2 {
    14pt
  } else {
    11.5pt
  }
  block(
    width: 100%,
    above: if it.level == 1 { 1.8em } else { 1.25em },
    below: if it.level == 1 { 0.8em } else { 0.45em },
    stroke: if it.level == 1 { (bottom: 0.7pt + accent.lighten(55%)) } else { none },
    inset: if it.level == 1 { (bottom: 5pt) } else { 0pt },
  )[
    #text(font: fonts.sans, size: size, weight: "semibold", fill: accent)[
      #if number != none { [#number #h(0.55em)] }
      #it.body
    ]
  ]
}

#let cover-page(
  title: none,
  subtitle: none,
  course: none,
  author: none,
  date: none,
  cover: none,
) = [
  #if cover != none {
    block(
      width: 100%,
      height: 62mm,
      clip: true,
      radius: 5pt,
      image(cover, width: 100%, height: 62mm, fit: "cover"),
    )
  } else {
    block(width: 100%, height: 42mm, fill: palette.canvas)
  }
  #v(8mm)
  #block(width: 18mm, height: 3pt, fill: palette.teal)
  #v(7mm)
  #text(font: fonts.sans, size: 25pt, weight: "bold", fill: palette.ink)[#title]
  #if subtitle != none {
    v(3mm)
    text(font: fonts.serif, size: 13pt, fill: palette.muted)[#subtitle]
  }
  #v(15mm)
  #grid(
    columns: (1fr, auto),
    column-gutter: 12mm,
    align: (left + horizon, right + horizon),
    [
      #if course != none {
        text(font: fonts.sans, size: 9pt, fill: palette.blue, weight: "semibold")[
          #course
        ]
        v(3mm)
      }
      #if author != none {
        text(size: 10pt, fill: palette.muted)[Author: #author]
        linebreak()
      }
      #if date != none {
        text(size: 10pt, fill: palette.muted)[Date: #date]
      }
    ],
    [
      #circle(radius: 18mm, fill: palette.teal-soft, stroke: 0.8pt + palette.teal)[
        #align(center + horizon)[
          #text(font: fonts.sans, size: 17pt, weight: "bold", fill: palette.teal)[QL]
        ]
      ]
    ],
  )
  #v(1fr)
  #text(size: 9pt, style: "italic", fill: palette.muted)[
    A semantic-first template for durable mathematical notes.
  ]
  #pagebreak()
]

#let paged-layout(
  title: none,
  subtitle: none,
  course: none,
  author: none,
  date: none,
  cover: none,
  frontmatter: true,
  body,
) = {
  set page(
    paper: "a4",
    margin: (top: 22mm, bottom: 20mm, x: 22mm),
    header: context {
      if not frontmatter or counter(page).get().first() > 1 {
        set text(font: fonts.sans, size: 8.5pt, fill: palette.muted)
        grid(
          columns: (1fr, auto),
          course,
          [QLNotes],
        )
        line(length: 100%, stroke: 0.45pt + palette.border)
      }
    },
    footer: context {
      if not frontmatter or counter(page).get().first() > 1 {
        align(center)[
          #text(font: fonts.sans, size: 8.5pt, fill: palette.blue)[
            #counter(page).display()
          ]
        ]
      }
    },
  )
  set text(
    font: fonts.serif,
    size: 10.5pt,
    fill: palette.ink,
    lang: "zh",
    region: "CN",
  )
  set math.equation(numbering: "(1)")
  set heading(numbering: "1.1")
  set par(justify: true, leading: 0.72em)
  set list(indent: 1.1em, body-indent: 0.55em)
  set enum(indent: 1.2em, body-indent: 0.55em)
  show math.equation.where(block: true): it => align(center, it)
  show heading: render-heading
  show figure: set align(left)
  show figure.where(kind: "definition"): it => render-statement(
    it,
    palette.teal,
    palette.teal-soft,
  )
  show figure.where(kind: "theorem"): it => render-statement(
    it,
    palette.orange,
    palette.orange-soft,
  )
  show figure.where(kind: "lemma"): it => render-statement(
    it,
    palette.orange,
    palette.orange-soft,
  )
  show figure.where(kind: "corollary"): it => render-statement(
    it,
    palette.orange,
    palette.orange-soft,
  )
  show figure.where(kind: "axiom"): it => render-statement(
    it,
    palette.orange,
    palette.orange-soft,
  )
  show figure.where(kind: "proposition"): it => render-statement(
    it,
    palette.violet,
    palette.violet-soft,
  )
  show figure.where(kind: "example"): it => render-statement(
    it,
    palette.blue,
    palette.blue-soft,
  )
  show bibliography: set heading(numbering: none)

  if frontmatter {
    cover-page(
      title: title,
      subtitle: subtitle,
      course: course,
      author: author,
      date: date,
      cover: cover,
    )
    outline(title: [Contents], depth: 2)
    pagebreak()
  }
  body
}

#let web-layout(
  title: none,
  subtitle: none,
  course: none,
  author: none,
  date: none,
  body,
) = {
  let export-mode = sys.inputs.at("ql-export", default: "false") == "true"
  let rendered-body = if export-mode {
    [
      #show cite: it => {
        let key = str(it.key)
        html.elem(
          "span",
          attrs: (
            class: "ql-citation",
            data-ql-key: key,
            data-ql-form: if it.form == none { "normal" } else { it.form },
          ),
        )[
          #text("@" + key)
          #if it.supplement != none { [; #it.supplement] }
        ]
      }
      #show bibliography: it => none
      #body
    ]
  } else {
    body
  }

  set heading(numbering: "1.1")
  show figure.where(kind: "definition"): it => render-statement(
    it,
    palette.teal,
    palette.teal-soft,
  )
  show figure.where(kind: "theorem"): it => render-statement(
    it,
    palette.orange,
    palette.orange-soft,
  )
  show figure.where(kind: "lemma"): it => render-statement(
    it,
    palette.orange,
    palette.orange-soft,
  )
  show figure.where(kind: "corollary"): it => render-statement(
    it,
    palette.orange,
    palette.orange-soft,
  )
  show figure.where(kind: "axiom"): it => render-statement(
    it,
    palette.orange,
    palette.orange-soft,
  )
  show figure.where(kind: "proposition"): it => render-statement(
    it,
    palette.violet,
    palette.violet-soft,
  )
  show figure.where(kind: "example"): it => render-statement(
    it,
    palette.blue,
    palette.blue-soft,
  )

  html.style(read("web.css"))
  html.elem("div", attrs: (class: "ql-site"))[
    #html.elem("header", attrs: (class: "ql-hero"))[
      #html.elem("div", attrs: (class: "ql-hero__eyebrow"))[
        #if course != none { course } else { [QLNotes] }
      ]
      #html.elem("h1")[#title]
      #if subtitle != none {
        html.elem("p", attrs: (class: "ql-hero__subtitle"))[#subtitle]
      }
      #html.elem("div", attrs: (class: "ql-hero__meta"))[
        #if author != none { [#author] }
        #if author != none and date != none { [ · ] }
        #if date != none { [#date] }
      ]
    ]
    #html.elem("div", attrs: (class: "ql-layout"))[
      #html.elem("aside", attrs: (class: "ql-toc"))[
        #html.elem("div", attrs: (class: "ql-toc__label"))[On this page]
        #outline(title: none, depth: 2)
      ]
      #html.elem("main", attrs: (class: "ql-main"))[
        #html.elem("article", attrs: (class: "ql-article"))[
          #rendered-body
        ]
      ]
    ]
    #html.elem("footer", attrs: (class: "ql-footer"))[
      Built from one Typst source with the QLNotes semantic template.
    ]
  ]
}

#let qlnotes(
  title: none,
  subtitle: none,
  course: none,
  author: none,
  date: none,
  cover: none,
  description: none,
  keywords: (),
  language: "zh-CN",
  bibliography: "references.bib",
  body,
) = {
  let document-record = metadata((
    schema: "qlnotes-document-v1",
    title: title,
    subtitle: subtitle,
    course: course,
    author: author,
    date: date,
    description: description,
    keywords: keywords,
    language: language,
    bibliography: bibliography,
  ))

  set document(
    title: title,
    author: if author == none { () } else { (author,) },
    description: description,
    keywords: keywords,
    date: none,
  )
  [
    #document-record
    #context {
      if target() == "html" {
        web-layout(
          title: title,
          subtitle: subtitle,
          course: course,
          author: author,
          date: date,
          body,
        )
      } else {
        paged-layout(
          title: title,
          subtitle: subtitle,
          course: course,
          author: author,
          date: date,
          cover: cover,
          body,
        )
      }
    }
  ]
}
