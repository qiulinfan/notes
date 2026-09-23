# Single and Multivariate Mathematical Analysis

`main.typ` is the public composition entry for the independently maintained
`mathematical-analysis/` and `multivariate-analysis/` authorities. It includes
their lecture and homework sources without copying them. Their
`SOURCE-MANIFEST.md` files remain the page-level provenance authority; shared
presentation and export code lives in `../toolchain/`.

```sh
make edit       # open the ready-to-use VS Code/Tinymist workspace
make            # render from the adopted registry and check HTML
make export     # optional local LaTeX and Markdown snapshots
make web-check  # ignored local HTML plus basic integrity checks
```

Published route:
<https://qiulinfan.github.io/notes/math/single-and-multivariate-mathematical-analysis/>

Generated snapshots are written to ignored `exports/latex/` and
`exports/markdown/`. HTML and intermediates stay under ignored `build/`;
`notes/` never contains PDFs.
