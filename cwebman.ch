								-*-Web-*-
This file, CWEBMAN.CH, is part of CWEBBIN (@VERSION@).  It is a
changefile written by Andreas Scherer for CWEBMAN.TEX, Version 3.64, that
provides changes appropriate for extensions by Carsten Steger, Andreas
Scherer (deutsch), Giuseppe Ghibò (italiano), and Denis Roegel (français).

Run TIE with masterfile CWEBMAN.TEX and changefile CWEBMAN.CH
to produce output file CWEBMANA.TEX.

This program is distributed WITHOUT ANY WARRANTY, express or implied.

The following copyright notice extends to this changefile only, not to
the masterfile CWEBMAN.TEX.

Copyright (C) 1993-1995,1998-2000,2005,2011,2018,2020 Andreas Scherer

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
2019	01 Jan 2019	AS	Update for CWEBbin 2019.
2020	30 Mar 2020	AS	New option '-t' re temporary output.
2020	13 Apr 2020	AS	New Appendix G (CTWILL source).
2020	24 May 2020	AS	Remove macro translations.
------------------------------------------------------------------------------
@x l.7 See comment in cwebmac.tex
\def\page{\box255 } \normalbottom
@y
\let\page=\pagebody \raggedbottom
@z
------------------------------------------------------------------------------
@x l.37
\def\runninghead{{\tentt CWEB} USER MANUAL (VERSION 3.64)}
@y
\def\runninghead{{\tentt CWEB} USER MANUAL (@VERSION@)}
@z
------------------------------------------------------------------------------
@x l.51
\vskip 18pt\centerline{(Version 3.64 --- February 2002)}
@y
\vskip 18pt\centerline{(Version 3.64 --- February 2002)%
\footnote*{This document describes the extended \.{CWEB} (@VERSION@).}}
@z
------------------------------------------------------------------------------
@x l.106
should be sent to Levy (\.{levy@math.berkeley.edu}).
@y
should be sent to Levy (\.{levy@math.berkeley.edu}).%
\footnote{$^1$}{Or rather to the ``\TeX~Live''-related mailing list
\.{tex-k@tug.org}.}
@z
------------------------------------------------------------------------------
@x l.524
email address in a \.{CWEB} file (e.g., \.{levy@@math.berkeley.edu}).
@y
email address in a \.{CWEB} file (e.g., \.{levy@@math.berkeley.edu}%
\footnote{$^2$}{Or rather \.{tex-k@@tug.org}.}).
@z
------------------------------------------------------------------------------
@x l.914
\more On \UNIX/ systems (and others that support environment variables),
if the environment variable \.{CWEBINPUTS} is set, or if the compiler flag
of the same name was defined at compile time,
\.{CWEB} will look for include files in the directory thus named, if
it cannot find them in the current directory.
@y
\more On \UNIX/ systems (and others that support environment variables),
if the environment variable \.{CWEBINPUTS} is set, or if the compiler flag
of the same name was defined at compile time,
\.{CWEB} will look for include files in the directory thus named, if
it cannot find them in the current directory.\footnote{$^3$}{In this extended
implementation, if an \.{@i}nclude file can not be found in the current
directory, \.{CWEB} will look in standard directories like the \CEE/
preprocessor.  Multiple search paths may be specified in the environment
variable \.{CWEBINPUTS}, concatenated with \.{PATH\_SEPARATOR}s (on \UNIX/
commonly known as~`\.:').  If the environment variable is not set, some decent
default paths are used instead.}
@z
------------------------------------------------------------------------------
There are additional command line switches available:

    - `i' to suppress indentation of old-style parameter declarations.
    - `l' for support of user language switches and captions and quotes.
    - `m' to activate communication between CWEB and the message
          browser of the SAS/C development system via ARexx.
    - 'o' to separate parameter declarations and statements.
    - 't' to use temporary output to apply changes only.

@x l.1059
output by \.{CWEAVE}. (On by default.) (Has no effect on \.{CTANGLE}.)
@y
output by \.{CWEAVE}. (On by default.) (Has no effect on \.{CTANGLE}.)%
\footnote{$^4$}{This extended version of
\.{CWEB} adds the following options to the list:

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

\option t Overwrite output files with temporary output only if changes occur.
(On by default.)}
@z
------------------------------------------------------------------------------
Add Appendix G, the CTWILL source code.
@x l.1177
appendices D, E, and~F, which exhibit the complete source code for
\.{CTANGLE} and \.{CWEAVE}.

\vfil\eject\titletrue
@y
appendices D, E, and~F, which exhibit the complete source code for
\.{CTANGLE} and \.{CWEAVE}.\footnote{$^5$}{Actually, appendix~D contains the
source code for \.{COMMON}, and the additional appendix~G exhibits the
source code for \.{CTWILL}, which is based on \.{CWEAVE}.}

\eject\titletrue
@z
------------------------------------------------------------------------------
@x l.1582
  \.{ { }\\vskip 15pt \\centerline\{(Version 3.64)\}{ }\\vfill\}}\cr}$$
@y
  \.{ { }\\vskip 15pt \\centerline\{(@VERSION@)\}{ }\\vfill\}}\cr}$$
@z
------------------------------------------------------------------------------
@x l.1697
if you have a duplex printer. Appendices D, E, and F of the complete
@y
if you have a duplex printer. Appendices D, E, and F\footnote{$^6$}{And
Appendix~G.} of the complete
@z
------------------------------------------------------------------------------
@x l.1704
or the \CEE/ comments of a \.{CWEB} file:
@y
or the \CEE/ comments of a \.{CWEB} file:\footnote{$^7$}{Be careful to make
that $$\vbox{\halign{\.{#}\hfil\cr
You can send email to
 \\pdfURL\{the author\}\{mailto:andreas\\UNDER/github@@freenet.de\}\cr
or visit
 \\pdfURL\{his home page\}\{https://github.com/ascherer\}\cr}}$$ in
the $21^{\rm st}$ century.}
@z
------------------------------------------------------------------------------
