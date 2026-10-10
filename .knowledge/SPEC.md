# notes knowledge-instance contract

This `notes` repository is one personal kgdistiller instance. It owns personal
inputs and the reviewed knowledge entries and edges. It does not own the
kgdistiller engine, product Skills, agents, workflow implementation, or tests.
kgdistiller has no publishing role here: the notes website is driven by the
repository-root `courses.json` and the generated knowledge-marker registry,
neither of which reads `.knowledge/`.

## Layout

- Source registration is not stored here. This repository is the base `notes`
  in the kgdistiller home (`$KGDISTILLER_HOME`, default `~/.knowledge`); its
  `config.json` maps repository-relative globs to document types: the
  mathematics courses' `.tex` files to `math-notes` and the registered CS
  Markdown notes to the draft type `cs-notes`. Each type (allowed node kinds,
  relation kinds, epistemic values and guidance) is
  `~/.knowledge/types/<name>.md`. Publishing data (titles, fields, topics, web
  routes, publish/listed policy) and the `.typ` companions live in
  `courses.json`.
- `entries/<id>.md` is the single stored copy of each knowledge node. Its
  frontmatter holds `schema`, `id`, `label`, `kind`, `aliases`, `source` (a
  repository-relative registered source path), `line_start`, `line_end` and
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
regenerated with `kgd export obsidian --base notes`. Do not clear all
build outputs merely because they are generated.
