CHANGES for CWEBMAN.TEX by Andreas Scherer, July 2, 2020.

This set of changes adapts CWEBMAN.TEX for TeX Live.  It requires that the
change files CWEBMAN-PATCH.CH and CWEBMAN-EXTENSIONS.CH be applied first.

For a complete history of the changes made to CWEBMAN.TEX see CWEBMAN-PATCH.CH.
------------------------------------------------------------------------------
@x l.5
\input cwebmac
\acrofalse\pdffalse\pdftexfalse
@y
\ifx\undefined\XeTeXrevision\else\let\pdf+\fi % XeTeX produces PDF output
\input cwebmac
@z
------------------------------------------------------------------------------
@x l.33
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

\def\bkminfo{}
\outer\def\section #1.{\penalty-500\bigskip
        \centerline{\sectionfont\def\.##1{{\twelvett##1}}
  \ifacro\vbox to 0pt{\kern-2.5ex\relax
    \ifpdftex\pdfdest num \destcount fitbh\relax
    \else\special{pdf: dest (\the\destcount) [ @thispage /FitBH @ypos ]}\fi
    \def\.##1{##1}\def\TeX{TeX}%
    \ifx\bkminfo\empty\def\sectitle{#1}\else\def\sectitle{#1 (\bkminfo)}\fi
    \ifpdftex\pdfoutline goto num \destcount {\sectitle}\relax
    \else\special{pdf: outline 0 << /Title (\sectitle)
      /A << /S /GoTo /D (\the\destcount) >> >>}\fi
    \gdef\bkminfo{}%
    \global\advance\destcount by 1\relax
    \kern2.5ex\relax
  }\fi #1}\nobreak\vskip 6pt
        \everypar{\hskip-\parindent\everypar{}}}

\outer\def\ssection #1.#2.{\penalty-500\bigskip
        \centerline{\sectionfont\def\.##1{{\twelvett##1}}
  \ifacro\vbox to 0pt{\kern-2.5ex\relax
    \ifpdftex\pdfdest num \destcount fitbh\relax
    \else\special{pdf: dest (\the\destcount) [ @thispage /FitBH @ypos ]}\fi
    \def\.##1{##1}\def\TeX{TeX}%
    \ifx\bkminfo\empty\def\sectitle{#1}\else\def\sectitle{#1 (\bkminfo)}\fi
    \ifpdftex\pdfoutline goto num \destcount count -#2 {\sectitle}\relax
    \else\special{pdf: outline 0 << /Title (\sectitle)
      /A << /S /GoTo /D (\the\destcount) >> >>}\fi
    \gdef\bkminfo{}%
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
@x l.39 and l.73 of CWEBMAN-PATCH.CH
\def\runninghead{{\tentt CWEB} USER MANUAL (@VERSION@)}
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\runninghead{{\tentt CWEB} USER MANUAL (3.64 [\TeX~Live])}
@z
------------------------------------------------------------------------------
@x l.80 of CWEBMAN-PATCH.CH
\footnote*{This document describes the extended \.{CWEB} (@VERSION@).}}
@y
\footnote*{This document describes the extended \.{CWEB} (3.64 [\TeX~Live]).}}
@z
------------------------------------------------------------------------------
@x l.12 of CWEBMAN-EXTENSIONS.CH
\cwebfootnote{In this extended implementation, if an \.{@i}nclude file can
not be found in the current directory, \.{CWEB} will look in standard
directories like the \CEE/ preprocessor.  Multiple search paths may be
specified in the environment variable \.{CWEBINPUTS}, concatenated with
\.{PATH\_SEPARATOR}s (on \UNIX/ commonly known as~`\.:').  If the environment
variable is not set, some decent default paths are used instead.}
@y
\cwebfootnote{In this extended implementation, if an \.{@i}nclude file can
not be found in the current directory, \.{CWEB} will use the conventions of
the \Kpathsea/ library as outlined in section~\X90:File lookup with
\Kpathsea/\X~of appendix~D to look for it.  (This is true for any other input
or change file lookup.)}% FIXME
@z
------------------------------------------------------------------------------
@x l.40 of CWEBMAN-EXTENSIONS.CH
\option m Install communication between \.{CWEB} and the message browser of
the {\mc SAS/C} development system.  Set the external environment variable
\.{SCMSGOPT} to any legal command line option described in the documentation
by SAS Institute.  (Off by default; works only on the {\mc AMIGA} system.)
\hfil\vskip\normallineskip
@y
@z
------------------------------------------------------------------------------
@x l.1114
Sometimes things don't work as smoothly, and you get a bunch of
@y
\acrofalse\pdftexfalse\pdffalse
Sometimes things don't work as smoothly, and you get a bunch of
@z
------------------------------------------------------------------------------
@x l.1124
`\.{main(argc,argv)}'.
@y
`\.{main(argc,argv)}'.
\ifx\pdf+\pdftrue\fi
\ifx\pdfoutput\undefined \pdftexfalse \else\ifnum\pdfoutput=0 \pdftexfalse
\else \pdftextrue \pdfoutput=1\fi\fi
\ifpdf\acrotrue\fi \ifpdftex\acrotrue\fi
@z
------------------------------------------------------------------------------
@x l.1166
As an example of a real program written in \.{CWEB}, Appendix~A
@y
As an example of a real program written in \.{CWEB}, \Appendix A
@z
------------------------------------------------------------------------------
@x l.1171
Appendix B is the file that sets \TEX/ up to accept
the output of \.{CWEAVE}, and Appendix~C discusses how to use some of those
@y
\Appendix B is the file that sets \TEX/ up to accept
the output of \.{CWEAVE}, and \Appendix C discusses how to use some of those
@z
------------------------------------------------------------------------------
@x l.1182
\def\runninghead{APPENDIX A --- {\tentt CWEB} FILE FORMAT}
\section Appendix A: Excerpts from a \.{CWEB} Program.
@y
\def\runninghead{APPENDIX A --- {\tentt CWEB} FILE FORMAT}
\ssection Appendix A: Excerpts from a \.{CWEB} Program.4.
\subsection CWEB file format.
@z
------------------------------------------------------------------------------
@x l.1260
\def\runninghead{APPENDIX A  --- TRANSLATION BY {\tentt CTANGLE}}
@y
\def\runninghead{APPENDIX A  --- TRANSLATION BY {\tentt CTANGLE}}
\subsection Translation by CTANGLE.
@z
------------------------------------------------------------------------------
@x l.1329
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CWEAVE}}
@y
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CWEAVE}}
\subsection Translation by CWEAVE.
@z
------------------------------------------------------------------------------
@x l.1412
\def\runninghead{APPENDIX A --- FINAL DOCUMENT}

And here's what the same excerpt looks like when typeset.
@y
\def\runninghead{APPENDIX A --- FINAL DOCUMENT}
\subsection Final document.

\acrofalse\pdftexfalse\pdffalse
And here's what the same excerpt looks like when typeset.
@z
------------------------------------------------------------------------------
@x l.1488
\vfil\eject\titletrue
@y
\vfil\eject\titletrue
\ifx\pdf+\pdftrue\fi
\ifx\pdfoutput\undefined \pdftexfalse \else\ifnum\pdfoutput=0 \pdftexfalse
\else \pdftextrue \pdfoutput=1\fi\fi
\ifpdf\acrotrue\fi \ifpdftex\acrotrue\fi
@z
------------------------------------------------------------------------------
@x l.101 of CWEBMAN-PATCH.CH
  \.{ { }\\vskip 15pt \\centerline\{(@VERSION@)\}{ }\\vfill\}}\cr}$$
@y
  \.{ { }\\vskip 15pt \\centerline\{(Version 3.64)\}{ }\\vfill\}}\cr}$$
@z
------------------------------------------------------------------------------
