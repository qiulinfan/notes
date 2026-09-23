.PHONY: all release export web web-check homeworks-web homeworks-web-check watch knowledge-sync knowledge-curate

TYPST := typst
TOOLCHAIN := ../toolchain
WEB_CHECK := $(TOOLCHAIN)/scripts/check_web.py
REPO_ROOT := ../../..
KGDISTILLER ?= kgdistiller
BUILD := build/typst
EXPORTS := exports

all: release

release: web-check homeworks-web-check

export:
	@python3 $(TOOLCHAIN)/scripts/export_course.py \
		--document notes=main.typ \
		--document homeworks=homeworks.typ \
		--root $(REPO_ROOT) \
		--output $(EXPORTS) \
		--build $(BUILD)/export

knowledge-sync:
	@$(KGDISTILLER) --repo-root $(REPO_ROOT) sync --course probability

knowledge-curate: knowledge-sync
	@$(MAKE) -C $(REPO_ROOT) knowledge-authoring-check

web:
	@mkdir -p $(BUILD)
	@$(TYPST) compile --root $(REPO_ROOT) --features html --format html \
		main.typ $(BUILD)/index.html 2>$(BUILD)/index.log || \
		{ cat $(BUILD)/index.log >&2; exit 1; }

web-check: web
	@python3 $(WEB_CHECK) $(BUILD)/index.html \
		--expected-nodes 93 --expected-diagrams 14

homeworks-web:
	@mkdir -p $(BUILD)
	@$(TYPST) compile --root $(REPO_ROOT) --features html --format html \
		homeworks.typ $(BUILD)/homeworks.html 2>$(BUILD)/homeworks.log || \
		{ cat $(BUILD)/homeworks.log >&2; exit 1; }

homeworks-web-check: homeworks-web
	@python3 $(WEB_CHECK) $(BUILD)/homeworks.html \
		--expected-nodes 0 --expected-diagrams 0

watch:
	@mkdir -p $(BUILD)
	@$(TYPST) watch --root $(REPO_ROOT) --features html --format html \
		main.typ $(BUILD)/index.html
