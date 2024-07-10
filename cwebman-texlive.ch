CHANGES for CWEBMAN.TEX by Andreas Scherer, September 2023.

This set of changes adapts CWEBMAN.TEX for TeX Live.  It requires that the
change files CWEBMAN-PATCH.CH and CWEBMAN-EXTENSIONS.CH be applied first.

For a complete history of the changes made to CWEBMAN.TEX see CWEBMAN-PATCH.CH.
------------------------------------------------------------------------------
@x l.4
\input cwebmac
\pdffalse\acrohintfalse
@y
\input cwebmac
\ifhint \input hiplainpage \fi
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
  \ifpdflua \pdfhorigin=1cm \pdfvorigin=1cm
  \else \advance\pdfpageheight by 1cm \global\pageshift=-1.54cm
    \global\hoffset=-1.54cm \global\voffset=-1.54cm \fi
\fi

\newcount\destcount \destcount=1\relax

\def\subsections{0}
\outer\def\section #1.{\penalty-500\bigskip
        \centerline{\sectionfont\def\.##1{{\twelvett##1}}
  \ifacro\vbox to 0pt{\kern-2.5ex\relax
    \ifpdflua\pdfdest num \destcount fith\relax
    \else\special{pdf: dest (\the\destcount) [ @thispage /FitH @ypos ]}\fi
    \def\.##1{##1}\def\TeX{TeX}%
    \ifpdflua\pdfoutline goto num \destcount
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
  \ifacro\ifpdflua
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
    \ifpdflua\pdfdest num \subdestcount fith\relax
      \pdfoutline goto num \subdestcount {#1}\relax
    \else\special{pdf: dest (\the\subdestcount) [ @thispage /FitH @ypos ]}%
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
\def\runninghead{{\tentt CWEB} USER MANUAL (Version 4.11 [\TeX~Live])}
@z
------------------------------------------------------------------------------
@x l.80 of CWEBMAN-PATCH.CH
\footnote*{This document describes the extended \.{CWEB} (@VERSION@).}}
@y
\footnote*{This document describes the extended \.{CWEB} (Version 4.11 [\TeX~Live]).}}
@z
------------------------------------------------------------------------------
@x l.83
Internet page \.{http://www-cs-faculty.stanford.edu/\char`\~knuth/cweb.html}
@y
Internet page
\pdfURL{\.{http://www-cs-faculty.stanford.edu/\char`\~knuth/cweb.html}}%
          {http://www-cs-faculty.stanford.edu/\TILDE/knuth/cweb.html}
@z
------------------------------------------------------------------------------
@x l.88
\.{https://github.com/ascherer/cweb} with the really current news.
@y
\pdfURL{\.{https://github.com/ascherer/cweb}}%
          {https://github.com/ascherer/cweb}
with the really current news.
@z
------------------------------------------------------------------------------
@x l.106
should be sent to the \TeX-related mailing list \.{tex-k@tug.org}.
@y
should be sent to the \TeX-related mailing list
\pdfURL{\.{tex-k@tug.org}}%
   {mailto:tex-k@tug.org}.
@z
------------------------------------------------------------------------------
@x l.108
Readers who are familiar with Knuth's memo ``The \.{WEB} System of Structured
Documentation'' will be able
@y
Readers who are familiar with Knuth's memo ``\pdfURL{The \.{WEB} System of
Structured Documentation}{../web/webman.pdf}'' will be able
@z
------------------------------------------------------------------------------
@x l.527
email address in a \.{CWEB} file (e.g., \.{tex-k@@tug.org}).
@y
email address in a \.{CWEB} file (e.g.,
\pdfURL{\.{tex-k@@tug.org}}%
   {mailto:tex-k@tug.org}).
@z
------------------------------------------------------------------------------
@x l.922 and l.12 of CWEBMAN-EXTENSIONS.CH
\cwebfootnote{In this extended implementation, if an \.{@i}nclude file can
not be found in the current directory, \.{CWEB} will look in standard
directories like the \CEE/ preprocessor.  Multiple search paths may be
specified in the environment variable \.{CWEBINPUTS}, concatenated with
\.{PATH\_SEPARATOR}s (on \UNIX/ commonly known as~`\.:').  If the environment
variable is not set, some decent default paths are used instead.}
@y
\cwebfootnote{In this extended implementation, if an \.{@i}nclude file can not
be found in the current directory, \.{CWEB} will use the conventions of the
\Kpathsea/ library as outlined in {\pdffalse\acrohintfalse section~\X93:File
lookup with \Kpathsea/\X~of} \pdfURL{appendix~D}{common-changes.pdf} to look
for it.
% FIXME
(This is true for any other input or change file lookup.)}
@z
------------------------------------------------------------------------------
@x l.1029
except for error messages.
@y
except for error messages.%
\cwebfootnote{\.{CWEB} in \TeX~Live runs `\.{--quiet}ly', i.\,e.,
options `\.{b}', `\.{h}', and `\.{p}' are `off' by default.}
@z
------------------------------------------------------------------------------
@x l.1035 and l.33 of CWEBMAN-EXTENSIONS.CH
\option i Indent parameters in function declarations.  (On by default;
@y
\option d Set the debugging variable \\{kpathsea\_debug} to the numeric
value $N\in[0,127]$ of this option.  See section~95 % FIXME
of \pdfURL{appendix~D}{common-changes.pdf} for details.
\hfil\vskip\normallineskip
\option i Indent parameters in function declarations.  (On by default;
@z
------------------------------------------------------------------------------
@x l.1127
Sometimes things don't work as smoothly, and you get a bunch of
@y
\pdffalse\acrohintfalse
Sometimes things don't work as smoothly, and you get a bunch of
@z
------------------------------------------------------------------------------
@x l.1135
`$\\{main}(\\{argc},\39\\{argv}{}$)'.
@y
`$\\{main}(\\{argc},\39\\{argv}{}$)'.
\ifx\pdf+\pdftrue\fi \ifxetex\pdftrue\fi
\ifpdflua\ifnum\pdfoutput>0\pdftrue\fi\fi
\ifpdf\acrohinttrue\fi \ifhint\acrohinttrue\fi
@z
------------------------------------------------------------------------------
@x l.1180 and l.87 of CWEBMAN-EXTENSIONS.CH.
\cwebfootnote{This extended version of \.{CWEB} comes with an up-to-date
@y
\cwebfootnote{\TeX~Live comes with an up-to-date
@z
------------------------------------------------------------------------------
@x l.1184
As an example of a real program written in \.{CWEB}, Appendix~A
@y
As an example of a real program written in \.{CWEB}, \Appendix A
@z
------------------------------------------------------------------------------
@x l.1189
Appendix B displays the files that set \TEX/ up to accept
the output of \.{CWEAVE}, and Appendix~C discusses how to use some of those
@y
\Appendix B displays the files that set \TEX/ up to accept
the output of \.{CWEAVE}, and \Appendix C discusses how to use some of those
@z
------------------------------------------------------------------------------
@x l.1201
\section Appendix A: Excerpts from a \.{CWEB} Program.
@y
\def\subsections{4}
\section Appendix A: Excerpts from a \.{CWEB} Program.
\subsection CWEB file format.
@z
------------------------------------------------------------------------------
@x l.1205
generated sections 27--31 of the file \.{common.w}, which contains
@y
generated sections 27--31 of the file
\pdfURL{\.{common.w}}{common.pdf}, which contains
@z
------------------------------------------------------------------------------
@x l.1276
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CTANGLE}}
@y
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CTANGLE}}
\subsection Translation by CTANGLE.
@z
------------------------------------------------------------------------------
@x l.1344
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CWEAVE}}
@y
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CWEAVE}}
\subsection Translation by CWEAVE.
@z
------------------------------------------------------------------------------
@x l.1433
\def\runninghead{APPENDIX A --- FINAL DOCUMENT}

And here's what the same excerpt looks like when typeset.
(Can you spot the typographical nicety used in the \.{CWEB} code?)
\let\K=\leftarrow
@y
\def\runninghead{APPENDIX A --- FINAL DOCUMENT}
\subsection Final document.

\pdffalse\acrohintfalse
And here's what the same excerpt looks like when typeset.
(Can you spot the typographical niceties used in the \.{CWEB} code?)
\let\K=\leftarrow
\def\C#1{\5\5\quad$\triangleright\,${\cmntfont#1}$\,\triangleleft$}
@z
------------------------------------------------------------------------------
@x l.1515
\vfil\eject\titletrue
@y
\vfil\eject\titletrue
\ifx\pdf+\pdftrue\fi \ifxetex\pdftrue\fi
\ifpdflua\ifnum\pdfoutput>0 \pdftrue\fi\fi
\ifacro\acrohinttrue\fi \ifhint\acrohinttrue\fi
@z
------------------------------------------------------------------------------
@x l.1617 and l.86 of CWEBMAN-PATCH.CH
  \.{ { }\\vskip 15pt \\centerline\{(@VERSION@)\}{ }\\vfill\}}\cr}$$
@y
  \.{ { }\\vskip 15pt \\centerline\{(Version 4.11)\}{ }\\vfill\}}\cr}$$
@z
------------------------------------------------------------------------------
