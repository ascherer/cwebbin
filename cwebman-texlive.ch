CHANGES for CWEBMAN.TEX by Andreas Scherer, February 2022.

This set of changes adapts CWEBMAN.TEX for TeX Live.  It requires that the
change files CWEBMAN-PATCH.CH and CWEBMAN-EXTENSIONS.CH be applied first.

For a complete history of the changes made to CWEBMAN.TEX see CWEBMAN-PATCH.CH.
------------------------------------------------------------------------------
@x l.4
\input cwebmac
\acrofalse\pdffalse\pdftexfalse\hintfalse\acrohintfalse
@y
\input cwebmac
@z
------------------------------------------------------------------------------
@x l.32
\outer\def\section #1.{\penalty-500\bigskip
        \centerline{\sectionfont\def\.##1{{\twelvett##1}} #1}\nobreak\vskip 6pt
        \everypar{\hskip-\parindent\everypar{}}}
@y
\ifacro
  \pdfpagewidth=\pagewidth \advance\pdfpagewidth by 2cm
  \pdfpageheight=\pageheight \advance\pdfpageheight by 3cm
  \ifpdftex \pdfhorigin=1cm \pdfvorigin=1cm
  \else \advance\pdfpageheight by 1cm \global\pageshift=-1.54cm
    \global\hoffset=-1.54cm \global\voffset=-1.54cm \fi
\fi

\newcount\destcount \destcount=1\relax

\def\subsections{0}
\outer\def\section #1.{\penalty-500\bigskip
        \centerline{\sectionfont\def\.##1{{\twelvett##1}}
  \ifacro\vbox to 0pt{\kern-2.5ex\relax
    \ifpdftex\pdfdest num \destcount fitbh\relax
    \else\special{pdf: dest (\the\destcount) [ @thispage /FitBH @ypos ]}\fi
    \def\.##1{##1}\def\TeX{TeX}%
    \ifpdftex\pdfoutline goto num \destcount
      \ifnum\subsections>0 count -\subsections\fi {#1}\relax
    \else\special{pdf: outline 0 << /Title (#1)
      /A << /S /GoTo /D (\the\destcount) >> >>}\fi
    \gdef\subsections{0}%
    \global\advance\destcount by 1\relax
    \kern2.5ex\relax
  }\fi #1}\nobreak\vskip 6pt
        \everypar{\hskip-\parindent\everypar{}}}

\def\appA{15}
\def\appB{16}
\def\appC{17}

\def\Appendix#1{\leavevmode
  \ifacro\ifpdftex
    \pdfstartlink attr{/Border[0 0 0]} goto num\csname app#1\endcsname\relax
    \Blue\hbox{Appendix}~#1\Black
    \pdfendlink
  \else
    \setbox0=\hbox{\special{pdf: bc [ \pdflinkcolor ]}{\hbox{Appendix}~#1}%
    \special{pdf: ec}}\special{pdf: ann width \thewidth height \theheight
      depth \thedepth << /Type /Annot /Subtype /Link /Border [0 0 0]
      /A << /S /GoTo /D (\csname app#1\endcsname) >> >>}\box0\relax
  \fi\else Appendix~#1\fi}

\newcount\subdestcount \subdestcount=151\relax

\outer\def\subsection #1.{\ifacro
    \ifpdftex\pdfdest num \subdestcount fitbh\relax
      \pdfoutline goto num \subdestcount {#1}\relax
    \else\special{pdf: dest (\the\subdestcount) [ @thispage /FitBH @ypos ]}%
      \special{pdf: outline 1 << /Title (#1)
        /A << /S /GoTo /D (\the\subdestcount) >> >>}\fi
    \global\advance\subdestcount by 1\relax
  \fi}
@z
------------------------------------------------------------------------------
@x l.38 and l.73 of CWEBMAN-PATCH.CH
\def\runninghead{{\tentt CWEB} USER MANUAL (@VERSION@)}
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\runninghead{{\tentt CWEB} USER MANUAL (Version 4.8 [\TeX~Live])}
@z
------------------------------------------------------------------------------
@x l.80 of CWEBMAN-PATCH.CH
\footnote*{This document describes the extended \.{CWEB} (@VERSION@).}}
@y
\footnote*{This document describes the extended \.{CWEB} (Version 4.8 [\TeX~Live]).}}
@z
------------------------------------------------------------------------------
@x l.86
Internet page \.{http://www-cs-faculty.stanford.edu/\char`\~knuth/cweb.html}
@y
Internet page
\pdfURL{\.{http://www-cs-faculty.stanford.edu/\char`\~knuth/cweb.html}}%
          {http://www-cs-faculty.stanford.edu/\TILDE/knuth/cweb.html}
@z
------------------------------------------------------------------------------
@x l.91
\.{https://github.com/ascherer/cweb} with the really current news.
@y
\pdfURL{\.{https://github.com/ascherer/cweb}}%
          {https://github.com/ascherer/cweb}
with the really current news.
@z
------------------------------------------------------------------------------
@x l.109
should be sent to the \TeX-related mailing list \.{tex-k@tug.org}.
@y
should be sent to the \TeX-related mailing list
\pdfURL{\.{tex-k@tug.org}}%
   {mailto:tex-k@tug.org}.
@z
------------------------------------------------------------------------------
@x l.530
email address in a \.{CWEB} file (e.g., \.{tex-k@@tug.org}).
@y
email address in a \.{CWEB} file (e.g.,
\pdfURL{\.{tex-k@@tug.org}}%
   {mailto:tex-k@tug.org}).
@z
------------------------------------------------------------------------------
@x l.925 and l.12 of CWEBMAN-EXTENSIONS.CH
\cwebfootnote{In this extended implementation, if an \.{@i}nclude file can
not be found in the current directory, \.{CWEB} will look in standard
directories like the \CEE/ preprocessor.  Multiple search paths may be
specified in the environment variable \.{CWEBINPUTS}, concatenated with
\.{PATH\_SEPARATOR}s (on \UNIX/ commonly known as~`\.:').  If the environment
variable is not set, some decent default paths are used instead.}
@y
\cwebfootnote{\acrofalse In this extended implementation, if an \.{@i}nclude
file can not be found in the current directory, \.{CWEB} will use the
conventions of the \Kpathsea/ library as outlined in section~\X93:File lookup
with \Kpathsea/\X~of \pdfURL{appendix~D}{common-changes.pdf} to look for it.
% FIXME
(This is true for any other input or change file lookup.)}
@z
------------------------------------------------------------------------------
@x l.1032
except for error messages.
@y
except for error messages.%
\cwebfootnote{\.{CWEB} in \TeX~Live runs `\.{--quiet}ly', i.\,e.,
options `\.{b}', `\.{h}', and `\.{p}' are `off' by default.}
@z
------------------------------------------------------------------------------
@x l.1038 and l.33 of CWEBMAN-EXTENSIONS.CH
\option i Indent parameters in function declarations.  (On by default;
@y
\option d Set the debugging variable \\{kpathsea\_debug} to the numeric
value $N\in[0,127]$ of this option.  See section~95 % FIXME
of \pdfURL{appendix~D}{common-changes.pdf} for details.
\hfil\vskip\normallineskip
\option i Indent parameters in function declarations.  (On by default;
@z
------------------------------------------------------------------------------
@x l.1038 and l.44 of CWEBMAN-EXTENSIONS.CH
\option m Install communication between \.{CWEB} and the message browser of
the {\mc SAS/C} development system.  Set the external environment variable
\.{SCMSGOPT} to any legal command line option described in the documentation
by SAS Institute.  (Off by default; works only on the {\mc AMIGA} system.)
\hfil\vskip\normallineskip
@y
@z
------------------------------------------------------------------------------
@x l.1126
Sometimes things don't work as smoothly, and you get a bunch of
@y
\acrofalse\pdftexfalse\pdffalse
Sometimes things don't work as smoothly, and you get a bunch of
@z
------------------------------------------------------------------------------
@x l.1134
`$\\{main}(\\{argc},\39\\{argv}{}$)'.
@y
`$\\{main}(\\{argc},\39\\{argv}{}$)'.
\ifx\pdf+\pdftrue\fi
\ifx\pdfoutput\undefined \pdftexfalse \else\ifnum\pdfoutput=0 \pdftexfalse
\else \pdftextrue \pdfoutput=1\fi\fi
\ifpdf\acrotrue\fi \ifpdftex\acrotrue\fi
@z
------------------------------------------------------------------------------
@x l.1176 amd l.68 of CWEBMAN-EXTENSIONS.CH.
\cwebfootnote{This extended version of \.{CWEB} comes with an up-to-date
@y
\cwebfootnote{\TeX~Live comes with an up-to-date
@z
------------------------------------------------------------------------------
@x l.1180
As an example of a real program written in \.{CWEB}, Appendix~A
@y
As an example of a real program written in \.{CWEB}, \Appendix A
@z
------------------------------------------------------------------------------
@x l.1185
Appendix B is the file that sets \TEX/ up to accept
the output of \.{CWEAVE}, and Appendix~C discusses how to use some of those
@y
\Appendix B is the file that sets \TEX/ up to accept
the output of \.{CWEAVE}, and \Appendix C discusses how to use some of those
@z
------------------------------------------------------------------------------
@x l.1197
\section Appendix A: Excerpts from a \.{CWEB} Program.
@y
\def\subsections{4}
\section Appendix A: Excerpts from a \.{CWEB} Program.
\subsection CWEB file format.
@z
------------------------------------------------------------------------------
@x l.1201
generated sections 27--31 of the file \.{common.w}, which contains
@y
generated sections 27--31 of the file
\pdfURL{\.{common.w}}{common.pdf}, which contains
@z
------------------------------------------------------------------------------
@x l.1272
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CTANGLE}}
@y
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CTANGLE}}
\subsection Translation by CTANGLE.
@z
------------------------------------------------------------------------------
@x l.1339
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CWEAVE}}
@y
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CWEAVE}}
\subsection Translation by CWEAVE.
@z
------------------------------------------------------------------------------
@x l.1419
\def\runninghead{APPENDIX A --- FINAL DOCUMENT}

And here's what the same excerpt looks like when typeset.
(Can you spot the typographical nicety used in the \.{CWEB} code?)
\let\K=\leftarrow
@y
\def\runninghead{APPENDIX A --- FINAL DOCUMENT}
\subsection Final document.

\acrofalse\pdftexfalse\pdffalse
And here's what the same excerpt looks like when typeset.
(Can you spot the typographical niceties used in the \.{CWEB} code?)
\let\K=\leftarrow
\def\C#1{\5\5\quad$\triangleright\,${\cmntfont#1}$\,\triangleleft$}
@z
------------------------------------------------------------------------------
@x l.1501
\vfil\eject\titletrue
@y
\vfil\eject\titletrue
\ifx\pdf+\pdftrue\fi
\ifx\pdfoutput\undefined \pdftexfalse \else\ifnum\pdfoutput=0 \pdftexfalse
\else \pdftextrue \pdfoutput=1\fi\fi
\ifpdf\acrotrue\fi \ifpdftex\acrotrue\fi
@z
------------------------------------------------------------------------------
@x l.1595 and l.86 of CWEBMAN-PATCH.CH
  \.{ { }\\vskip 15pt \\centerline\{(@VERSION@)\}{ }\\vfill\}}\cr}$$
@y
  \.{ { }\\vskip 15pt \\centerline\{(Version 4.8)\}{ }\\vfill\}}\cr}$$
@z
------------------------------------------------------------------------------
