\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qlnotes-native}[2026/10/02 Native mathematics notes]
\LoadClass[lang=cn,11pt,chinesefont=nofont]{elegantbook}
\RequirePackage[UTF8,fontset=fandol,scheme=plain]{ctex}
\setCJKmainfont{FandolSong-Regular}[BoldFont=FandolSong-Bold,ItalicFont=FandolKai-Regular,AutoFakeBold=2]
\setCJKsansfont{FandolHei-Regular}[AutoFakeBold=2]
\setCJKmonofont{FandolFang-Regular}[AutoFakeBold=2]
\RequirePackage{longtable,booktabs,array,calc,enumitem,tikz}
% Pandoc 3's captionless longtables deliberately use this non-numbering type.
\newcounter{none}
\setcounter{MaxMatrixCols}{30}
% These authored text symbols are available in the CJK font, not Termes.
\xeCJKDeclareCharClass{CJK}{"2032,"2460 -> "2473}
\usetikzlibrary{arrows.meta,patterns,calc}
\providecommand{\tightlist}{\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\providecommand{\pandocbounded}[1]{#1}
\newenvironment{qlnote}[1]{\par\smallskip\noindent\textbf{\color{structurecolor}#1}\quad}{\par\smallskip}
\newenvironment{qlremark}[1]{\par\smallskip\noindent\textbf{\color{second}#1}\quad}{\par\smallskip}
\newenvironment{qlsolution}[1]{\par\smallskip\noindent\textbf{\color{main}#1}\quad}{\par\smallskip}
% The authored markers remain readable without a generated knowledge registry.
% A registry may override these commands before the document starts.
\providecommand{\kn}[1]{\textbf{#1}}
\providecommand{\knref}[1]{#1}
\providecommand{\bE}{\mathbb{E}}
\providecommand{\bI}{\mathbb{I}}
\providecommand{\bN}{\mathbb{N}}
\providecommand{\bP}{\mathbb{P}}
\providecommand{\bQ}{\mathbb{Q}}
\providecommand{\bR}{\mathbb{R}}
\providecommand{\bZ}{\mathbb{Z}}
\providecommand{\bF}{\mathbb{F}}
\providecommand{\bC}{\mathbb{C}}
\providecommand{\Cov}{\operatorname{Cov}}
\providecommand{\Law}{\operatorname{Law}}
\providecommand{\Var}{\operatorname{Var}}
\providecommand{\iid}{\operatorname{i.i.d.}}
\expandafter\newcommand\csname ql-analysis-function\endcsname{%
  \begin{tikzpicture}[>=Stealth]
    \draw (0,0) ellipse (0.65 and 0.48);
    \draw (3,0) ellipse (0.85 and 0.48);
    \node at (0,0) {$x$}; \node at (3,0) {$f(x)$};
    \draw[->] (0.65,0) -- node[above] {$f$} (2.15,0);
    \node at (0,-0.9) {$X=\operatorname{dom}(f)$};
    \node at (3,-0.9) {$Y=\operatorname{cod}(f)$};
  \end{tikzpicture}}
\expandafter\newcommand\csname ql-analysis-lattice\endcsname{%
  \begin{tikzpicture}[x=1pt,y=-1pt,>=Stealth]
    \draw[->] (28,59) -- (144,59) node[right] {$x$};
    \draw[->] (80,100) -- (80,9) node[above] {$y$};
    \draw[blue!60!black] (52,32) rectangle (113,84);
    \draw[blue!60!black] (64,44) rectangle (101,72);
    \foreach \x in {48,64,80,96,112}
      \foreach \y in {28,44,60,76} \fill (\x,\y) circle[radius=1.4pt];
    \useasboundingbox (0,0) rectangle (165,118);
  \end{tikzpicture}}
\expandafter\newcommand\csname ql-analysis-two-level\endcsname{%
  \begin{tikzpicture}[x=1pt,y=-1pt,>=Stealth]
    \draw[->] (24,47) -- (125,47) node[right] {$x$};
    \draw[->] (24,78) -- (24,16) node[above] {$y$};
    \node[left] at (24,23) {$1$}; \node[left] at (24,56) {$0$};
    \draw[gray,dashed] (48,23) -- (104,23);
    \draw[gray,dashed] (48,48) -- (104,48);
    \useasboundingbox (0,0) rectangle (150,90);
  \end{tikzpicture}}
