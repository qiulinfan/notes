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

知识节点在 Typst 中用唯一的 `#kn[名称]` 标记，其他位置用
`#ref[名称]` 链回原定义。内部稳定 ID 由同步程序在源文件之外维护。私有实例图位于
仓库根目录的 `knowledge/graph/`，网站和普通笔记构建只读取已验收的
`knowledge/export/site/`；普通章节、例题和未标记陈述不会自动成为节点。
需要刷新图谱时，先安装选定版本的独立 `kgdistiller` 产品，再显式运行
`make knowledge-subject SUBJECT=math`、`make knowledge-course COURSE=measure-theory`
或 `make knowledge-file FILE=...`。普通 `make` 不启动知识图谱引擎。

课程本地 HTML、快照与编译中间文件均被忽略；`notes/` 下不允许存在任何 PDF。
GitHub Actions 从 Typst 源构建 HTML，并只把构建产物发布到 GitHub Pages：

- Probability: <https://qiulinfan.github.io/notes/math/probability/>
- Measure Theory: <https://qiulinfan.github.io/notes/math/measure-theory/>
- Everything About Linear Algebra: <https://qiulinfan.github.io/notes/math/everything-about-linear-algebra/>
- Single and Multivariate Mathematical Analysis: <https://qiulinfan.github.io/notes/math/single-and-multivariate-mathematical-analysis/>
- (A Bit of) Abstract Algebra: <https://qiulinfan.github.io/notes/math/a-bit-of-abstract-algebra/>

未来确有必要时仍可维护 `.tex` 权威源，但唯一预览路径是
`LaTeX -> Typst -> HTML`。根目录的 `make notes-source-check` 会阻止任何 PDF
重新进入 `notes/`。
