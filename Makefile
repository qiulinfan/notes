.PHONY: check latex-check typst-version web notes-source-check knowledge-registry knowledge-registry-check knowledge-build knowledge-file knowledge-authoring-check knowledge-search knowledge-context knowledge-agent-status knowledge-candidate knowledge-align knowledge-compare knowledge-propose knowledge-ingest-plan knowledge-ingest-apply

# The single Typst pin for local checks, this repository's CI, and the homepage build.
TYPST_VERSION := 0.15.1

KGDISTILLER ?= kgdistiller
KGDISTILLER_INSTANCE := $(KGDISTILLER) --repo-root .

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
	@python3 notes/scripts/check_source_policy.py --repo-root .

knowledge-registry:
	@python3 notes/math/toolchain/scripts/knowledge_registry.py

knowledge-registry-check:
	@python3 notes/math/toolchain/scripts/knowledge_registry.py --check

knowledge-build:
	@$(KGDISTILLER_INSTANCE) sync

knowledge-file:
	@test -n "$(FILE)" || (echo '用法: make knowledge-file FILE=notes/math/measure-theory/chapters/01-sigma-algebra-与-measure.typ' && exit 1)
	@$(KGDISTILLER_INSTANCE) sync --file "$(FILE)"

knowledge-authoring-check:
	@$(KGDISTILLER_INSTANCE) check

knowledge-search:
	@test -n "$(QUERY)" || (echo '用法: make knowledge-search QUERY="conditional expectation"' && exit 1)
	@$(KGDISTILLER_INSTANCE) search "$(QUERY)"

knowledge-context:
	@test -n "$(QUERY)" || (echo '用法: make knowledge-context QUERY="conditional expectation"' && exit 1)
	@$(KGDISTILLER_INSTANCE) agent context "$(QUERY)" --graph-strategy hybrid

knowledge-agent-status:
	@$(KGDISTILLER_INSTANCE) agent status

knowledge-candidate:
	@test -n "$(CANDIDATE)" || (echo 'CANDIDATE 不能为空' && exit 1)
	@test -n "$(SNAPSHOT)" || (echo 'SNAPSHOT 不能为空' && exit 1)
	@$(KGDISTILLER_INSTANCE) candidate build "$(CANDIDATE)" --output "$(SNAPSHOT)"

knowledge-align:
	@test -n "$(SNAPSHOT)" || (echo '用法: make knowledge-align SNAPSHOT=.knowledge/build/paper.snapshot.json NAME=paper' && exit 1)
	@test -n "$(NAME)" || (echo 'NAME 不能为空' && exit 1)
	@$(KGDISTILLER_INSTANCE) agent align "$(SNAPSHOT)" --output ".knowledge/build/reviews/$(NAME).alignment.json"

knowledge-compare:
	@test -n "$(SNAPSHOT)" || (echo '用法: make knowledge-compare SNAPSHOT=.knowledge/build/paper.snapshot.json' && exit 1)
	@$(KGDISTILLER_INSTANCE) agent compare "$(SNAPSHOT)"

knowledge-propose:
	@test -n "$(SNAPSHOT)" || (echo 'SNAPSHOT 不能为空' && exit 1)
	@test -n "$(AUTHORITY)" || (echo 'AUTHORITY 不能为空' && exit 1)
	@test -n "$(NAME)" || (echo 'NAME 不能为空' && exit 1)
	@$(KGDISTILLER_INSTANCE) agent propose "$(SNAPSHOT)" --target-authority "$(AUTHORITY)" \
		--output ".knowledge/build/reviews/$(NAME).proposal.json" \
		--delta-output ".knowledge/build/reviews/$(NAME).delta.json"

knowledge-ingest-plan:
	@test -n "$(REQUEST)" || (echo 'REQUEST 不能为空' && exit 1)
	@test -n "$(PLAN)" || (echo 'PLAN 不能为空' && exit 1)
	@$(KGDISTILLER_INSTANCE) ingest plan "$(REQUEST)" --output "$(PLAN)"

knowledge-ingest-apply:
	@test -n "$(REQUEST)" || (echo 'REQUEST 不能为空' && exit 1)
	@test -n "$(RECEIPT)" || (echo 'RECEIPT 不能为空' && exit 1)
	@$(KGDISTILLER_INSTANCE) ingest apply "$(REQUEST)" --receipt "$(RECEIPT)"
