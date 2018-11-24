								-*-Web-*-
This file, CWEBMAN.CH, is part of CWEBBIN (Version 3.64 [2018]).  It is a
changefile written by Andreas Scherer for CWEBMAN.TEX, Version 3.64, that
provides changes appropriate for extensions by Carsten Steger, Andreas
Scherer (deutsch), Giuseppe Ghibò (italiano), and Denis Roegel (français).

Run WMERGE with masterfile CWEBMAN.TEX and changefile CWEBMAN.CH
to produce CWEBMANA.TEX.

This program is distributed WITHOUT ANY WARRANTY, express or implied.

The following copyright notice extends to this changefile only, not to
the masterfile CWEBMAN.TEX.

Copyright (C) 1993-1995,1998-2000,2005,2011,2018 Andreas Scherer

Permission is granted to make and distribute verbatim copies of this
document provided that the copyright notice and this permission notice
are preserved on all copies.

Permission is granted to copy and distribute modified versions of this
document under the conditions for verbatim copying, provided that the
entire resulting derived work is distributed under the terms of a
permission notice identical to this one.

Version history:

Version	Date		Author	Comment
a1      15 Mar 1993     AS      Setup of changefile.
a2	05 Sep 1993	AS	Minor changes and corrections.
a3	09 Oct 1993	AS	Updated for cwebman.tex 2.8.
a4	12 Oct 1993	AS	Contents page for the complete manual.
a5	25 Oct 1993	AS	Updated for cwebman.tex 3.0.
a6	18 Nov 1993	AS	Updated for cwebman.tex 3.1.
a7	30 Nov 1993	AS	Minor changes and corrections.
a8	12 Jan 1994	AS	New gcwebmac.tex installed.
a9	18 Jan 1994	AS	New patch level.
a10	24 Jun 1994	AS	New option `m' for ARexx communication.
a11	12 Aug 1994	AS	Updated for cwebman.tex 3.2.
a12	24 Aug 1994	AS	Support for Italian users by GG.
				New option flag list.
a13	19 Sep 1994	AS	Support for French users by DBR.
a14	03 Dec 1994	AS	Updated for CWEB 3.3.
a15	18 Apr 1995	AS	Updated for CWEB 3.4.
a16	12 May 1995	AS	Updated for private patch level.
a17	13 Aug 1998	AS	Updated for CWEB 3.42.
a18	31 Dec 1999	AS	Updated for CWEB 3.5.
a19	25 Jul 2000	AS	Updated for CWEB 3.61.
a20	02 Jan 2001	AS	Updated for CWEB 3.63.
a21	09 Mar 2002	AS	Updated for CWEB 3.64.
a22	18 Aug 2011	AS	Updated for CWEB 3.64ad.
2018	24 Nov 2018	AS	Update for CWEBbin 2018.
------------------------------------------------------------------------------
Use the already changed macro file.  Also we will need special characters.
@x l.4
\input cwebmac
@y
\input Xcwebmac.tex
\input ecma94.sty
@z
------------------------------------------------------------------------------
@x l.37
\def\runninghead{{\tentt CWEB} USER MANUAL (VERSION 3.64)}
@y
\def\runninghead{{\tentt CWEB} USER MANUAL (VERSION 3.64 [CWEBbin 2018])}
@z
------------------------------------------------------------------------------
@x l.51
\vskip 18pt\centerline{(Version 3.64 --- February 2002)}
@y
\vskip 18pt\centerline{(Version 3.64 [CWEBbin 2018] --- October 2018)}
@z
------------------------------------------------------------------------------
@x l.106
should be sent to Levy (\.{levy@math.berkeley.edu}).
@y
should be sent to \.{tex-k@tug.org}.
@z
------------------------------------------------------------------------------
@x l.106
email address in a \.{CWEB} file (e.g., \.{levy@@math.berkeley.edu}).
@y
email address in a \.{CWEB} file (e.g., \.{tex-k@@tug.org}).
@z
------------------------------------------------------------------------------
@x l.913
\more On \UNIX/ systems (and others that support environment variables),
if the environment variable \.{CWEBINPUTS} is set, or if the compiler flag
of the same name was defined at compile time,
\.{CWEB} will look for include files in the directory thus named, if
it cannot find them in the current directory.
@y
\more If an \.{@i}nclude file can not be found in the current directory
\.{CWEB} will look in standard directories like the \CEE/ preprocessor.
Multiple search paths may be specified in the environment variable
\.{CWEBINPUTS}, concatenated with \.{PATH\_SEPARATOR}s.  If the environment
variable is not set, some decent default paths are used instead.
@z
------------------------------------------------------------------------------
There are additional command line switches available:

    - `i' to suppress indentation of old-style parameter declarations.
    - `l' for support of user language switches and captions and quotes.
    - `m' to activate communication between CWEB and the message
          browser of the SAS/C development system via ARexx.
    - 'o' to separate parameter declarations and statements.

@x l.995
\option b Print a banner line at the beginning of execution. (On
by default.)

\option e Enclose \CEE/ material formatted by \.{CWEAVE} in
brackets \.{\\PB\{...\}}, so that special hooks can be used.
(Off by default; has no effect on \.{CTANGLE}.)

\option f Force line breaks after each \CEE/ statement formatted
by \.{CWEAVE}. (On by default; \.{-f} saves paper but looks less \CEE/-like
to some people.) (Has no effect on \.{CTANGLE}.)

\option h Print a happy message at the conclusion of a successful
run. (On by default.)

\option p Give progress reports as the program runs. (On by default.)

\option s Show statistics about memory usage after the program
runs to completion. (Off by default.)
If you
have large \.{CWEB} files or sections, you may need to see
how close you come to exceeding the capacity of \.{CTANGLE} and/or \.{CWEAVE}.

\option x Include indexes and a table of contents in the \TEX/ file
output by \.{CWEAVE}. (On by default.) (Has no effect on \.{CTANGLE}.)
@y
\option b Print a banner line at the beginning of execution. (On
by default.)

\option f Force line breaks after each \CEE/ statement formatted
by \.{CWEAVE}. (On by default; \.{-f} saves paper but looks less \CEE/-like
to some people.) (Has no effect on \.{CTANGLE}.)

\option h Print a happy message at the conclusion of a successful
run. (On by default.)

\option i Indent parameters in function declarations.  This causes the
formal parameter declarations in function heads to be indented.  (On by
default; \.{-i} typesets declarations flush left; some people think this
to be more logical than indenting them) (Has no effect on \.{CTANGLE}.)

\option l This option takes the string of characters to its right as its
argument to switch between different user languages and macro packages.
For example, if you call \.{CWEAVE} with the `\.{+ld}' (or `\.{-ld}') option,
the German \.{CWEB} macros \.{dcwebmac.tex} will be loaded in the first line
of output instead of the English ones. To avoid conflicts, the Danish
macros could be called \.{dkcwebmac.tex} and would be included by `\.{+ldk}'.
(Off by default) (Has no effect on \.{CTANGLE}.)

\option m Install communication between \.{CWEB} and the message browser of
the {\mc SAS/C} development system.  Set the external environment variable
\.{SCMSGOPT} to any legal command line option described in the
documentation by SAS Institute.  (Off by default; works only on the {\mc
AMIGA} system.)

\option o Separate declarations and the first statement in a function block.
\.{CWEAVE} automatically inserts a bit of extra space.  (On by default.)
(Has no effect on \.{CTANGLE}.)

\option p Give progress reports as the program runs. (On by default.)

\option s Show statistics about memory usage after the program
runs to completion. (Off by default.)
If you have large \.{CWEB} files or sections, you may need to see
how close you come to exceeding the capacity of \.{CTANGLE} and/or \.{CWEAVE}.

\option x Include indexes and a table of contents in the \TEX/ file
output by \.{CWEAVE}. (On by default.) (Has no effect on \.{CTANGLE}.)
@z
------------------------------------------------------------------------------
Also relate to this changed macro file and to the German version.
@x l.1491
\def\runninghead{APPENDIX B --- MACROS FOR FORMATTING}
\section Appendix B: The \.{cwebmac.tex} file.
This is the file that extends ``plain \TEX/'' format in order to support the
features needed by the output of \.{CWEAVE}.

\vskip6pt
\begingroup \def\tt{\eighttt} \baselineskip9pt
\def\printmacs{\begingroup
  \def\do##1{\catcode`##1=12 } \dospecials
  \parskip 0pt \parindent 0pt
  \catcode`\ =13 \catcode`\^^M=13
  \tt \verbatimdefs \input cwebmac \endgroup}
\printmacs
\endgroup
\vfill\eject
@y
\def\runninghead{APPENDIX B --- MACROS FOR FORMATTING}
\section Appendix B: The \.{cwebmac.tex} file.
This is the file that extends ``plain \TEX/'' format in order to support the
features needed by the output of \.{CWEAVE}.

\vskip6pt
\begingroup \def\tt{\eighttt} \baselineskip9pt
\def\printmacs{\begingroup
  \def\do##1{\catcode`##1=12 } \dospecials
  \parskip 0pt \parindent 0pt
  \catcode`\ =13 \catcode`\^^M=13
  \tt \verbatimdefs \input cwebmac \endgroup}
\printmacs
\endgroup
\vfill\eject
\def\runninghead{APPENDIX B --- MACROS FOR FORMATTING}
\section Appendix B: The \.{Xcwebmac.tex} file.
Some of the macros in \.{cwebmac.tex} are changed to give better results.

\vskip6pt
\begingroup \def\tt{\eighttt} \baselineskip9pt
\def\printmacs{\begingroup
  \def\do##1{\catcode`##1=12 } \dospecials
  \parskip 0pt \parindent 0pt
  \catcode`\ =13 \catcode`\^^M=13
  \tt \verbatimdefs \input Xcwebmac \endgroup}
\printmacs
\endgroup
\vfill\eject
\def\runninghead{ANHANG B --- MACROS F\"UR DIE FORMATIERUNG}
\section Anhang B: Die \.{dcwebmac.tex} Datei.
Diese Datei erweitert das ``plain \TEX/''-Format um Eigenschaften
zur Unterst\"utzung der Ausgabe von \.{CWEAVE}.

\vskip6pt
\begingroup \def\tt{\eighttt} \baselineskip9pt
\def\printmacs{\begingroup
  \def\do##1{\catcode`##1=12 } \dospecials
  \parskip 0pt \parindent 0pt
  \catcode`\ =13 \catcode`\^^M=13
  \tt \verbatimdefs \input dcwebmac \endgroup}
\printmacs
\endgroup
\vfill\eject
\def\runninghead{APPENDICE B --- MACRO PER IL FORMATTING}
\section Appendice B: Il file \.{icwebmac.tex}.
Questo \`e il file che estende il ``plain \TEX/'' per supportare le
caratteristiche richieste dall'output generato da \.{CWEAVE}.

\vskip6pt
\begingroup \def\tt{\eighttt} \baselineskip9pt
\def\printmacs{\begingroup
  \def\do##1{\catcode`##1=12 } \dospecials
  \parskip 0pt \parindent 0pt
  \catcode`\ =13 \catcode`\^^M=13
  \tt \verbatimdefs \input icwebmac \endgroup}
\printmacs
\endgroup
\vfill\eject
\def\runninghead{APPENDICE B --- MACROS POUR LE FORMATTING}
\section Appendice B: Le text \.{fcwebmac.tex}.
Voici le text qui \'elargit le format ``plain \TEX/''
et soutient l'output de \.{CWEAVE}.

\vskip6pt
\begingroup \def\tt{\eighttt} \baselineskip9pt
\def\printmacs{\begingroup
  \def\do##1{\catcode`##1=12 } \dospecials
  \parskip 0pt \parindent 0pt
  \catcode`\ =13 \catcode`\^^M=13
  \tt \verbatimdefs \input fcwebmac \endgroup}
\printmacs
\endgroup
\vfill\eject
@z
------------------------------------------------------------------------------
@x l.1505
  \.{ { }\\vskip 15pt \\centerline\{(Version 3.64)\}{ }\\vfill\}}\cr}$$
@y
  \.{ { }\\vskip 15pt \\centerline\{(Version 3.64 [CWEBbin 2018])\}{ }\\vfill\}}\cr}$$
@z
------------------------------------------------------------------------------
