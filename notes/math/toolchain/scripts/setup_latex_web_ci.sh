#!/bin/sh
# Ephemeral GitHub runner setup, shared by notes checks and the homepage build.
set -eu

test "${GITHUB_ACTIONS:-}" = true || {
  echo "This installer is only for disposable GitHub Actions runners." >&2
  exit 1
}

# The direct LaTeX HTML protocol is provided by this reviewed product revision.
converter_revision=cda98cbc45a40a5666f2d8a3fa2f3c5ee22b4f59
converter_dir=$(mktemp -d "${RUNNER_TEMP}/notes-latex-live.XXXXXX")
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
  texlive-xetex texlive-latex-extra texlive-lang-chinese texlive-science \
  texlive-fonts-recommended texlive-fonts-extra texlive-bibtex-extra \
  latexmk dvisvgm mupdf-tools fonts-texgyre
# Ubuntu's TeX Live packages omit ElegantBook, which qlnotes-native.cls loads;
# install the same v4.6 class as TeX Live 2026 into the runner's TEXMFHOME.
elegantbook_dir="$(kpsewhich -var-value TEXMFHOME)/tex/latex/elegantbook"
mkdir -p "$elegantbook_dir"
curl -fsSL -o "$elegantbook_dir/elegantbook.cls" \
  https://raw.githubusercontent.com/ElegantLaTeX/ElegantBook/81bc14a0633d9a1060cd3a9df96075c3ba09ae67/elegantbook.cls
kpsewhich elegantbook.cls
git -C "$converter_dir" init
git -C "$converter_dir" remote add origin https://github.com/qiulinfan/obsidian-latex-live.git
git -C "$converter_dir" fetch --depth 1 origin "$converter_revision"
git -C "$converter_dir" checkout --detach FETCH_HEAD
npm --prefix "$converter_dir" ci --no-audit --no-fund
node - "$converter_dir/scripts/kgdistiller-export.mjs" >> "$GITHUB_ENV" <<'JS'
console.log('LATEX_LIVE_EXPORT_COMMAND=' + JSON.stringify(['node', process.argv[2]]));
JS
