# notes agent guidance

- This repository is the authority for personal notes (`notes/`) and one personal kgdistiller instance (`knowledge/`). It is not the kgdistiller product checkout: never vendor or submodule the engine.
- The homepage repository `qiulinfan/qiulinfan.github.io` consumes this repository as its `notes` dock and is the only publisher. Never enable GitHub Pages here, and never add site frontend or deployment code here.
- Refreshing the knowledge instance is an explicit local authoring operation through an installed, selected kgdistiller product revision. `make check` and CI only validate the committed export; they never run the engine.
- The export manifest records `https://github.com/qiulinfan/notes` as its source repository; keep that value when exporting.
- `notes/math/toolchain/web.css` is the standalone projection of the homepage palette (`site/src/styles/variables.styl` in the homepage repository). The homepage build verifies the pair, so change both together.
- A course is published only through `knowledge/sources.json` (`publish`, `listed`, `web_artifacts`); `make web` derives its build list from that registry.
- Validate changes with `make check`.
- Never place credentials in the repository or command output.
