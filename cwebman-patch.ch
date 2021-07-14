								-*-Web-*-
This file, CWEBMAN-FOO.CH, is part of CWEBBIN (@VERSION@).  It is a
changefile written by Andreas Scherer for CWEBMAN.TEX, Version 4.5, that
provides changes appropriate for extensions by Carsten Steger, Andreas
Scherer (deutsch), Giuseppe Ghibò (italiano), and Denis Roegel (français).

Technically, CWEBMAN-FOO.CH is constructed from a multitude of separate change
files by applying Klaus Guntermann's TIE processor.  Any comments (like this
introduction) are removed from the final output, so this CWEBMAN-PATCH.CH is
the place to look up the development history.

This program is distributed WITHOUT ANY WARRANTY, express or implied.

The following copyright notice extends to this changefile only, not to
the masterfile CWEBMAN.TEX.

Copyright (C) 1993-1995,1998-2000,2005,2011,2018,2021 Andreas Scherer

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
2020	11 Jun 2020	AS	Split into multiple changefiles.
------------------------------------------------------------------------------
@x l.6 See comment in cwebmac.tex
\def\page{\box255 } \normalbottom
@y
\let\page=\pagebody \raggedbottom
\newcount\footnotecount \footnotecount 1\relax
\def\cwebfootnote#1{\footnote{${}^{\the\footnotecount}$}{#1}%
  \advance\footnotecount by 1\relax}
@z
------------------------------------------------------------------------------
@x l.38
\def\runninghead{{\tentt CWEB} USER MANUAL (VERSION 4.5)}
@y
\def\runninghead{{\tentt CWEB} USER MANUAL (@VERSION@)}
@z
------------------------------------------------------------------------------
@x l.52
\vskip 18pt\centerline{(Version 4.5 --- July 2021)}
@y
\vskip 18pt\centerline{(Version 4.5 --- July 2021)%
\footnote*{This document describes the extended \.{CWEB} (@VERSION@).}}
@z
------------------------------------------------------------------------------
@x l.1600
  \.{ { }\\vskip 15pt \\centerline\{(Version 4.5)\}{ }\\vfill\}}\cr}$$
@y
  \.{ { }\\vskip 15pt \\centerline\{(@VERSION@)\}{ }\\vfill\}}\cr}$$
@z
------------------------------------------------------------------------------
