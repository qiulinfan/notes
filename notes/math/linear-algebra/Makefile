.PHONY: all release web web-check

TOOLCHAIN := ../toolchain
REPO_ROOT := ../../..
BUILD := $(REPO_ROOT)/build/latex-web/$(notdir $(CURDIR))
WEB_EXPORT := $(TOOLCHAIN)/scripts/export_latex_web.py
WEB_CHECK := $(TOOLCHAIN)/scripts/check_web.py

all: release

release: web-check

web:
	@python3 $(WEB_EXPORT) main.tex --repo-root $(REPO_ROOT) \
		--build $(BUILD)/work --output $(BUILD)/index.html

web-check: web
	@python3 $(WEB_CHECK) $(BUILD)/index.html
