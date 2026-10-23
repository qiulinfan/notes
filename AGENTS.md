# notes agent guidance

This is the development runbook for agents working in this repository.
`README.md` belongs to the owner and is written for readers: edit it only when
the owner asks, and keep development documentation here. The READMEs inside
`notes/` are note content.

## Rules

- This repository is the authority for personal notes (`notes/`), the notes
  website's course registry (`courses.json`), and the personal kgdistiller
  base `notes` (`.knowledge/`). It is not the kgdistiller product checkout:
  never vendor or submodule the engine. kgdistiller manages knowledge only; it
  has no publishing role, and nothing on the website reads `.knowledge/`.
- The homepage repository `qiulinfan/qiulinfan.github.io` consumes this repository as its `notes` dock and is the only publisher. Never enable GitHub Pages here, and never add site frontend or deployment code here.
- `courses.json` (schema `notes-courses-v1`) is the website registry: each
  course's title, description, subject, course slug, `root`, `files`, `fields`,
  `topics`, `web`, `publish`, `listed` and `web_artifacts`, plus the field
  labels. `make web` and the homepage dock read it. A course is published only through its `publish`, `listed` and
  `web_artifacts` there. The marker registry covers only published courses,
  so after changing `publish`, run `make knowledge-registry` and commit the
  regenerated files in `notes/math/toolchain/generated/`.
- The kgdistiller base `notes` is registered outside this repository, in the
  kgdistiller home (`$KGDISTILLER_HOME`, default `~/.knowledge`), whose
  `config.json` lists the document types its records may use: `math-notes`
  for the mathematics courses and `cs-notes`, an owner-reviewable draft type,
  for the CS notes. Every `.md`, `.tex` and `.txt` file of this repository
  outside hidden directories is a source; each record names its type in its
  `type:`. The types themselves are `~/.knowledge/types/<name>.md`.
  kgdistiller reads every source as plain text with line numbers, except for
  its knowledge markers.
- Knowledge is a set of records in kgdistiller's record format: YAML
  frontmatter followed by a Markdown body, one file per record, the id being
  the file stem. The frontmatter holds `label`, `kind`, `source` (a
  repository-relative registered source), `lines` (`a` or `a-b`) and
  optionally `aliases`, `understanding`, `epistemic` and `requires`; a
  relation also holds its role keys (for example `prerequisite` and
  `dependent`), each a list of quoted `"[[id]]"` links or plain pending terms.
  The body is prose, an optional `## Search terms` section and a final
  `## Evidence` section of blockquotes that quote the cited source lines
  verbatim. Nodes and relations both live in `.knowledge/entries/`; proposed
  new records are drafts in `.knowledge/drafts/`, and `kgd sheet` writes
  generated per-source sheets to `.knowledge/sheets/`. There is no separate
  edge file. Records are human-editable Markdown, also in Obsidian.
- Knowledge markers serve both the website and kgdistiller. They are LaTeX
  `\kn{NAME}`, `\kn[NAME]{TEXT}` (defines NAME and shows TEXT, which may be
  empty) and `\knref{NAME}`, and Markdown `--[[NAME]]--`, `--[[NAME|TEXT]]--`
  and `[[NAME]]` (resolved by the homepage). On the website they are anchors
  and links; kgdistiller resolves a definition marker's NAME to the record
  whose label, alias or id it is, to find the record again after its source
  is edited or moved. Markers never create knowledge entries. A marker's ID is its
  exact spelling's entry in `notes/math/toolchain/knowledge-ids.json`, otherwise
  the slug of the spelling. These IDs are public `#kn-<id>` anchors; keep them
  stable. The map retains earlier public spellings as explicit aliases.
  `notes/math/toolchain/scripts/knowledge_registry.py` generates the committed
  `notes/math/toolchain/generated/knowledge-registry.json` from the published
  courses' TeX definitions. The homepage reads it to link Markdown references.
  Run `make knowledge-registry` after editing markers; `make check` verifies
  freshness. Duplicate published names or IDs and stale map entries fail the
  registry build. Other TeX marker problems are warnings in the registry and
  failures in the direct web export. Comments, verbatim-like environments,
  `\verb`, inactive `\iffalse` branches and macro/environment definitions hold
  no LaTeX markers.
- Refreshing the knowledge base is an explicit local authoring operation through an installed, selected kgdistiller product revision. `make check` and CI never run the engine.
- `notes/math/toolchain/web.css` is the standalone projection of the homepage palette (`site/src/styles/variables.styl` in the homepage repository). The homepage build verifies the pair, so change both together.
- Native LaTeX web export uses `notes/math/toolchain/scripts/export_latex_web.py`,
  which sends one document request directly to the obsidian-latex-live
  converter `latex-live-export` (or the JSON argv in
  `LATEX_LIVE_EXPORT_COMMAND`) with the LaTeX marker rows from
  `knowledge_registry.py`. Do not use Typst/Pandoc as this web route or
  register generated HTML as an authority.
- Validate changes with `make check`.
- Mathematics course sources are authored `.tex` files only. Preserve their
  include structure and explicit knowledge markers; never regenerate them from
  another format. Alternative names are aliases in knowledge records.
- `notes/math/toolchain/latex/qlnotes-native.cls` is the shared XeLaTeX class.
  Course entry points load it by relative path; avoid copying classes per course.
  Run `make latex-check` to audit TeX inputs and compile every entry twice (plus
  uncovered fragments). All outputs stay in the ignored repository-root
  `build/native-tex/check`, outside the source-only `notes/` tree.
- Course `make release` commands export authored TeX directly through
  `export_latex_web.py`, then validate the standalone HTML. Outputs stay in
  `build/latex-web/<course>/`; `courses.json` lists paths relative to each course
  root. The homepage permits artifacts anywhere inside this repository.
- `notes/math/toolchain/scripts/setup_latex_web_ci.sh` installs TeX and a pinned
  obsidian-latex-live converter on disposable GitHub Actions runners. Both this
  repository and the homepage use it. Local prerequisites can be checked with
  `make -C notes/math/toolchain doctor`.
- Wrap opaque drawing calls (for example literal `\csname` diagram macros) in
  the shared `qldrawing` environment so the converter renders them through TeX
  and SVG. Keep captions and their knowledge links outside the drawing wrapper.
  Probability's web check verifies that all 14 native drawings survive export.
- Web build directories use the authoring root's directory name, independent of
  a course's public slug. Keep `web_artifacts` paths aligned with that directory.
- Never place credentials in the repository or command output.

## Layout

- `notes/`: Markdown and LaTeX sources with the shared rendering
  toolchain. Never commit PDFs, course archives, or build outputs.
- `courses.json`: the website's course registry.
- `.knowledge/`: the knowledge of the kgdistiller base `notes`, and nothing
  else: the accepted records in `entries/`, the drafts in `drafts/` and the
  generated sheets in `sheets/`. Its source globs and document types live in
  the kgdistiller home. Its rules and authoring flow are in
  [Knowledge base](#knowledge-base).
- `build/`: ignored, disposable local outputs: the native TeX
  check outputs in `build/native-tex/` and local review inputs in
  `build/reviews/`. Nothing in it is an authority.
- The homepage repository builds the site: it reads this repository as the
  `notes` dock and publishes it at `https://qiulinfan.github.io/notes/`.
  Enabling GitHub Pages here would make this project site take over that path
  and hide the homepage's notes section.

## Publishing

1. Commit and push to `main`. There is no export, adoption step or pre-push
   hook.
2. CI runs `make check`: the source policy, the knowledge-marker registry
   freshness check, and the direct LaTeX web build of published courses.
3. When the checks pass, CI triggers the homepage Pages workflow, which rebuilds
   from the latest `main` here.

Step 3 needs the repository secret `HOMEPAGE_DISPATCH_TOKEN`, a fine-grained
personal access token scoped to `qiulinfan/qiulinfan.github.io` with only
Actions read and write; the owner replaces it when it expires. A failed check
triggers no homepage build, so the site keeps its last successful deployment.
Local preview needs no push: the homepage dev server reads the sibling
`../notes` working copy.

## Checks and builds

`make check` runs what CI runs: `notes-source-check`,
`knowledge-registry-check` and `web`. `make web` runs `make release` for every
course in `courses.json` that is published and has `web_artifacts`. The direct LaTeX web
converter revision is pinned in `setup_latex_web_ci.sh`, which both CI builds
use. Run the toolchain tests
with `python3 -m unittest discover -s notes/math/toolchain/tests`.

## Knowledge base

This repository holds one personal kgdistiller base, `notes`. It
owns the personal note sources and the reviewed knowledge records. It does not
own the kgdistiller engine, product Skills, agents, workflows or tests. The
notes website does not depend on it: it is driven by `courses.json` and the
generated knowledge-marker registry, neither of which reads `.knowledge/`.

- Source registration and document types live in the kgdistiller home, not
  here. Each type (node kinds, relation kinds with their roles, epistemic
  values and extraction guidance) is `~/.knowledge/types/<name>.md`. Every
  record's `kind` and role keys must be registered in its source's type.
- `.knowledge/` holds only `entries/`, `drafts/` and `sheets/`. kgdistiller
  reads each registered source as plain text with line numbers and never
  parses markers or other syntax. There is no identity registry, alignment
  file, graph directory, derived evidence or portable snapshot: everything a
  record needs lives in its file.

### Decisions

These are decisions of this personal base, not kgdistiller product
defaults.

- Identity comes from the reviewed entries: each entry's id, label and aliases.
  Knowledge markers in the sources are website anchors and do not establish
  identity. Text or graph similarity retrieves evidence; it does not establish
  identity.
- Ambiguous or contradictory identity decisions stay unresolved until reviewed
  and are never auto-promoted to aliases.
- For mathematics courses the `.tex` files are knowledge sources. CS course
  Markdown stays registered.
- Paper distillation changes the personal records or notes only on an
  explicit owner request, as drafts that the owner accepts with `kgd accept`
  (or `kgd harvest`). Changing the notes website (`courses.json`, the
  generated marker registry) needs an explicit owner request.
- Do not import solvablemodel paper nodes C02, C07, C09, C12, C15, C16, C17,
  C19, C20, or other paper nodes into this personal knowledge base under
  the prior evaluation decision.
- Do not write knowledge markers back into the solvablemodel paper sources
  under the prior evaluation decision.
- On 2026-10-11 the owner retired all 316 knowledge nodes and 219 relations
  and restarted this base empty, preserving the original notes. Build the
  knowledge base incrementally through small, explicitly selected items and
  test their usefulness before expanding. Do not restore the retired records
  or bulk-import earlier experiment proposals without an explicit request.

### Refreshing the knowledge base

`make check` and CI consume committed data only; they never invoke
kgdistiller. Only knowledge authoring needs the installed kgdistiller CLI
(`kgd`), from an intentionally selected product revision. Nothing scans the
sources automatically:

1. Capture one item while reading with the `capture-kgdistiller` Skill, or
   draft the records of a bounded part of a source with the
   `compile-knowledge-sheets` Skill. New records are written as drafts in
   `.knowledge/drafts/`; `kgd sheet <source>` lists a source's records,
   pending terms and drafts.
2. Accept drafts with `kgd accept <draft>...`, or tick them in the source's
   sheet and run `kgd harvest <sheet>`. Accepted records are edited in place
   and never re-serialized; deleting a draft rejects it.
3. Validate and index:

```sh
make knowledge-authoring-check   # kgd check --base notes
make knowledge-fix-lines         # after source edits move cited lines
make knowledge-index             # kgd index
```

`make knowledge-authoring-check` reports a record as moved when its Evidence
quote now sits at other lines of its source, and as stale when the quote no
longer occurs there; a stale record needs a reviewed update. `make
knowledge-search QUERY="..."` searches the index. The kgdistiller Obsidian
plugin reads the records' live metadata, so there is no export step;
reinstall it with `kgd obsidian install --base notes` when the product
changes it. The command also turns on the plugin's hidden-folder indexing of
`.knowledge/`. The plugin is desktop only. Leave Obsidian's **New link
format** unset (shortest) or set it to absolute: relative links write `../`
paths that record links reject, and the install command warns about them.
Do not guess identity from similarity. None of this affects the website.

## Obsidian vault

The repository root is an Obsidian vault usable on macOS, Windows, and Linux.
Open the root with **Open folder as vault**. Personal vault, editor, and agent
configuration stays local: never track `.obsidian/`, `.vscode/`, `.codex/`,
other personal environment directories, or `*.code-workspace` files in this
public repository. Keep their ignore rules without allowlist exceptions.
Each machine must trust the vault and allow community plugins, which are
installed from the official community plugin browser and never committed.
The one exception is kgdistiller's plugin: `kgd obsidian install` installs
it from the product rather than the community browser, and it is never
committed either.
YOLO's `data.json`, OAuth tokens, and `YOLO/` state are git-ignored and hold
credentials: never force them into Git.
