.PHONY: all release export web web-check watch edit knowledge-sync knowledge-curate

TYPST := typst
TOOLCHAIN := ../toolchain
WEB_CHECK := $(TOOLCHAIN)/scripts/check_web.py
REPO_ROOT := ../../..
KGDISTILLER ?= kgdistiller
BUILD := build/typst
EXPORTS := exports
COURSE_SLUG := everything-about-linear-algebra

all: release

release: web-check

export:
	@python3 $(TOOLCHAIN)/scripts/export_course.py \
		--document notes=main.typ \
		--root $(REPO_ROOT) \
		--output $(EXPORTS) \
		--build $(BUILD)/export

knowledge-sync:
	@$(KGDISTILLER) --repo-root $(REPO_ROOT) sync --course linear-algebra
	@$(KGDISTILLER) --repo-root $(REPO_ROOT) sync --course advanced-linear-algebra
	@$(KGDISTILLER) --repo-root $(REPO_ROOT) sync --course numerical-linear-algebra

knowledge-curate: knowledge-sync
	@$(MAKE) -C $(REPO_ROOT) knowledge-authoring-check

web:
	@mkdir -p $(BUILD)
	@$(TYPST) compile --root $(REPO_ROOT) --features html --format html \
		main.typ $(BUILD)/index.html 2>$(BUILD)/index.log || \
		{ cat $(BUILD)/index.log >&2; exit 1; }

web-check: web
	@python3 $(WEB_CHECK) $(BUILD)/index.html

watch:
	@mkdir -p $(BUILD)
	@$(TYPST) watch --root $(REPO_ROOT) --features html --format html \
		main.typ $(BUILD)/index.html

edit:
	@code -r $(COURSE_SLUG).code-workspace main.typ
