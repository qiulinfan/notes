SHELL := cmd.exe
.SHELLFLAGS := /c

.PHONY: all release export web web-check homeworks-web homeworks-web-check watch edit knowledge-sync knowledge-curate

TYPST := typst
TOOLCHAIN := ../toolchain
WEB_CHECK := $(TOOLCHAIN)/scripts/check_web.py
REPO_ROOT := ../../..
KGDISTILLER ?= kgdistiller
BUILD := build/typst
EXPORTS := exports
COURSE_SLUG := mathematical-analysis

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
	@$(KGDISTILLER) --repo-root $(REPO_ROOT) sync --course $(COURSE_SLUG)

knowledge-curate: knowledge-sync
	@$(MAKE) -C $(REPO_ROOT) knowledge-authoring-check

web:
	@IF NOT EXIST "$(BUILD)" MKDIR "$(BUILD)"
	@$(TYPST) compile --root "$(REPO_ROOT)" --features html --format html main.typ "$(BUILD)/index.html" 2>"$(BUILD)/index.log" || (type "$(BUILD)/index.log" & exit /b 1)

web-check: web
	@python3 $(WEB_CHECK) $(BUILD)/index.html

homeworks-web:
	@IF NOT EXIST "$(BUILD)" MKDIR "$(BUILD)"
	@$(TYPST) compile --root "$(REPO_ROOT)" --features html --format html homeworks.typ "$(BUILD)/homeworks.html" 2>"$(BUILD)/homeworks.log" || (type "$(BUILD)/homeworks.log" & exit /b 1)

homeworks-web-check: homeworks-web
	@python3 $(WEB_CHECK) $(BUILD)/homeworks.html

watch:
	@IF NOT EXIST "$(BUILD)" MKDIR "$(BUILD)"
	@$(TYPST) watch --root $(REPO_ROOT) --features html --format html \
		main.typ $(BUILD)/index.html

edit:
	@code -r $(COURSE_SLUG).code-workspace main.typ
