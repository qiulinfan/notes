.PHONY: check latex-check typst-version web notes-source-check knowledge-registry knowledge-registry-check knowledge-authoring-check knowledge-fix-lines knowledge-search knowledge-context knowledge-agent-status knowledge-ingest-plan knowledge-ingest-apply

# The single Typst pin for local checks, this repository's CI, and the homepage build.
TYPST_VERSION := 0.15.1

KGD ?= kgd

# Course roots whose standalone web pages the site publishes, read from the course registry.
PUBLISHED_WEB_ROOTS = $(shell python3 -c 'import json; print(" ".join(c["root"] for c in json.load(open("courses.json"))["courses"] if c["publish"] and c.get("web_artifacts")))')

check: notes-source-check knowledge-registry-check web

latex-check:
	@python3 notes/math/toolchain/scripts/check_native_tex.py

typst-version:
	@echo $(TYPST_VERSION)

web:
	@for root in $(PUBLISHED_WEB_ROOTS); do $(MAKE) -C "$$root" release || exit 1; done

notes-source-check:
	@python3 notes/scripts/check_source_policy.py

knowledge-registry:
	@python3 notes/math/toolchain/scripts/knowledge_registry.py

knowledge-registry-check:
	@python3 notes/math/toolchain/scripts/knowledge_registry.py --check

knowledge-authoring-check:
	@$(KGD) check --base notes

knowledge-fix-lines:
	@$(KGD) check --base notes --fix-lines

knowledge-search:
	@test -n "$(QUERY)" || (echo '用法: make knowledge-search QUERY="conditional expectation"' && exit 1)
	@$(KGD) agent search "$(QUERY)" --base notes

knowledge-context:
	@test -n "$(QUERY)" || (echo '用法: make knowledge-context QUERY="conditional expectation"' && exit 1)
	@$(KGD) agent context "$(QUERY)" --graph-strategy hybrid --base notes

knowledge-agent-status:
	@$(KGD) agent status --base notes

knowledge-ingest-plan:
	@test -n "$(REQUEST)" || (echo 'REQUEST 不能为空' && exit 1)
	@test -n "$(PLAN)" || (echo 'PLAN 不能为空' && exit 1)
	@$(KGD) ingest plan "$(REQUEST)" --output "$(PLAN)" --base notes

knowledge-ingest-apply:
	@test -n "$(REQUEST)" || (echo 'REQUEST 不能为空' && exit 1)
	@test -n "$(RECEIPT)" || (echo 'RECEIPT 不能为空' && exit 1)
	@$(KGD) ingest apply "$(REQUEST)" --receipt "$(RECEIPT)" --base notes
