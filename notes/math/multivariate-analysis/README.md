# Multivariate Analysis

`main.typ` and `homeworks.typ` are the authority entries. Chapter sources live
in `chapters/`, homework sources in `homeworks/`, and shared presentation and
export code lives in `../toolchain/`. `SOURCE-MANIFEST.md` maps each selected
source page to its destination and records exact outstanding work. `HW06`,
`HW11`, and a compiled IBL PDF do not exist and are not fabricated.

```sh
make edit       # open the ready-to-use VS Code/Tinymist workspace
make            # render from the adopted registry and check HTML
make export     # optional local LaTeX and Markdown snapshots
make web-check  # ignored local HTML plus basic integrity checks
make            # validates lecture and homework entries
```

Generated snapshots are written to ignored `exports/latex/` and
`exports/markdown/`. HTML and intermediates stay under ignored `build/`;
`notes/` never contains PDFs.
