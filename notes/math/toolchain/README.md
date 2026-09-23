# QLNotes toolchain

This is the shared build and presentation layer for Typst-first math notes.
The repository-wide graph also accepts maintained Markdown and LaTeX authority;
those format adapters and authoring workflows live in the independent
[`kgdistiller`](https://github.com/qiulinfan/kgdistiller) product. This repository
is one local instance: LaTeX web output reuses this toolchain through an ignored
Typst intermediate, while Pages reads only the committed graph export.

The public site's palette authority is `site/src/styles/variables.styl` in the
homepage repository
[`qiulinfan.github.io`](https://github.com/qiulinfan/qiulinfan.github.io).
`web.css` is its single standalone Notes projection, shared by every Typst
export and copied into every generated LaTeX-to-Typst project. Do not create
course-local palettes. Keep its light, dark, and automatic theme roles aligned
with the site; the homepage's `site/tests/theme-contract.test.mjs` verifies the
pair on every homepage build. Published standalone pages expose the same Light,
Dark, and Auto preference as the Astro shell; the homepage's notes dock
(`site/src/docks/notes/scripts/install-artifacts.mjs`) installs that runtime and
its back/forward style-recovery guard.

## Chapter previews in Obsidian

`notes/math/.tinymist-preview.typ` is the Obsidian Tinymist preview entry.
The plugin passes the selected file as the `preview-source` input, with a
Typst absolute path rooted at the vault. Files inside `chapters/` use the
shared `paged-layout(frontmatter: false)` so fonts, headings, statements,
and page furniture match the book without a cover or table of contents.
Numbering starts locally at 1 in a standalone chapter. References whose labels
are absent from the chapter display an explicit external-reference marker
with the original target, rather than an invented book-wide number. Other files, including
`main.typ`, are included without another layout. Chapter sources are unchanged;
normal book compilation and HTML export do not use this preview entry.

```text
toolchain/
├── qlnotes.typ             # HTML presentation
├── math-aliases.typ        # shared math notation
├── web.css                 # responsive web style
├── scripts/
│   ├── export.py           # one complete Typst entry -> temporary snapshots
│   ├── export_course.py    # split entry snapshots into chapter files
│   ├── check_web.py        # validate committed-site note HTML
│   ├── convert_latex_project.py # ElegantBook -> previewable Typst project
│   ├── export_latex_web.py # maintained LaTeX -> Typst HTML; no graph mutation
│   ├── migrate_knowledge_markers.py # one-time metadata migration
│   └── migrate_latex.py    # legacy migration helper
├── filters/qlnotes.lua     # semantic Pandoc mapping
└── latex/                  # standalone LaTeX class and template
```

Install or check the four runtime dependencies once:

```sh
make setup
make doctor
```

Daily commands live in each migrated course root:

```sh
make export              # chapter .tex/.md snapshots; no graph mutation
make web-check           # local ignored HTML + basic UTF-8/structure check
make                     # render/check all web entries from the adopted registry
make knowledge-curate   # explicit authoring refresh through kgdistiller
```

For a Typst-first course, Typst is its authority. `export_course.py` compiles
each entry once, splits the semantic Markdown and LaTeX at real level-one
chapters, and writes a flat, ignored local result:

```text
course/exports/
├── latex/
│   ├── <entry>--<chapter>.tex
│   ├── assets/
│   └── shared class/bibliography files
└── markdown/
    ├── index.md
    ├── <entry>--<chapter>.md
    ├── .assets/
    └── reference.bib
```

No generated snapshot is committed. HTML and exporter intermediates stay under
ignored `build/` or `exports/` directories. PDF files are forbidden anywhere
below `notes/`. GitHub Actions builds HTML from Typst and publishes only the
Pages artifact.

Markdown is intentionally graph-oriented and lossy. Semantic statements,
examples, proofs, remarks, notes, and solutions become ordinary `>` blockquotes;
knowledge definitions become `--[[Dominated convergence theorem]]--` and
references become `[[Dominated convergence theorem]]`. Inline math uses
`$...$`; every display formula uses line-delimited `$$` blocks.

Knowledge markers are authored directly in Typst:

```typst
#definition(title: [#kn[Norm] and #kn[Semi-norm]])[
  ...
]

Later, #ref[Norm] links back to that unique
definition and becomes a backlink in the global graph.
```

Each authored `#kn` identifies one independently reusable concept and is
globally unique; a title that defines several concepts contains several `#kn`
markers. `#ref` may occur anywhere and uses the same name. A file gets a
meaningful `#ref` when it directly uses an immediate prerequisite whose
authority is another file; same-file concepts and transitive ancestors do not
need one.

Direct Markdown authorities use `--[[Name]]--` for the canonical `kn` and
`[[Name]]` or `[[Name|display]]` for refs. Direct LaTeX authorities use
`\kn{Name}` and `\knref{Name}`; `migrate_latex.py` preserves these as Typst
`#kn`/`#ref` during web conversion. A configured directory or file scope may
mix all three suffixes.

For an ElegantBook LaTeX course, pass its `main.tex` to
`convert_latex_project.py`. The synchronized adapter expands direct chapter
inputs and creates an ignored self-contained Typst project with `main.typ`,
local QLNotes runtime, copied assets, and preview Makefile. Web export always
compiles that project; there is no independent LaTeX-to-HTML renderer.

The agent reads one complete changed file, preserves explicit markers, extracts
a concise source-grounded entry for every local node, and chooses direct typed
semantic edges. Scripts only scan and synchronize explicit markers, apply the
reviewed delta, and check deterministic invariants; the one-time
`migrate_knowledge_markers.py` helper is not part of daily ingestion. Stable
machine IDs are maintained outside the source. Synchronization preserves agent
entries, plain searchable names, and Typst-compiled inline MathML for the
knowledge website. Formal statements without `#kn` are not graph nodes.

Install the selected `kgdistiller` product revision before authoring or
refreshing graph data. The changed-file workflow ends with scoped curation
validation against this repository as the instance root:

```sh
kgdistiller --repo-root . scan --file path/to/chapter.typ
kgdistiller --repo-root . apply knowledge/build/reviewed-delta.json
kgdistiller --repo-root . sync --file path/to/chapter.typ
kgdistiller --repo-root . curate-check --file path/to/chapter.typ
make knowledge-authoring-check
```

The repository workflow classifies every supported note as one registered
authority, one explicit non-authority tool/asset, or frozen legacy backlog. A
new unregistered file or an edit to legacy backlog fails before export. The
explicit course `make knowledge-curate` target runs this gate after its scoped
synchronization.

Direct Markdown synchronization is an explicit authoring operation:

```sh
kgdistiller --repo-root . publish --format markdown
```

It synchronizes every configured Markdown authority before checking entries and
required refs. The Astro dev/build, Typst release, and Pages jobs never run this
command: they validate and render the same adopted
`knowledge/export/site/` bundle. The private instance graph under
`knowledge/graph/` remains authoring state and is never a website input.
Semantic entries and edges still come only from an agent that has read the
source and existing graph.

The graph can also be synchronized at repository, subject, course, or
individual-file granularity:

```sh
make knowledge-build
make knowledge-subject SUBJECT=math
make knowledge-course COURSE=measure-theory
make knowledge-file FILE=notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.typ
```

If a file-scoped sync no longer sees a previously active `#kn`, its source is
marked orphaned. The node metadata and semantic edges remain available until the
same name is defined in its new authoritative location.

CeTZ remains the diagram authority. Markdown and the web use SVG; editable
LaTeX snapshots use portable derived PNG assets so export never creates a PDF
inside `notes/`. The exporter never reconstructs TikZ.
