# notes

个人笔记与知识图谱仓库：

- [`notes/`](notes/)：Markdown、Typst、LaTeX 权威源与共享渲染工具链；不提交 PDF、课程归档或构建物。
- [`knowledge/`](knowledge/)：一个本地 kgdistiller 实例的个人配置、决策、私有图谱和已采用静态导出。

网站由主页仓库 [`qiulinfan.github.io`](https://github.com/qiulinfan/qiulinfan.github.io)
构建：它把本仓库作为 `notes` dock 读入，发布在 `https://qiulinfan.github.io/notes/`。
不要给本仓库开启 GitHub Pages，否则这个项目站点会占用同一路径，盖住主页的 notes 栏目。

## 发布流程

1. 在本仓库修改、提交并 push 到 `main`。
2. pre-push hook 先检查已登记来源；发现变化时同步私有图谱、刷新静态导出并自动提交，
   然后停止本次 push，再运行一次 `git push` 即可。
3. CI 运行 `make check`：导出校验、source policy 与已发布课程的 Typst 网页构建。
4. 检查通过后，CI 触发主页的 Pages workflow；主页重新构建时读取本仓库 `main` 的最新提交。

第 4 步需要仓库 secret `HOMEPAGE_DISPATCH_TOKEN`：一个 fine-grained personal access token，
只授权 `qiulinfan/qiulinfan.github.io`，只给 Actions 读写权限。token 过期后需要替换。
检查失败时不会触发主页构建，线上网站保留上一次成功部署的版本。

本地预览不需要 push：主页的 dev server 直接读取旁边的 `../notes` 工作副本。

## 检查与构建

```sh
make check
```

`make web` 为 `knowledge/sources.json` 中 `publish` 且带 `web_artifacts` 的每门课程运行
`make release`。Typst 版本只在 [`Makefile`](Makefile) 的 `TYPST_VERSION` 固定一次，
本仓库 CI 与主页构建都读取它。

## 显式刷新知识实例

只有知识创作或采用新产品版本时才需要已安装的 kgdistiller CLI：

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

采用时先把来源、registry 与私有图谱提交为一个 clean commit，再运行 export；
manifest 会锁定这个 source commit 与实际执行导出的 clean kgdistiller commit。验证通过后，
再用后一个 commit 提交四文件静态 bundle。dirty checkout 会被拒绝。

本机运行一次 `make hooks-install`，启用上面发布流程第 2 步的 pre-push hook。
dirty worktree、需要人工 review 的同步结果以及超出预期生成目录的修改都会 fail closed；
source registry 之外的文件不会被发现或摄入。

实例 authority、public bundle contract 与完整采用流程见
[`knowledge/SPEC.md`](knowledge/SPEC.md) 和
[`knowledge/WORKFLOW.md`](knowledge/WORKFLOW.md)。

## Obsidian Vault

仓库根目录本身就是可跨 macOS、Windows 与 Linux 打开的 Obsidian Vault。
`.obsidian/` 中提交应用设置、快捷键、启用的插件列表和不含凭据的插件设置，
clone 后用 Obsidian 的 **Open folder as vault** 选择仓库根目录即可复用配置。
首次打开时仍需确认信任 Vault 并允许 community plugins。

插件程序由官方 community plugin browser 按机器安装，不在本仓库重复发布。YOLO 的
`data.json`、OAuth token 与 `YOLO/` 运行状态被 `.gitignore` 排除，每台机器都要单独
填写 API key 或重新 OAuth 登录；不要把任何机器上的 YOLO 凭据强制加入 Git。
