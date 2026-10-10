# QLNotes toolchain

This is the shared build and presentation layer for Typst-first math notes.
Knowledge records about these notes are authored with the independent
[`kgdistiller`](https://github.com/qiulinfan/kgdistiller) product, which reads the
registered `.tex` companions as plain text. This repository is one local
instance, the base `notes`. Native LaTeX web output goes through the
obsidian-latex-live converter rather than this toolchain, and the website reads
only `courses.json` and the generated knowledge-marker registry, never
`.knowledge/`.

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
├── knowledge-ids.json      # stable knowledge-marker anchor IDs
├── generated/              # committed knowledge-marker registry (.typ/.json)
├── scripts/
│   ├── export.py           # one complete Typst entry -> temporary snapshots
│   ├── export_course.py    # split entry snapshots into chapter files
│   ├── check_web.py        # validate committed-site note HTML
│   ├── convert_latex_project.py # ElegantBook -> previewable Typst project
│   ├── export_latex_web.py # maintained LaTeX -> HTML via obsidian-latex-live
│   ├── knowledge_registry.py # knowledge-marker registry and LaTeX marker rows
│   ├── add_native_tex.py   # explicit Typst -> .tex companion migration
│   ├── check_native_tex.py # .typ/.tex pair audit and LaTeX compilation
│   ├── setup.sh            # install the runtime dependencies
│   ├── migrate_knowledge_markers.py # one-time metadata migration
│   └── migrate_latex.py    # legacy migration helper
├── filters/qlnotes.lua     # semantic Pandoc mapping
├── tests/                  # toolchain unit tests
└── latex/                  # shared native class, export class and template
```

Install or check the four runtime dependencies once:

```sh
make setup
make doctor
```

Daily commands live in each migrated course root:

```sh
make export              # ignored chapter .tex/.md snapshots
make web-check           # local ignored HTML + basic UTF-8/structure check
make                     # render/check all of this course's web entries
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
below `notes/`. CI builds the published courses' HTML from Typst as part of
`make check`; the homepage repository builds and publishes the site.

Markdown is intentionally lossy. Semantic statements,
examples, proofs, remarks, notes, and solutions become ordinary `>` blockquotes;
knowledge definitions become `--[[Dominated convergence theorem]]--` and
references become `[[Dominated convergence theorem]]`. Inline math uses
`$...$`; every display formula uses line-delimited `$$` blocks.

Knowledge markers are a notes and homepage frontend convention: they become
public `#kn-<id>` website anchors and links, and kgdistiller does not read them.
They are authored directly in Typst:

```typst
#definition(title: [#kn[Norm] and #kn[Semi-norm]])[
  ...
]

Later, #ref[Norm] links back to that unique
definition.
```

Each authored `#kn` identifies one independently reusable concept and is
globally unique; a title that defines several concepts contains several `#kn`
markers. `#ref` may occur anywhere and uses the same name. A file gets a
meaningful `#ref` when it directly uses an immediate prerequisite whose
authority is another file; same-file concepts and transitive ancestors do not
need one. A marker's ID is its exact spelling's entry in `knowledge-ids.json`,
otherwise the slug of the spelling. After editing markers, run
`make knowledge-registry` at the repository root to regenerate
`generated/knowledge-registry.{typ,json}`; `make check` verifies both are
current.

Markdown notes use `--[[Name]]--` for the canonical `kn` and `[[Name]]` or
`[[Name|display]]` for refs; the homepage resolves them. LaTeX sources use
`\kn{Name}` and `\knref{Name}`; `knowledge_registry.py` hands them to
obsidian-latex-live as marker rows during LaTeX web export, and
`migrate_latex.py` preserves them as Typst `#kn`/`#ref` when migrating LaTeX
chapters.

For an ElegantBook LaTeX course, pass its `main.tex` to
`convert_latex_project.py`. The adapter expands direct chapter inputs and
creates an ignored self-contained Typst project with `main.typ`, local QLNotes
runtime, copied assets, and preview Makefile. Native LaTeX web export does not
use that project: `export_latex_web.py` sends the LaTeX document directly to
obsidian-latex-live.

Knowledge records live in the repository-root `.knowledge/` of the
kgdistiller base `notes`, not in the sources. kgdistiller reads each registered
`.tex` source as plain text with line numbers and never parses markers; a formal
statement becomes a record only through reviewed capture or compile. Install
the selected `kgdistiller` product revision before authoring records. Draft
them with the `capture-kgdistiller` Skill (one item while reading) or the
`compile-knowledge-sheets` Skill (a bounded part of a source), accept them with
`kgd accept` or by ticking them in the source's sheet and running
`kgd harvest`, then validate and index from the repository root:

```sh
make knowledge-authoring-check   # kgd check --base notes
make knowledge-fix-lines         # after source edits move cited lines
make knowledge-index             # kgd index
make knowledge-search QUERY="dominated convergence"
```

A record is reported as moved when its Evidence quote now sits at other lines
of its source, and as stale when the quote no longer occurs there; a stale
record needs a reviewed update. `make check`, the Typst release, and CI never
run kgdistiller.

CeTZ remains the diagram authority. Markdown and the web use SVG; editable
LaTeX snapshots use portable derived PNG assets so export never creates a PDF
inside `notes/`. The exporter never reconstructs TikZ.
