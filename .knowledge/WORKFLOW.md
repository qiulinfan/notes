# Knowledge instance workflow

The independent [`kgdistiller`](https://github.com/qiulinfan/kgdistiller)
checkout owns the engine, knowledge Skills, prebuilt agents, workflows, tests,
and local Codex linker. This `notes` repository owns only this personal
instance and its note sources. The notes website does not depend on it.

## Daily checks

The normal path consumes committed data only:

```sh
make check
```

It does not invoke kgdistiller and does not require its repository.

## Explicit authoring

When personal knowledge must change, first select and install the intended
kgdistiller product revision. Its development checkout may remain linked
directly into Codex for live Skill iteration. Nothing scans the sources
automatically: new or changed entries and edges are captured or curated from
the registered `.tex` sources through the product Skills
(`capture-kgdistiller`, `curate-kgdistiller-notes`) and applied with a
reviewed ingest (`make knowledge-ingest-plan` and `make knowledge-ingest-apply`).
Then validate the instance against its sources:

```sh
make knowledge-authoring-check   # kgdistiller --repo-root . check
make knowledge-fix-lines         # kgdistiller --repo-root . check --fix-lines
```

The check validates every entry and edge and reports an entry as moved when
its Evidence quote now occurs at other lines of its source, or as stale when
the quote no longer occurs there. Run `make knowledge-fix-lines` after source
edits move cited lines; a stale entry needs a reviewed update. A course's
`make knowledge-curate` runs the same check.

Entries are human-editable Markdown and can be adjusted in Obsidian; keep the
frontmatter keys, the section headings and the verbatim Evidence quote intact.
Never hand-edit `edges.jsonl`; change edges only through a reviewed ingest.
Do not guess identity from similarity or publish a failed or partial ingest.

Refresh the Obsidian plugin's graph feed with
`kgdistiller --repo-root . export obsidian`. When the product changes the feed
contract, reinstall the plugin with
`kgdistiller --repo-root . obsidian install --replace` before or together with
that export, then reload the plugin in Obsidian.
