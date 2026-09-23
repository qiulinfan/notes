# Measure theory notes

MATH 597: Real Analysis, Winter 2025. The Typst authority now lives directly in
this course directory: [`main.typ`](main.typ) contains the course sequence and
[`extras.typ`](extras.typ) contains supplementary material. Chapters, homeworks,
and extras remain independently readable `.typ` files.

```sh
make export              # generate local LaTeX / Markdown snapshots on demand
make web-check           # main HTML UTF-8 and structure check
make extras-web-check    # supplementary HTML check
make                     # render from the adopted registry and check HTML only
```

All reproducible local snapshots share one ignored `exports/` directory:

```text
exports/
├── latex/<entry>--<chapter>.tex
└── markdown/<entry>--<chapter>.md
```

There is no committed snapshot or whole-book export. Local HTML and
intermediates stay ignored; `notes/` never contains PDFs. GitHub Actions
publishes HTML directly to Pages.

Published notes: <https://qiulinfan.github.io/notes/math/measure-theory/>
