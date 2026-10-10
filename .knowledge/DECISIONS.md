# Personal knowledge decisions

These are decisions of this personal instance, not kgdistiller product defaults.

- Identity comes from the reviewed entries: each entry's id, label and aliases.
  Knowledge markers in the sources are website anchors and do not establish
  identity. Text or graph similarity retrieves evidence; it does not establish
  identity.
- Ambiguous or contradictory identity decisions stay unresolved until reviewed
  and are never auto-promoted to aliases.
- For mathematics courses only the `.tex` files are knowledge sources; the
  `.typ` companions are not registered. CS course Markdown stays registered.
- Paper distillation must not modify the personal entries, edges or notes
  without a separate, reviewed ingest request. Changing the notes website
  (`courses.json`, the generated marker registry) needs an explicit owner
  request.
- Do not import solvablemodel paper nodes C02, C07, C09, C12, C15, C16, C17,
  C19, C20, or other paper nodes into this personal knowledge instance under
  the prior evaluation decision.
- Do not write knowledge markers back into the solvablemodel paper sources
  under the prior evaluation decision.
- The entries and `edges.jsonl` are the durable authority. They hold
  agent-authored summaries and semantic edges for which no separate decision
  log exists; note-only reconstruction is not an acceptable migration. They
  were migrated once on 2026-10-09 from the derived-evidence graph: each entry
  was rebound to its `.tex` statement with a verbatim Evidence quote, earlier
  spellings became aliases, and the 219 accepted edges were kept.
