# notes agent guidance

This is the development runbook for agents working in this repository.
`README.md` belongs to the owner and is written for readers: edit it only when
the owner asks, and keep development documentation here. The READMEs inside
`notes/` are note content.

## Rules

- This repository is the authority for personal notes (`notes/`) and one personal kgdistiller instance (`knowledge/`). It is not the kgdistiller product checkout: never vendor or submodule the engine.
- The homepage repository `qiulinfan/qiulinfan.github.io` consumes this repository as its `notes` dock and is the only publisher. Never enable GitHub Pages here, and never add site frontend or deployment code here.
- Refreshing the knowledge instance is an explicit local authoring operation through an installed, selected kgdistiller product revision. `make check` and CI only validate the committed export; they never run the engine.
- The export manifest records `https://github.com/qiulinfan/notes` as its source repository; keep that value when exporting.
- `notes/math/toolchain/web.css` is the standalone projection of the homepage palette (`site/src/styles/variables.styl` in the homepage repository). The homepage build verifies the pair, so change both together.
- A course is published only through `knowledge/sources.json` (`publish`, `listed`, `web_artifacts`); `make web` derives its build list from that registry.
- Native LaTeX web export uses `notes/math/toolchain/scripts/export_latex_web.py`
  and `kgdistiller export latex` with the obsidian-latex-live converter. Follow
  the selected product's `docs/latex-sources.md`; do not use Typst/Pandoc as this
  web route or register generated HTML as an authority. Explicit format
  migration tools remain separate.
- Validate changes with `make check`.
- Mathematics course sources have editable, same-directory `.typ` and `.tex`
  companions. Preserve their include structure and explicit knowledge markers.
  Registered pairs select TeX for knowledge authoring; source and topic globs
  admit both formats. Converted mathematical name spellings have explicit
  aliases in `knowledge/identities.json`, retaining the registered IDs.
- `notes/math/toolchain/latex/qlnotes-native.cls` is the shared XeLaTeX class.
  Course entry points load it by relative path; avoid copying classes per course.
  Run `make latex-check` for pair/include auditing and two-pass compilation of
  every entry (plus uncovered fragments). All outputs stay in
  `knowledge/build/native-tex/check`, outside the source-only `notes/` tree.
- `add_native_tex.py` is an explicit migration tool, not a synchronization job.
  It evaluates a disposable copy through Typst/MathML and the QLNotes filters;
  `.tex` companions are authored files afterward. Never regenerate an edited
  companion without requested replacement. Its `--replace` flag overwrites
  companions, including subsequent TeX-only layout edits. The migration checks
  every mathematical expression, knowledge marker and ignored backend element;
  its diagnostic and identity maps remain under `knowledge/build/native-tex`.
- Never place credentials in the repository or command output.

## Layout

- `notes/`: Markdown, Typst, and LaTeX sources with the shared rendering
  toolchain. Never commit PDFs, course archives, or build outputs.
- `knowledge/`: one local kgdistiller instance, with its configuration,
  decisions, private graph, and adopted static export. Its authority, public
  bundle contract, and adoption flow are in `knowledge/SPEC.md` and
  `knowledge/WORKFLOW.md`.
- The homepage repository builds the site: it reads this repository as the
  `notes` dock and publishes it at `https://qiulinfan.github.io/notes/`.
  Enabling GitHub Pages here would make this project site take over that path
  and hide the homepage's notes section.

## Publishing

1. Commit and push to `main`.
2. The pre-push hook checks the registered sources. When they changed, it syncs
   the private graph, refreshes the static export, commits automatically, and
   stops the push; run `git push` again.
3. CI runs `make check`: export validation, the source policy, and the Typst
   web build of published courses.
4. When the checks pass, CI triggers the homepage Pages workflow, which rebuilds
   from the latest `main` here.

Step 4 needs the repository secret `HOMEPAGE_DISPATCH_TOKEN`, a fine-grained
personal access token scoped to `qiulinfan/qiulinfan.github.io` with only
Actions read and write; the owner replaces it when it expires. A failed check
triggers no homepage build, so the site keeps its last successful deployment.
Local preview needs no push: the homepage dev server reads the sibling
`../notes` working copy.

Run `make hooks-install` once per machine to enable the pre-push hook. A dirty
worktree, sync results that need human review, and changes outside the expected
generated directories fail closed; files outside the source registry are never
discovered or ingested.

## Checks and builds

`make check` runs what CI runs. `make web` runs `make release` for every course
in `knowledge/sources.json` that is published and has `web_artifacts`. The
Typst version is pinned once, as `TYPST_VERSION` in the `Makefile`; this
repository's CI and the homepage build both read it.

## Refreshing the knowledge instance

Only knowledge authoring or adopting a new product version needs the installed
kgdistiller CLI:

```sh
make knowledge-build
make knowledge-authoring-check

kgdistiller --repo-root . export site \
  --output knowledge/export/site \
  --product-commit <full-kgdistiller-commit> \
  --source-repository https://github.com/qiulinfan/notes \
  --replace
make knowledge-check
```

Before exporting, commit the sources, the registry, and the private graph as
one clean commit; the manifest pins that source commit and the clean
kgdistiller commit that ran the export. After validation, commit the four-file
static bundle as a second commit. A dirty checkout is refused.

## Obsidian vault

The repository root is an Obsidian vault usable on macOS, Windows, and Linux.
`.obsidian/` commits app settings, hotkeys, the enabled plugin list, and
credential-free plugin settings; open the root with **Open folder as vault**.
Each machine must trust the vault and allow community plugins, which are
installed from the official community plugin browser and never committed.
YOLO's `data.json`, OAuth tokens, and `YOLO/` state are git-ignored and hold
credentials: never force them into Git.
