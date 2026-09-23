// Obsidian Tinymist passes a vault-root-relative source path. Keep project
// presentation here; ordinary main.typ compilation does not use this entry.
#import "toolchain/qlnotes.typ": paged-layout, palette, typst-ref

#let source = sys.inputs.at("preview-source")
#if source.split("/").contains("chapters") {
  show: paged-layout.with(frontmatter: false)
  // A standalone chapter cannot resolve labels owned by another chapter.
  // Preserve the target visibly; never invent a book-wide reference number.
  show typst-ref: it => context {
    if query(it.target).len() > 0 {
      it
    } else {
      text(fill: palette.muted, size: 0.85em)[〔外部引用：#str(it.target)〕]
    }
  }
  include source
} else {
  include source
}
