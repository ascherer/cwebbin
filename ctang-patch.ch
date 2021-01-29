								-*-Web-*-
This file, CTANG-FOO.CH, is part of CWEBBIN (@VERSION@).
It is a changefile for CTANGLE.W, Version 3.65.

Technically, CTANG-FOO.CH is constructed from a multitude of separate
change files by applying Klaus Guntermann's TIE processor.  Any comments
(like this introduction) are removed from the final output, so
CTANG-PATCH.CH is the place to look up the development history.

Authors and Contributors:
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
the masterfile CTANGLE.W.

Copyright (C) 1993-1995,1998,2000,2005,2011,2019,2021 Andreas Scherer
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
a1/t1	10 Oct 1991	H2B	First attempt for CTANGLE.W 2.0.
p2	13 Feb 1992	H2B	Updated for CTANGLE.W 2.2, ANSI and Turbo
				changefiles merged together.

Version 2.4 --- Don Knuth, Silvio Levy, April 1992

p3	16 Apr 1992	H2B	Updated for CTANGLE.W 2.4.
p4	21 Jun 1992	H2B	Nothing changed.
p5	18 Jul 1992	H2B	Extensions for C++ implemented.
p5a	24 Jul 1992	KG	adaptions for other ANSI C compiler
p5b	28 Jul 1992	H2B	Remaining headers converted to ANSI style.

Version 2.7 --- Don Knuth, Silvio Levy, July 1992

p6	06 Sep 1992	H2B	Updated for CTANGLE.W 2.7, |dot_dot_dot|
				added, parsing of @@'\'' fixed (due to KG),
				@@<Copy an ASCII constant@@> extended,
				(nonfatal) confusion in processing short
				comments fixed.
p6a	15 Mar 1993	AS	Re-changing some of the TC stuff to SAS/C
p6b	27 Jul 1993	AS	new patch level in accordance with CWeave
p6c	04 Sep 1993	AS	new patch level in accordance with Common

Version 2.8 --- Don Knuth, Silvio Levy, September 1992

p6d	09 Oct 1993	AS	Updated for CTANGLE.W 2.8. (This was p7)
p7	13 Nov 1992	H2B	Converted to master change file, updated for
				CTANGLE.W 2.8. [Not released.]
p7.5	29 Nov 1992	H2B	Updated for CTANGLE.W 2.9beta. [Not released.]
p8	08 Dec 1992	H2B	Updated for CTANGLE.W 2.9++ (stuff went into
				the source file), ANSI bug in <Get a constant>
				fixed. [Not released.]
p8a	10 Mar 1993	H2B	Restructured for public release.
				[Not released.]
p8b	14 Apr 1993	H2B	Updated for CTANGLE.W 3.0beta. [Not released.]

Version 3.0 --- Don Knuth, Silvio Levy, June 1993

p8c	21 Jun 1993	H2B	Updated for final CTANGLE.W 3.0.
p8d	25 Oct 1993	AS	Incorporated into Amiga version 2.8 [p7] and
				updated for version 3.0.
p8e	04 Nov 1993	AS	New patch level in accordance with COMMON.

Version 3.1 --- Don Knuth, Silvio Levy, November 1993

p9	18 Nov 1993	AS	Updated for CTANGLE.W 3.1.
p9a	30 Nov 1993	AS	Minor changes and corrections.
p9b	06 Dec 1993	AS	Multilinguality implemented.
p9c	18 Jan 1994	AS	Version information included.
p9d	13 May 1994	AS	Dynamic memory allocation.
	02 Jul 1994	AS	Portability version.

Version 3.2 --- Don Knuth, Silvio Levy, July 1994

p10	12 Aug 1994	AS	Updated for CTANGLE.W 3.2.
p10a	24 Aug 1994	AS	New patch level.
	26 Sep 1994	AS	Replace `calloc' by `malloc'.
p10b	11 Oct 1994	AS	Write to check_file and compare results.
	18 Oct 1994	AS	Some refinements for C++ compilation.
	12 Nov 1994	AS	Use SEPARATORS instead of the multi-way
				selection for '/', ':', '\', etc.
	13 Nov 1994	AS	Take care of opened system resources and
				temporary files in case of an user abort.
	25 Nov 1994	AS	CWEB 3.2 [p10b] works with Boheyland 3.1.
				Reduce `max_toks' drastically.

Version 3.3 --- Don Knuth, Silvio Levy, December 1994

p11	03 Dec 1994	AS	Updated for CWEB 3.3.
	12 Feb 1995	AS	Use `memcmp' only once.

Version 3.4 --- Don Knuth, Silvio Levy, April 1995

p12	18 Apr 1995	AS	Updated for CWEB 3.4.
p13	10 May 1995	AS	Separate change files for the various
				elements of this patch to facilitate
				maintenance.  Aggregated with Guntermann's
				TIE processor.
p14	11 March 1997	AS	Updated for patch level [p14].

Version 3.42 --- Don Knuth, Silvio Levy, August 1998

p15	13 August 1998	AS	Updated for patch level [p15].

Version 3.43 --- Don Knuth, Silvio Levy, September 1998

p16	14 October 1998	AS	Updated for patch level [p16].

Version 3.5 --- Don Knuth, Silvio Levy, December 1999

p17	31 December 1999 AS	Updated for patch level [p17].

Version 3.6 --- Don Knuth, Silvio Levy, May 2000
Version 3.61 --- Don Knuth, Silvio Levy, July 2000

p18	25 July 2000	AS	Updated for patch level [p18].

Version 3.62 --- Don Knuth, Silvio Levy, September 2000

p19	02 Januar 2001	AS	Updated for patch level [p19].

Version 3.64 --- Don Knuth, Silvio Levy, February 2002

p20	09 March 2002	AS	Updated for patch level [p20].
p21	29 October 2005	AS	ANSI C++ patches for patch level [p21].
22p	18 August 2011	AS	GCC patches for patch level [22p].

2018	17 October 2018	AS	Updated version number [2018].
	06 November 2018 AS	Integration with TeXLive.

2021	25 January 2021	AS	2021 tuneup for CWEB 3.65 [2021].
------------------------------------------------------------------------------
Material in limbo.

@x l.30
\def\title{CTANGLE (Version 3.65)}
@y
\def\title{CTANGLE (@VERSION@)}
@z

@x l.34
  \centerline{(Version 3.65)}
@y
  \centerline{(@VERSION@)}
@z

Activate this, if only the changed modules should be printed.

x l.51
\let\maybe=\iftrue
y
\let\maybe=\iffalse % print only sections that change
z

Section 1.

@x l.64
@d banner "This is CTANGLE (Version 3.65)"
@y
@d banner "This is CTANGLE (@VERSION@)"
@z

Section 5.

@x l.127
@i common.h
@y
@i comm-foo.h
@z

Addendum.

@x l.1550
@** Index.
@y
@** Extensions to \.{CWEB}.  The following sections introduce new or improved
features that have been created by numerous contributors over the course of a
quarter century.

Care has been taken to keep the original section numbering intact, so this new
material should nicely integrate with the original ``\&{105.~Index}.''

@** Index.
@z
