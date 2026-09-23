# Knowledge instance workflow

The independent [`kgdistiller`](https://github.com/qiulinfan/kgdistiller)
checkout owns the engine, knowledge/paper Skills, prebuilt agents, workflows,
tests, and local Codex linker. This `notes` repository owns only this personal
instance, its note sources, and an adopted static export.

## Daily checks

The normal path consumes committed data only:

```sh
make check
```

It does not invoke kgdistiller and does not require its repository.

## Explicit authoring refresh

When personal notes or reviewed graph decisions must change, first select and
install the intended kgdistiller product revision. Its development checkout may
remain linked directly into Codex for live Skill iteration. From this repository, use the
public CLI with this repository as the explicit instance root:

```sh
kgdistiller --repo-root . sync
kgdistiller --repo-root . check
```

Scoped `sync --subject`, `sync --course`, and `sync --file` commands remain
available through the root Makefile. Candidate/query/ingest work follows the
product repository's canonical Skills and review gates. Do not hand-edit graph
JSONL, guess identity from similarity, or publish a failed/partial ingest.

## Adopt a product revision

Adopt only a clean, committed product revision that has passed its product
tests. The instance side is deliberately a two-commit adoption: first commit
all source, registry, alignment, policy, and private-graph changes as commit A
and require the worktree (including untracked files) to be clean. Then
create the static bundle from that clean checkout, whose manifest records
commit A as `source.revision` and the selected product commit as
`producer.commit`:

```sh
kgdistiller --repo-root . export site \
  --output knowledge/export/site \
  --product-commit <full-kgdistiller-commit> \
  --source-repository https://github.com/qiulinfan/notes \
  --replace
python3 knowledge/export/site/verify_export.py knowledge/export/site
make knowledge-check
```

`--replace` accepts only a valid existing kgdistiller bundle and stages and
verifies the replacement before an atomic directory swap; a failed export
leaves the adopted bundle unchanged. Review the private graph diff, public
bundle diff, producer provenance, privacy filter, counts, and hashes together.
Commit the bundle as commit B only when that review succeeds. The
exporter refuses a dirty instance or a product commit that does not identify
the clean product checkout executing it; do not bypass those provenance gates.
This export receipt replaces the old submodule-pointer model: pulling or
editing kgdistiller never moves this instance automatically.

## Deployment

This repository's CI runs `make check`, then triggers the homepage Pages build.
The homepage (`qiulinfan/qiulinfan.github.io`) clones this repository as its
`notes` dock, builds the published Typst pages and the Astro site, and deploys
the result. Neither build checks out, installs, or executes kgdistiller.

For a local clone with Python 3 and the selected kgdistiller revision installed,
enable the repository-owned pre-push hook once:

```sh
make hooks-install
```

Before each push, the hook checks the registered source generation. If it is
stale, it runs a full deterministic sync of the configured source registry,
checks and commits that private graph generation, refreshes and commits the
static export, and stops the original push. Run `git push` once more so Git can
include the newly created commits. The hook refuses to mutate a dirty worktree,
missing sources, review-requiring syncs, or changes outside the expected
generated paths. New files outside the configured source registry are never
discovered or ingested.
There is no public knowledge-graph page or JSON endpoint. The committed
`graph.json` remains an internal verified adoption record, while the Typst
toolchain consumes the committed public registry.
