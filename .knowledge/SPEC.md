# notes knowledge-instance contract

This `notes` repository is one personal kgdistiller instance. It owns personal
inputs, reviewed identity decisions and durable private graph state. It does
not own the kgdistiller engine, product Skills, agents, workflow implementation,
or tests. kgdistiller has no publishing role here: the notes website is driven
by the repository-root `courses.json` and the generated knowledge-marker
registry, neither of which reads `.knowledge/`.

## Authorities

- `sources.json` defines the kgdistiller sources only: each source has an `id`,
  a `root`, its `files` globs and an optional `document_type`, plus optional
  top-level user `document_types`. Publishing data (titles, fields, topics,
  web routes, publish/listed policy) lives in `courses.json`.
- `entries/*.md` is the single stored copy of each accepted knowledge entry.
- Optional `identities.json` and `alignments.json` retain nonempty reviewed
  naming and cross-space identity decisions; empty registries are not required.
- `graph/` contains accepted node metadata, semantic edges, source references
  and the generation manifest. Graph v2 reads entry bodies from their Markdown
  authorities instead of storing JSONL copies. Naming decisions, orphan states
  and semantic edges cannot be reconstructed from source markers alone.
- `notes/` contains the authored Markdown, Typst, and LaTeX source material.

Candidates, reviews, temporary receipts, and other disposable local build
artifacts belong under the ignored `.knowledge/build/` directory. There is no
local runtime/search index. These files are not authorities.
The configured `build/obsidian/semantic-graph.json` remains an active local
plugin input, regenerated with `kgdistiller --repo-root . export obsidian`.
Do not clear all build outputs merely because they are generated.
`store.json` and `documents.jsonl` belong only to an explicitly requested
portable snapshot, not the daily knowledge working set.
