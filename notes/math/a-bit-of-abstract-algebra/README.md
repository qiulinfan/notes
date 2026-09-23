# (A Bit of) Abstract Algebra

`main.typ` is the public composition entry for the independently maintained
`modern-algebra/` authority. It includes that course's chapter and homework
sources without copying them. `modern-algebra/SOURCE-MANIFEST.md` and its
migration receipts remain the provenance authority; shared presentation and
export code lives in `../toolchain/`.

```sh
make edit       # open the ready-to-use VS Code/Tinymist workspace
make            # render from the adopted registry and check HTML
make export     # optional local LaTeX and Markdown snapshots
make web-check  # ignored local HTML plus basic integrity checks
```

Published route:
<https://qiulinfan.github.io/notes/math/a-bit-of-abstract-algebra/>

Generated snapshots are written to ignored `exports/latex/` and
`exports/markdown/`. HTML and intermediates stay under ignored `build/`;
`notes/` never contains PDFs.
