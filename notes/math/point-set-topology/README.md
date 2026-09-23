# Point-Set Topology

`main.typ` is the authority. Chapter sources live in `chapters/`; shared
presentation and export code lives in `../toolchain/`.

```sh
make edit       # open the ready-to-use VS Code/Tinymist workspace
make            # render from the adopted registry and check HTML
make export     # optional local LaTeX and Markdown snapshots
make web-check  # ignored local HTML plus basic integrity checks
```

Generated snapshots are written to ignored `exports/latex/` and
`exports/markdown/`. HTML and intermediates stay under ignored `build/`;
`notes/` never contains PDFs.
