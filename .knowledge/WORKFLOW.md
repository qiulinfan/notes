# Knowledge instance workflow

The independent [`kgdistiller`](https://github.com/qiulinfan/kgdistiller)
checkout owns the engine, knowledge/paper Skills, prebuilt agents, workflows,
tests, and local Codex linker. This `notes` repository owns only this personal
instance and its note sources. The notes website does not depend on it.

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

The root Makefile wraps these as `make knowledge-build`,
`make knowledge-file FILE=...` and `make knowledge-authoring-check`; a course's
`make knowledge-curate` runs the build and the check. Refresh the Obsidian
plugin's graph feed with `kgdistiller --repo-root . export obsidian`. When the
product changes the feed contract, reinstall the plugin with
`kgdistiller --repo-root . obsidian install --replace` before or together with
that export, then reload the plugin in Obsidian.
Candidate/query/ingest work follows the product repository's canonical Skills
and review gates. Do not hand-edit graph JSONL, guess identity from similarity,
or publish a failed/partial ingest.

Nothing refreshes the private graph automatically: run the refresh before
committing source changes whose knowledge should be current.
