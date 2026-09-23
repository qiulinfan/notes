# Legacy LaTeX to QLNotes Typst

## Contents

1. Inventory the authority baseline
2. Generate a migration draft
3. Normalize semantics and modules
4. Port TikZ to CeTZ
5. Accept the migration

## 1. Inventory the authority baseline

Read the LaTeX entry point and distinguish enabled lecture chapters from
additional course sources such as homework. If the user asks for a full
migration, include both, but keep separate Typst entry points when the LaTeX
book did not include the extra material.

Before conversion, record per-file counts for:

- `definition`, `theorem`, `lemma`, `corollary`, `proposition`, and `example`;
- `proof`, `solution`, `remark`, and `note`;
- active TikZ blocks, code environments, citations, labels, and references.

Ignore commented TikZ blocks. Keep the old LaTeX source as the read-only
comparison baseline. Do not retain or regenerate a compiled PDF below `notes/`.

## 2. Generate a migration draft

Use the canonical migrator in
`notes/math/toolchain/scripts/migrate_latex.py`:

```sh
python3 scripts/migrate_latex.py chapters/*.tex \
  --output-dir /path/to/draft/chapters \
  --diagram-dir /path/to/ignored-build/tikz \
  --manifest /path/to/ignored-build/diagrams.json
```

The migrator:

- expands legacy `\bX`, `\cX`, and `\bfX` aliases before Pandoc;
- maps theorem-like LaTeX environments to QLNotes components;
- rewrites document-local labels without treating them as graph identity;
- preserves Python and terminal blocks as native code;
- extracts active TikZ blocks as named diagram placeholders;
- hoists nested proof/solution blocks out of examples for safe pagination.

Generate into an isolated draft directory once manual cleanup has begun. Never
overwrite curated Typst blindly; compare the regenerated draft instead.

## 3. Normalize semantics and modules

Create one Typst authority entry for the lecture book and a second entry for
homework when applicable. Every included chapter is its own module scope and
must import the shared QLNotes component and alias modules itself.

Inspect every generated semantic call:

- remove legacy `id`, `concepts`, `depends`, and `aliases` graph attributes;
- add one globally unique, stable, human-readable `#kn[Name]` only to meaningful named
  definitions, axioms, theorems, propositions, lemmas, and corollaries;
- replace repeated definitions with `#ref` when they refer to an existing global
  concept;
- never auto-mark sections, examples, exercises, remarks, proofs, or diagrams;
- preserve document-local labels independently from hidden graph IDs;
- keep supporting proof/solution blocks as siblings;
- eliminate raw-LaTeX fallbacks from Typst math;
- fix implicit LaTeX multiplication that Pandoc can merge, such as `p^kp^r`;
- keep prose and callouts left-aligned.

After curation, run a scoped graph scan before export. Extract direct semantic
edges from the actual statements and proofs through an agent delta; do not
translate legacy proximity or numbering into dependencies.

Avoid wrapping export-relevant content in paged-only outer `figure` or centered
table constructs. Typst's experimental HTML target may omit nested content even
when another renderer looks correct.

## 4. Port TikZ to CeTZ

Treat extracted TikZ as a visual specification, not as a retained dependency.
Implement each active diagram as a zero-argument CeTZ function and replace its
placeholder with `#diagram(...)`.

Every diagram needs:

- a stable `fig-` ID;
- a meaningful caption;
- non-empty alt text describing the relationship shown;
- successful Typst export and basic HTML checking.

Keep CeTZ authoritative. Markdown receives SVG in `.assets/`; editable LaTeX
snapshots receive a derived PNG. Do not regenerate TikZ or create PDF assets.

## 5. Accept the migration

Before the first export, compare source inventories and environment counts so
no chapter or active diagram is silently omitted. Then use the normal fast
acceptance path:

- the LaTeX and Typst source-file inventories match;
- every environment count matches by kind;
- every active `#kn` name is globally unique and every `#ref` is resolvable;
- examples and headings add no implicit graph nodes;
- every enabled and supplementary source is included exactly once;
- active TikZ count equals the number of authored CeTZ diagrams;
- `make export` succeeds and emits one `.tex` and `.md` per level-one chapter;
- the main and secondary web checks succeed;
- the adopted static export verifier and repository `make knowledge-check`
  succeed without running kgdistiller.

Stop after these commands pass. Do not create PDFs or contact sheets,
independently compile exported LaTeX, or run broad visual regressions unless the
user explicitly requests them or an export command fails. Even with such a
request, any temporary PDF must live outside `notes/`.
