# Mathematics notes

数学笔记按课程独立维护，并可用只含组合逻辑的 Typst 入口汇成公开阅读合集。
Probability 与 Measure Theory 继续独立发布；新迁入的六门课程保留各自的来源
清单与权威目录，同时组合为三个公开页面。零散的旧 Markdown 笔记可在整理后
单独注册。历史 PDF、MkDocs 页面和课程归档均不再保留。

## Typst-first 课程与公开合集

每个课程根目录都是可直接编辑的 Typst 工程：

```text
course/
├── main.typ / secondary.typ
├── chapters/*.typ
├── homeworks/*.typ
├── assets/
├── reference.bib
├── Makefile
├── build/                 # ignored HTML
└── exports/               # ignored optional local snapshots
```

模板、数学 alias、网页样式和导出程序只维护一份，位于
[`toolchain/`](toolchain/README.md)。Typst 是现役课程的权威源；需要时可以在本地
生成 LaTeX/Markdown 快照，但这些可再生产物不进入 Git。三个合集入口只
`include` 原课程文件，不复制正文，也不取代各课程的 `SOURCE-MANIFEST.md`。

```sh
make export
make web-check
```

知识节点标记只是网站的锚点与链接约定：Typst 中用唯一的 `#kn[名称]` 标记定义，
其他位置用 `#ref[名称]` 链回原定义；`.tex` 伴随文件用 `\kn{名称}` 与 `\knref{名称}`。
锚点 ID 取自 [`toolchain/knowledge-ids.json`](toolchain/knowledge-ids.json)，否则为
名称的 slug；修改标记后在仓库根目录运行 `make knowledge-registry`，重新生成
`toolchain/generated/` 下的标记注册表。网站只读取 `courses.json` 与这份注册表，
从不读取知识库。

知识库是仓库根目录 `.knowledge/` 中的 kgdistiller base `notes`：已验收记录位于
`entries/`，草稿位于 `drafts/`，各来源的清单位于 `sheets/`。kgdistiller 只把注册的
`.tex` 文件当作带行号的纯文本，不解析标记；记录只来自经过审阅的 capture 或
compile，普通章节、例题、未标记陈述乃至标记本身都不会自动成为节点。
需要更新知识库时，先安装选定版本的独立 `kgdistiller` 产品，用 `capture-kgdistiller`
或 `compile-knowledge-sheets` Skill 起草记录，经 `kgd accept` 或 `kgd harvest`
验收后，在仓库根目录显式运行 `make knowledge-authoring-check` 与
`make knowledge-index`；源文件改动使引用行移动时先运行 `make knowledge-fix-lines`，
检索用 `make knowledge-search QUERY=...`。普通 `make` 不启动知识图谱引擎。

课程本地 HTML、快照与编译中间文件均被忽略；`notes/` 下不允许存在任何 PDF。
CI 运行 `make check`（其中包括从 Typst 源构建已发布课程的 HTML），通过后触发主页
仓库重新构建；网站由主页仓库统一发布，本仓库不开启 GitHub Pages：

- Probability: <https://qiulinfan.github.io/notes/math/probability/>
- Measure Theory: <https://qiulinfan.github.io/notes/math/measure-theory/>
- Everything About Linear Algebra: <https://qiulinfan.github.io/notes/math/everything-about-linear-algebra/>
- Single and Multivariate Mathematical Analysis: <https://qiulinfan.github.io/notes/math/single-and-multivariate-mathematical-analysis/>
- (A Bit of) Abstract Algebra: <https://qiulinfan.github.io/notes/math/a-bit-of-abstract-algebra/>

数学课程在同一目录维护可编辑的 `.typ` 与 `.tex` 伴随文件。`.tex` 的网页导出由
`toolchain/scripts/export_latex_web.py` 直接交给 obsidian-latex-live 的
`latex-live-export`，不经过 Typst。根目录的 `make notes-source-check` 会阻止任何 PDF
重新进入 `notes/`。
