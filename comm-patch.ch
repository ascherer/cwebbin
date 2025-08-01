								-*-Web-*-
This file, COMM-FOO.CH, is part of CWEBBIN (@VERSION@).
It is a changefile for COMMON.W, Version 4.12.2.

Technically, COMM-FOO.CH is constructed from a multitude of separate change
files by applying Klaus Guntermann's TIE processor.  Any comments (like this
introduction) are removed from the final output, so COMM-PATCH.CH is the place
to look up the development history.

Authors and Contributors:
(H2B) Hans-Hermann Bode, Universität Osnabrück,
  (hhbode@@dosuni1.rz.uni-osnabrueck.de or HHBODE@@DOSUNI1.BITNET).

(GG) Giuseppe Ghibò,
  (ghibo@@galileo.polito.it).

(KG) Klaus Guntermann, TH Darmstadt,
  (guntermann@@iti.informatik.th-darmstadt.de).

(AS) Andreas Scherer, RWTH Aachen,
  (andreas.scherer@@pobox.com).

(BS) Barry Schwartz,
  (trashman@@crud.mn.org).

(CS) Carsten Steger, Universität München,
  (carsten.steger@@informatik.tu-muenchen.de).

(TW) Tomas Willis,
  (tomas@@cae.wisc.edu).

This program is distributed WITHOUT ANY WARRANTY, express or implied.

The following copyright notice extends to this changefile only, not to
the masterfile COMMON.W.

Copyright (C) 1993-1995,1998,2000,2005,2018-2025 Andreas Scherer
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
a1/t1	10 Oct 1991	H2B	First attempt for COMMON.W 2.0.
p2	13 Feb 1992	H2B	Updated for COMMON.W 2.1, ANSI and Turbo
				changefiles merged together.
p3	16 Apr 1992	H2B	Updated for COMMON.W 2.2, change option for
				|@@i| completed.

Version 2.4 --- Don Knuth, Silvio Levy, June 1992

p4	22 Jun 1992	H2B	Updated for COMMON.W 2.4, getting INCLUDEDIR
				from environment variable CWEBINCLUDE.
p5	19 Jul 1992	H2B	string.h included, usage message extended.
p5a	24 Jul 1992	KG	adaptions for other ANSI C compiler
p5b	28 Jul 1992	H2B	Remaining headers converted to ANSI style.
p5c	30 Jul 1992	KG	removed comments used after #endif

Version 2.7 --- Don Knuth, Silvio Levy, July 1992

p6	06 Sep 1992	H2B	Updated for COMMON.W 2.7.
p6a	15 Mar 1993	AS	adaptions for SAS/C 6.0 compiler
p6b	28 Jul 1993	AS	path delimiters are `/' or `:' for AMIGA
	31 Aug 1993	AS	return codes extended to AMIGA values
p6c	04 Sep 1993	AS	path searching with CWEBINCLUDE

Version 2.8 --- Don Knuth, Silvio Levy, September 1992

p6d	09 Oct 1993	AS	Updated for COMMON.W 2.8. (This was p7 for me)
p7	06 Nov 1992	H2B	Converted to master change file, updated for
				common.w 2.8. [Not released.]
p7.5	29 Nov 1992	H2B	Updated for COMMON.W 2.9beta. [Not released.]
p8	04 Dec 1992	H2B	Updated for COMMON.W 2.9++ (stuff went into
				the source file). [Not released.]
p8a	10 Mar 1993	H2B	Restructured for public release.
				[Not released.]
p8b	15 Apr 1993	H2B	Updated for COMMON.W 3.0beta. [Not released.]

Version 3.0 --- Don Knuth, Silvio Levy, June 1993

p8c	21 Jun 1993	H2B	Updated for final COMMON.W 3.0.
p8d	26 Oct 1993	AS	Incorporated with AMIGA version 2.8 [p7] and
				updated to version 3.0.
p8e	04 Nov 1993	AS	Minor bugs fixed for UNIX and GNU-C.

Version 3.1 --- Don Knuth, Silvio Levy, November 1993

p9	18 Nov 1993	AS	Updated for COMMON.W 3.1
p9a	30 Nov 1993	AS	Minor changes and corrections.
p9b	06 Dec 1993	AS	Multilinguality implemented.
	07 Dec 1993	AS	Fixed an obvious portability problem.
p9c	18 Jan 1994	AS	Version information included.
	25 Mar 1994	AS	Special `wrap_up' for Borland C.
p9d	13 May 1994	AS	Dynamic memory allocation.
	24 Jun 1994	AS	ARexx support for error-handling
	02 Jul 1994	AS	Portability version.
p9e	09 Aug 1994	AS	Fix a memory bug.

Version 3.2 --- Don Knuth, Silvio Levy, August 1994

p10	12 Aug 1994	AS	Updated for CWEB 3.2.
p10a	24 Aug 1994	AS	New option flag list.
	11 Sep 1994	AS	Default values of CWEBINPUTS searched last.
	20 Sep 1994	AS	String argument to `-l' option.
	26 Sep 1994	AS	Replace `calloc' by `malloc'.
				Fix a bug in the `language switch'.
p10b	11 Oct 1994	AS	Write to check_file and compare results.
	18 Oct 1994	AS	Some refinements for C++ compilation.
	21 Oct 1994	AS	Use _DEV_NULL instead of the multi-way
				selection for the NULL path/device.
	29 Oct 1994	AS	Several Amiga #includes removed.
	12 Nov 1994	AS	Use SEPARATORS instead of the multi-way
				selection for '/', ':', '\', etc.
	13 Nov 1994	AS	Take care of opened system resources and
				temporary files in case of an user abort.

Version 3.3 --- Don Knuth, Silvio Levy, December 1994

p11	03 Dec 1994	AS	Updated for CWEB 3.3.
	13 Dec 1994	AS	There have been corrections in Stanford.
	11 Jan 1995	AS	AREXX communication for `__SASC' only.
	24 Jan 1995	AS	Yet another improvement in `wrap_up()'.
p13	07 May 1995	AS	Separate change files for the various
				elements of this patch to facilitate
				maintenance.  Aggregated with Guntermann's
				TIE processor.
	10 May 1995	AS	Separate change files for COMMON.H.

Version 3.4 --- Don Knuth, Silvio Levy, April 1995
Version 3.4a --- Don Knuth, Silvio Levy, April 1995
Version 3.4b --- Don Knuth, Silvio Levy, May 1995
Version 3.4c --- Don Knuth, Silvio Levy, June 1995

	13 Jun 1995	AS	Updated for COMMON.W 3.4c.
	15 Jun 1995	AS	Bug in temporary output mechanism fixed.

p14	11 March 1997	AS	Updated for patch level [p14].

Version 3.42 --- Don Knuth, Silvio Levy, August 1998

p15	13 August 1998	AS	Updated for patch level [p15].
p16	14 October 1998	AS	Updated for patch level [p16].

Version 3.5 --- Don Knuth, Silvio Levy, December 1999

p17	31 December 1999 AS	Updated for patch level [p17].

Version 3.6 --- Don Knuth, Silvio Levy, May 2000
Version 3.61 --- Don Knuth, Silvio Levy, July 2000

p18	25 July 2000	AS	Updated for patch level [p18].
p19	02 Januar 2001	AS	Updated for patch level [p19].

Version 3.64 --- Don Knuth, Silvio Levy, February 2002

p20	09 March 2002	AS	Update for patch level [p20].
p21	29 October 2005	AS	ANSI C++ patches to patch level [p21].
22p	18 August 2011	AS	GCC patches to patch level [22p].

2018	17 October 2018	AS	Updated version number [2018].
	06 November 2018 AS	Integration with TeXLive.

2020	11 March 2020	AS	Externalize common variables.
	07 June 2020	AS	Fix two message errors.

2021	04 February 2021	AS	Tuneup for CWEB 4.0 [2021].
	20 February 2021	AS	Tuneup for CWEB 4.1 [2021].
	25 February 2021	AS	Tuneup for CWEB 4.2 [2021].
	13 April 2021		AS	Tuneup for CWEB 4.3 [2021].
	06 June 2021		AS	Tuneup for CWEB 4.4 [2021].
	14 July 2021		AS	Tuneup for CWEB 4.5 [2021].
	25 December 2021	AS	Tuneup for CWEB 4.6 [2021].

2022	05 February 2022	AS	Tuneup for CWEB 4.7 [2022].
	05 June 2022		AS	Tuneup for CWEB 4.8 [2022].

2023	15 May 2023		AS	Tuneup for CWEB 4.9 [2023].
	19 August 2023		AS	Tuneup for CWEB 4.10 [2023].
	02 December 2023	AS	Tuneup for CWEB 4.11 [2023].

2024	12 August 2024		AS	Tuneup for CWEB 4.12 [2024].
2025	01 January 2025		AS	Tuneup for CWEB 4.12.1 [2025].
2025	27 July 2025		AS	Tuneup for CWEB 4.12.2 [2025].
------------------------------------------------------------------------------
Material in limbo.

@x l.25
\def\title{Common code for CTANGLE and CWEAVE (Version 4.12.2)}
@y
\def\title{Common code for CTANGLE and CWEAVE (@VERSION@)}
@z

@x l.30
  \centerline{(Version 4.12.2)}
@y
  \centerline{(@VERSION@)}
@z

Activate this, if only the changed modules should be printed.

x l.48
\let\maybe=\iftrue
y
\let\maybe=\iffalse % print only changed modules
z

Section 2.

@x l.72
@i common.h
@y
@i comm-foo.h
@z

Section 85.

@x l.1286
@* Index.
@y
@* Extensions to {\tentex CWEB}.  The following sections introduce new or
improved features that have been created by numerous contributors over the
course of a quarter century.

Care has been taken to keep the original section numbering intact, so this new
material should nicely integrate with the original ``\&{85.~Index}.''

@* Index.
@z
