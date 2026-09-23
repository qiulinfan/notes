\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qlnotes-export}[2026/07/31 Editable QLNotes LaTeX export]

\LoadClass[lang=cn,11pt,chinesefont=nofont]{elegantbook}

\RequirePackage[UTF8,scheme=plain]{ctex}
\setCJKmainfont{FandolSong-Regular}[
  BoldFont=FandolSong-Bold,
  AutoFakeBold=2
]
\setCJKsansfont{FandolHei-Regular}[AutoFakeBold=2]
\setCJKmonofont{FandolFang-Regular}[AutoFakeBold=2]

\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{calc}

\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\providecommand{\pandocbounded}[1]{#1}

\newenvironment{qlnote}[1]{%
  \par\smallskip
  \noindent\textbf{\color{structurecolor}#1}\quad
}{%
  \par\smallskip
}

\newenvironment{qlremark}[1]{%
  \par\smallskip
  \noindent\textbf{\color{second}#1}\quad
}{%
  \par\smallskip
}

\newenvironment{qlsolution}[1]{%
  \par\smallskip
  \noindent\textbf{\color{main}#1}\quad
}{%
  \par\smallskip
}
