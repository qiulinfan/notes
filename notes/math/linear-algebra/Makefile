.PHONY: all release export web web-check watch edit knowledge-sync knowledge-curate

TYPST := typst
TOOLCHAIN := ../toolchain
WEB_CHECK := $(TOOLCHAIN)/scripts/check_web.py
REPO_ROOT := ../../..
KGDISTILLER ?= kgdistiller
BUILD := build/typst
EXPORTS := exports
COURSE_SLUG := linear-algebra

all: release

release: web-check

export:
	@python3 $(TOOLCHAIN)/scripts/export_course.py \
		--document notes=main.typ \
		--root $(REPO_ROOT) \
		--output $(EXPORTS) \
		--build $(BUILD)/export

knowledge-sync:
	@$(KGDISTILLER) --repo-root $(REPO_ROOT) sync --course $(COURSE_SLUG)

knowledge-curate: knowledge-sync
	@$(MAKE) -C $(REPO_ROOT) knowledge-authoring-check

web:
	@if not exist "$(BUILD)" mkdir "$(BUILD)"
	@$(TYPST) compile --root $(REPO_ROOT) --features html --format html main.typ $(BUILD)/index.html >$(BUILD)/index.log 2>&1 || (type "$(BUILD)\index.log" & exit /b 1)

web-check: web
	@python3 $(WEB_CHECK) $(BUILD)/index.html

watch:
	@if not exist "$(BUILD)" mkdir "$(BUILD)"
	@$(TYPST) watch --root $(REPO_ROOT) --features html --format html main.typ $(BUILD)/index.html

edit:
	@code -r $(COURSE_SLUG).code-workspace main.typ
