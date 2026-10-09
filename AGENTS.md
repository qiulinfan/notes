# notes agent guidance

This is the development runbook for agents working in this repository.
`README.md` belongs to the owner and is written for readers: edit it only when
the owner asks, and keep development documentation here. The READMEs inside
`notes/` are note content.

## Rules

- This repository is the authority for personal notes (`notes/`), the notes
  website's course registry (`courses.json`), and one personal kgdistiller
  instance (`.knowledge/`). It is not the kgdistiller product checkout: never
  vendor or submodule the engine. kgdistiller manages knowledge only; it has no
  publishing role, and nothing on the website reads `.knowledge/`.
- The homepage repository `qiulinfan/qiulinfan.github.io` consumes this repository as its `notes` dock and is the only publisher. Never enable GitHub Pages here, and never add site frontend or deployment code here.
- `courses.json` (schema `notes-courses-v1`) is the website registry: each
  course's title, description, subject, course slug, `root`, `files`, `fields`,
  `topics`, `web`, `publish`, `listed` and `web_artifacts`, plus the field
  labels. `make web`, the homepage dock and the `create-math-notes` Skill read
  it. A course is published only through its `publish`, `listed` and
  `web_artifacts` there. The marker registry covers only published courses,
  so after changing `publish`, run `make knowledge-registry` and commit the
  regenerated files in `notes/math/toolchain/generated/`.
- `.knowledge/sources.json` holds only kgdistiller sources:
  `{id, root, files, document_type?}` per source and optional top-level
  `document_types`; kgdistiller rejects any other key. Its identity registry
  `.knowledge/identities.json` concerns kgdistiller identity only.
- Knowledge markers are a notes and homepage frontend convention: Typst
  `#kn[...]`/`#ref[...]`, LaTeX `\kn{...}`/`\knref{...}`, and Markdown
  `--[[X]]--`/`[[X]]` (resolved by the homepage). A marker's ID is its exact
  spelling's entry in `notes/math/toolchain/knowledge-ids.json`, otherwise the
  slug of the spelling; the map also lists the extra spellings Typst
  references use. These IDs are public `#kn-<id>` anchors, so keep them stable.
  `notes/math/toolchain/scripts/knowledge_registry.py` generates the committed
  `notes/math/toolchain/generated/knowledge-registry.typ` and its JSON twin
  `knowledge-registry.json` (which the homepage reads to link Markdown `[[X]]`
  references to these anchors) from the published courses' Typst
  definitions; run `make knowledge-registry` after editing markers, and
  `make check` verifies both are current. The generator fails only on what
  the registry needs (published Typst definitions, duplicate Typst names,
  stale map entries). LaTeX marker problems, such as an unresolved `\knref`,
  and unresolved published Typst `#ref`s are printed as warnings; a Typst one
  renders as plain text, and a LaTeX one fails the LaTeX web export.
  Comments, verbatim-like environments, `\verb`, inactive `\iffalse` branches
  and macro or environment definitions hold no LaTeX markers.
- Refreshing the knowledge instance is an explicit local authoring operation through an installed, selected kgdistiller product revision. `make check` and CI never run the engine.
- `notes/math/toolchain/web.css` is the standalone projection of the homepage palette (`site/src/styles/variables.styl` in the homepage repository). The homepage build verifies the pair, so change both together.
- Native LaTeX web export uses `notes/math/toolchain/scripts/export_latex_web.py`,
  which sends one document request directly to the obsidian-latex-live
  converter `latex-live-export` (or the JSON argv in
  `LATEX_LIVE_EXPORT_COMMAND`) with the LaTeX marker rows from
  `knowledge_registry.py`. Do not use Typst/Pandoc as this web route or
  register generated HTML as an authority. Explicit format migration tools
  remain separate.
- Validate changes with `make check`.
- Mathematics course sources have editable, same-directory `.typ` and `.tex`
  companions. Preserve their include structure and explicit knowledge markers.
  Registered pairs select TeX for knowledge authoring; source globs admit both
  formats. Converted mathematical name spellings have explicit aliases in
  `.knowledge/identities.json`, retaining the registered IDs.
- `notes/math/toolchain/latex/qlnotes-native.cls` is the shared XeLaTeX class.
  Course entry points load it by relative path; avoid copying classes per course.
  Run `make latex-check` for pair/include auditing and two-pass compilation of
  every entry (plus uncovered fragments). All outputs stay in
  `.knowledge/build/native-tex/check`, outside the source-only `notes/` tree.
- `add_native_tex.py` is an explicit migration tool, not a synchronization job.
  It evaluates a disposable copy through Typst/MathML and the QLNotes filters;
  `.tex` companions are authored files afterward. Never regenerate an edited
  companion without requested replacement. Its `--replace` flag overwrites
  companions, including subsequent TeX-only layout edits. The migration checks
  every mathematical expression, knowledge marker and ignored backend element;
  its diagnostic and identity maps remain under `.knowledge/build/native-tex`.
- Never place credentials in the repository or command output.

## Layout

- `notes/`: Markdown, Typst, and LaTeX sources with the shared rendering
  toolchain. Never commit PDFs, course archives, or build outputs.
- `courses.json`: the website's course registry.
- `.knowledge/`: one local kgdistiller instance, with its configuration,
  decisions and private graph. Its authority and refresh flow are in
  `.knowledge/SPEC.md` and `.knowledge/WORKFLOW.md`.
- The homepage repository builds the site: it reads this repository as the
  `notes` dock and publishes it at `https://qiulinfan.github.io/notes/`.
  Enabling GitHub Pages here would make this project site take over that path
  and hide the homepage's notes section.

## Publishing

1. Commit and push to `main`. There is no export, adoption step or pre-push
   hook.
2. CI runs `make check`: the source policy, the knowledge-marker registry
   freshness check, and the Typst web build of published courses.
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
course in `courses.json` that is published and has `web_artifacts`. The
Typst version is pinned once, as `TYPST_VERSION` in the `Makefile`; this
repository's CI and the homepage build both read it. Run the toolchain tests
with `python3 -m unittest discover -s notes/math/toolchain/tests`.

## Refreshing the knowledge instance

Only knowledge authoring needs the installed kgdistiller CLI:

```sh
make knowledge-build
make knowledge-authoring-check
kgdistiller --repo-root . export obsidian
```

The last command refreshes the Obsidian plugin's graph feed under the ignored
`.knowledge/build/obsidian/`. Nothing syncs the private graph automatically;
refresh it before committing source changes whose knowledge should be current.
None of this affects the website.

## Obsidian vault

The repository root is an Obsidian vault usable on macOS, Windows, and Linux.
Open the root with **Open folder as vault**. Personal vault, editor, and agent
configuration stays local: never track `.obsidian/`, `.vscode/`, `.codex/`,
other personal environment directories, or `*.code-workspace` files in this
public repository. Keep their ignore rules without allowlist exceptions.
Each machine must trust the vault and allow community plugins, which are
installed from the official community plugin browser and never committed.
YOLO's `data.json`, OAuth tokens, and `YOLO/` state are git-ignored and hold
credentials: never force them into Git.
