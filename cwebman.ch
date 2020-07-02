@x
\input cwebmac
\acrofalse\pdffalse\pdftexfalse
@y
\ifx\undefined\XeTeXrevision\else\let\pdf+\fi % XeTeX produces PDF output
\input cwebmac
@z

@x
\outer\def\section #1.{\penalty-500\bigskip
        \centerline{\sectionfont\def\.##1{{\twelvett##1}} #1}\nobreak\vskip 6pt
        \everypar{\hskip-\parindent\everypar{}}}
@y
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
  }\fi \centerline{\sectionfont\def\.##1{{\twelvett##1}} #1}\nobreak\vskip 6pt
        \everypar{\hskip-\parindent\everypar{}}}

\def\appA{15}
\def\appB{16}
\def\appC{17}

\def\Appendix#1{\leavevmode
  \ifnum\csname app#1\endcsname>0 %
    \ifacro\ifpdftex
      \pdfstartlink attr{/Border[0 0 0]} goto num\csname app#1\endcsname\relax
      \Blue\hbox{Appendix}~#1\Black
      \pdfendlink
    \else
      \setbox0=\hbox{\special{pdf: bc [ \pdflinkcolor ]}{\hbox{Appendix}~#1}%
      \special{pdf: ec}}\special{pdf: ann width \thewidth height \theheight
        depth \thedepth << /Type /Annot /Subtype /Link /Border [0 0 0]
        /A << /S /GoTo /D (\csname app#1\endcsname) >> >>}\box0\relax
    \fi\else Appendix~#1\fi
  \else Appendix~#1\fi}

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

@x
Sometimes things don't work as smoothly, and you get a bunch of
@y
\acrofalse\pdftexfalse\pdffalse
Sometimes things don't work as smoothly, and you get a bunch of
@z

@x
`\.{main(argc,argv)}'.
@y
`\.{main(argc,argv)}'.
\ifx\pdf+\pdftrue\fi
\ifx\pdfoutput\undefined \pdftexfalse \else\ifnum\pdfoutput=0 \pdftexfalse
\else \pdftextrue \pdfoutput=1\fi\fi
\ifpdf\acrotrue\fi \ifpdftex\acrotrue\fi
@z

@x
As an example of a real program written in \.{CWEB}, Appendix~A
@y
As an example of a real program written in \.{CWEB}, \Appendix A
@z

@x
Appendix B is the file that sets \TEX/ up to accept
the output of \.{CWEAVE}, and Appendix~C discusses how to use some of those
@y
\Appendix B is the file that sets \TEX/ up to accept
the output of \.{CWEAVE}, and \Appendix C discusses how to use some of those
@z

@x
\def\runninghead{APPENDIX A --- {\tentt CWEB} FILE FORMAT}
\section Appendix A: Excerpts from a \.{CWEB} Program.
@y
\def\runninghead{APPENDIX A --- {\tentt CWEB} FILE FORMAT}
\ssection Appendix A: Excerpts from a \.{CWEB} Program.4.
\subsection CWEB file format.
@z

@x
\def\runninghead{APPENDIX A  --- TRANSLATION BY {\tentt CTANGLE}}
@y
\def\runninghead{APPENDIX A  --- TRANSLATION BY {\tentt CTANGLE}}
\subsection Translation by CTANGLE.
@z

@x
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CWEAVE}}
@y
\def\runninghead{APPENDIX A --- TRANSLATION BY {\tentt CWEAVE}}
\subsection Translation by CWEAVE.
@z

@x
\def\runninghead{APPENDIX A --- FINAL DOCUMENT}

And here's what the same excerpt looks like when typeset.
@y
\def\runninghead{APPENDIX A --- FINAL DOCUMENT}
\subsection Final document.

\acrofalse\pdftexfalse\pdffalse
And here's what the same excerpt looks like when typeset.
@z

@x
\vfil\eject\titletrue
@y
\vfil\eject\titletrue
\ifx\pdf+\pdftrue\fi
\ifx\pdfoutput\undefined \pdftexfalse \else\ifnum\pdfoutput=0 \pdftexfalse
\else \pdftextrue \pdfoutput=1\fi\fi
\ifpdf\acrotrue\fi \ifpdftex\acrotrue\fi
@z
