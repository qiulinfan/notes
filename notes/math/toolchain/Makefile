.PHONY: setup doctor

setup:
	@sh scripts/setup.sh

doctor:
	@command -v python3 >/dev/null
	@command -v typst >/dev/null
	@command -v pandoc >/dev/null
	@command -v rsvg-convert >/dev/null
	@echo "QLNotes toolchain is ready."
