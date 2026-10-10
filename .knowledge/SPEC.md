# notes knowledge-instance contract

This `notes` repository is one personal kgdistiller instance. It owns personal
inputs and the reviewed knowledge entries and edges. It does not own the
kgdistiller engine, product Skills, agents, workflow implementation, or tests.
kgdistiller has no publishing role here: the notes website is driven by the
repository-root `courses.json` and the generated knowledge-marker registry,
neither of which reads `.knowledge/`.

## Layout

- `sources.json` defines the kgdistiller sources only: each source has an `id`,
  a `root`, its `files` globs and an optional `document_type`, plus the
  top-level user `document_types`. It registers the mathematics courses' `.tex`
  files with the document type `math-notes` (allowed entry kinds and extraction
  guidance) and the CS courses' Markdown notes without a document type yet. Publishing data (titles, fields, topics, web routes,
  publish/listed policy) and the `.typ` companions live in `courses.json`.
- `vault.json` identifies this vault to kgdistiller.
- `entries/<id>.md` is the single stored copy of each knowledge node. Its
  frontmatter holds `schema`, `id`, `label`, `kind`, `aliases`, `source` (a
  repository-relative `.tex` path), `line_start`, `line_end` and
  `understanding`; its body holds the Summary and the other reviewed sections,
  and its `Evidence` section quotes the cited source lines verbatim.
- `edges.jsonl` holds the accepted semantic edges, one JSON object per line
  with exactly `source`, `relation`, `target`, `origin`, `confidence` and
  `evidence`. Its endpoints are entry ids.
- `notes/` contains the authored source material. kgdistiller reads each
  registered source as plain text with line numbers and never parses markers or
  other syntax.

There is no identity registry, alignment file, graph directory, derived
evidence or portable snapshot: everything a node needs lives in its entry.

Reviews, receipts and other disposable local build artifacts belong under the
ignored `.knowledge/build/` directory; they are not authorities. The
`build/obsidian/semantic-graph.json` feed remains an active local plugin input,
regenerated with `kgdistiller --repo-root . export obsidian`. Do not clear all
build outputs merely because they are generated.
