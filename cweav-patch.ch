								-*-Web-*-
This file, CWEAV-FOO.CH, is part of CWEBBIN (Version 3.64 [2018]).
It is a changefile for CWEAVE.W, Version 3.64.

Technically, CWEAV-FOO.CH is constructed from a multitude of separate
change files by applying Klaus Guntermann's TIE processor.  Any comments
(like this introduction) are removed from the final output, so
CWEAV-PATCH.CH is the place to look up the development history.

Authors and Contributors:
(JFA) Jorge Fernandez Arnaiz
  (arnaiz@@redvax1.dgsca.unam.mx).

(BOB) (bob@microprograms.com).

(H2B) Hans-Hermann Bode, Universität Osnabrück,
  (hhbode@@dosuni1.rz.uni-osnabrueck.de or HHBODE@@DOSUNI1.BITNET).

(GG) Giuseppe Ghibò,
  (ghibo@@galileo.polito.it).

(KG) Klaus Guntermann, TH Darmstadt,
  (guntermann@@iti.informatik.th-darmstadt.de).

(AS) Andreas Scherer, RWTH Aachen,
  (andreas.scherer@@pobox.com).

(CS) Carsten Steger, Universität München,
  (carsten.steger@@informatik.tu-muenchen.de).

(TW) Tomas Willis,
  (tomas@@cae.wisc.edu).

This program is distributed WITHOUT ANY WARRANTY, express or implied.

The following copyright notice extends to this changefile only, not to
the masterfile CWEAVE.W.

Copyright (C) 1993-1995,2000,2005 Andreas Scherer
Copyright (C) 1991,1993 Carsten Steger
Copyright (C) 1991-1993 Hans-Hermann Bode

Permission is granted to make and distribute verbatim copies of this
document provided that the copyright notice and this permission notice
are preserved on all copies.

Permission is granted to copy and distribute modified versions of this
document under the conditions for verbatim copying, provided that the
entire resulting derived work is distributed under the terms of a
permission notice identical to this one.

Version history:

Version	Date		Author	Comment
a1/t1	10 Oct 1991	H2B	First attempt for CWEAVE.W 2.1.
p2	13 Feb 1992	H2B	Updated for CWEAVE.W 2.4, ANSI and Turbo
				changefiles merged together, typesetting of
				certain ANSI and special constructions fixed.
p3	16 Apr 1992	H2B	Updated for CWEAVE.W 2.5.
p4	22 Jun 1992	H2B	Updated for CWEAVE.W 2.6, retaining hack for
				underlining of customized iddentifiers.

Version 2.6 --- Don Knuth, Silvio Levy, June 1992

p5	21 Jul 1992	H2B	Extensions for C++ implemented.
p5a	24 Jul 1992	KG	adaptions for other ANSI C compiler
p5b	28 Jul 1992	H2B	Remaining headers converted to ANSI style.
p5c	30 Jul 1992	KG	removed comments used after #endif

Version 2.7 --- Don Knuth, Silvio Levy, July 1992

p6	06 Sep 1992	H2B	Updated for CWEAVE.W 2.7, |dot_dot_dot| added,
				proper typesetting of formatted macro
				identifiers provided, bug in processing
				short comments fixed.
p6a     15 Mar 1993     AS      adaptions for SAS/C 6.0 and use of German
                                macro file dcwebmac.tex
p6b     28 Jul 1993     AS      new patch level due to minor changes
        01 Aug 1993     AS      missing `ptrdiff_t' datatype included
p6c	04 Sep 1993	AS	new patch level in accordance with Common

Version 2.8 --- Don Knuth, Silvio Levy, September 1992

p6d	09 Oct 1993	AS	Updated for CWEAVE.W 2.8. (This was p7)
p7	13 Nov 1992	H2B	Converted to master change file, updated for
				CWEAVE.W 2.8. [Not released.]
p7.5	29 Nov 1992	H2B	Updated for CWEAVE.W 2.9beta. [Not released.]
p8	04 Dec 1992	H2B	Updated for CWEAVE.W 2.9++ (stuff went into
				the source file). [Not released.]
p8a	10 Mar 1993	H2B	Restructured for public release. [Not released.]
p8b	15 Apr 1993	H2B	Updated for CWEAVE.W 3.0beta. [Not released.]

Version 3.0 --- Don Knuth, Silvio Levy, June 1993

p8c	21 Jun 1993	H2B	Updated for final CWEAVE.W 3.0.
p8d	25 Oct 1993	AS	Incorporated with AMIGA version 2.8 [p7]
				and updated for version 3.0.
p8e	04 Nov 1993	AS	Minor bug fixed for UNIX and GNU-C.

Version 3.1 --- Don Knuth, Silvio Levy, November 1993

p9	18 Nov 1993	AS	Updated for CWEAVE.W 3.1.
p9a	30 Nov 1993	AS	Minor changes and corrections.
p9b	06 Dec 1993	AS	Multilinguality implemented.
p9c	18 Jan 1994	AS	Version information included.
	03 Mar 1994	AS	`fflush' added for `Writing the index'.
p9d	13 May 1994	AS	Dynamic memory allocation.
	02 Jul 1994	AS	Portability version.

Version 3.2 --- Don Knuth, Silvio Levy, July 1994

p10	12 Aug 1994	AS	Updated for CWEAVE.W 3.2.
p10a	24 Aug 1994	AS	New option flag list.
	21 Sep 1994	AS	Output bug fixed.
	26 Sep 1994	AS	Replace `calloc' by `malloc'.
p10b	11 Oct 1994	AS	Write to check_file and compare results.
	18 Oct 1994	AS	Some refinements for C++ compilation.
	12 Nov 1994	AS	Use SEPARATORS instead of the multi-way
				selection for '/', ':', '\', etc.
	13 Nov 1994	AS	Take care of opened system resources and
				temporary files in case of an user abort.

Version 3.3 --- Don Knuth, Silvio Levy, December 1994

p11	03 Dec 1994	AS	Updated for CWEB 3.3.
	13 Dec 1994	AS	There have been corrections in Stanford.
	12 Feb 1995	AS	Use `memcmp' only once.

Version 3.4 --- Don Knuth, Silvio Levy, April 1995

p12	27 Apr 1995	AS	Updated for CWEB 3.4.

Version 3.4a --- Don Knuth, Silvio Levy, April 1995
Version 3.4b --- Don Knuth, Silvio Levy, May 1995

p13	12 May 1995	AS	Separate change files for the various
				elements of this patch to facilitate
				maintenance.  Aggregated with Guntermann's
				TIE processor.

Version 3.4c --- Don Knuth, Silvio Levy, June 1995

	13 Jun 1995	AS	Updated for CWEAVE 3.4c.

p14 11 March 1997 AS  Updated for patch level [p14].

Version 3.42 --- Don Knuth, Silvio Levy, August 1998

p15 13 August 1998 AS Updated for patch level [p15].

Version 3.43 --- Don Knuth, Silvio Levy, September 1998

p16 14 October 1998 AS Updated for patch level [p16].

Version 3.5 --- Don Knuth, Silvio Levy, December 1999

p17 3 January 2000 AS Updated for patch level [p17].

Version 3.6 --- Don Knuth, Silvio Levy, May 2000
Version 3.61 --- Don Knuth, Silvio Levy, May 2000

p18 17 May 2000 AS Updated for patch level [p18].
p19 2 January 2001 AS Updated for patch level [p19].

Version 3.64 --- Don Knuth, Silvio Levy, February 2002

p20 9 March 2002 AS Update for patch level [p20].
p21 29 October 2005 AS ANSI C++ patches for patch level [p21].
22p 18 August 2011 AS GCC patches for patch level [22p].

2018 17 October 2018 AS updated version number [2018].
------------------------------------------------------------------------------
@x l.33
\def\title{CWEAVE (Version 3.64)}
@y
\def\title{CWEAVE (Version 3.64 [CWEBbin 2018])}
@z

@x l.37
  \centerline{(Version 3.64)}
@y
  \centerline{(Version 3.64 [CWEBbin 2018])}
@z

Activate this, if only the changed modules should be printed.

x l.51
\let\maybe=\iftrue
y
\let\maybe=\iffalse
z

@x l.64
@d banner "This is CWEAVE (Version 3.64)\n"
@y
@d banner "This is CWEAVE (Version 3.64 [CWEBbin 2018])\n"
@z

@x l.4644
@** Index.
@y
@** Version information.  The {\mc AMIGA} operating system provides the
`version' command and good programs answer with some informations about
their creation date and their current version.  This might be useful for
other operating systems as well.

@<Glob...@>=
const char Version[] = "$VER: CWeave 3.64 [CWEBbin 2018] ("@|
  @= @>__DATE__@= @>", "@= @>__TIME__@= @>")\n";

@** Index.
@z
