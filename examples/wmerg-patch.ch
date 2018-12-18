								-*-Web-*-
This file, WMERG-FOO.CH, is part of CWEBBIN (Version 3.64 [2018]).
It is a changefile for WMERGE.W, Version 3.64.

Technically, WMERG-FOO.CH is constructed from a multitude of separate
change files by applying Klaus Guntermann's TIE processor.  Any comments
(like this introduction) are removed from the final output, so
WMERG-PATCH.CH is the place to look up the development history.

Authors and Contributors:
(H2B) Hans-Hermann Bode, Universität Osnabrück,
  (hhbode@@dosuni1.rz.uni-osnabrueck.de or HHBODE@@DOSUNI1.BITNET).

(KG) Klaus Guntermann, TH Darmstadt,
  (guntermann@@iti.informatik.th-darmstadt.de).

(AS) Andreas Scherer, RWTH Aachen,
  (andreas.scherer@@pobox.com).

(BS) Barry Schwartz
  (trashman@@crud.mn.org).

(GG) Giuseppe Ghibò
  (ghibo@@galileo.polito.it).

This program is distributed WITHOUT ANY WARRANTY, express or implied.

The following copyright notice extends to this changefile only, not to
the masterfile WMERGE.W.

Copyright (C) 1991-1993 Hans-Hermann Bode
Copyright (C) 1993-1999,2005 Andreas Scherer
Copyright (C) 1994 Barry Schwartz

Permission is granted to make and distribute verbatim copies of this
document provided that the copyright notice and this permission notice
are preserved on all copies.

Permission is granted to copy and distribute modified versions of this
document under the conditions for verbatim copying, provided that the
entire resulting derived work is distributed under the terms of a
permission notice identical to this one.

Version history:

Version	Date		Author	Comment
p2	13 Feb 1992	H2B	First hack.
p3	16 Apr 1992	H2B	Change of |@@i| allowed, /dev/null in case
				replaced by nul.
p4	21 Jun 1992	H2B	Nothing changed.
p5	21 Jul 1992	H2B	Nothing changed.
p5a	30 Jul 1992	KG	remove one #include <stdio.h>,
				use strchr instead of index and
				include <string.h> for |strchr| declaration
p5b	06 Aug 1992	KG	fixed a typo
p6	06 Sep 1992	H2B	Nothing changed.
p6a     15 Mar 1993     AS      SAS/C 6.0 support
p6b     28 Jul 1993     AS      make some functions return `void'
p6c	04 Sep 1993	AS	path searching with CWEBINCLUDE
p7	09 Oct 1993	AS	Updated to CWEB 2.8
p8a	11 Mar 1993	H2B	Converted to master change file.
				[Not released.]
p8b	15 Apr 1993	H2B	Updated for wmerge.w 3.0beta (?).
				[Not released.]
p8c	22 Jun 1993	H2B	Updated for final wmerge.w 3.0 (?).
p8d	26 Oct 1993	AS	Incorporated with Amiga version 2.8 [p7].
p8e	04 Nov 1993	AS	New patch level in accordance with CWEB.
p9	18 Nov 1993	AS	Update for wmerge.w 3.1.
	26 Nov 1993	AS	Minor casting problems fixed.
p9c	18 Jan 1994	AS	Version information included.
p9d	09 Aug 1994	AS	Extend buf_size.
p10	12 Aug 1994	AS	Updated for wmerge.w 3.2.
p10a	24 Aug 1994	AS	New patch level.
p10b	11 Oct 1994	AS	Write to check_file and compare results.
	13 Oct 1994	AS	WMerge residentable.
	18 Oct 1994	AS	Some refinements for C++ compilation.
	21 Oct 1994	AS	Use _DEV_NULL instead of the multi-way
				selection for the NULL path/device.
	12 Nov 1994	AS	Use SEPARATORS instead of the multi-way
				selection for '/', ':', '\', etc.
p11	03 Dec 1994	AS	Updated for wmerge.w 3.3.
	13 Dec 1994	AS	Slight correction in `wrap_up()'.
	24 Jan 1995	AS	Yet another improvement in `wrap_up()'.
	12 Feb 1995	AS	Use `memcmp' only once.
p13	10 May 1995	AS	Separate change files for the various
				elements of this patch to facilitate
				maintenance.  Aggregated with Guntermann's
				TIE processor.
	13 Jun 1995	AS	Updated for wmerge.w 3.4c.
	15 Jun 1995	AS	Bug in temporary output mechanism fixed.
	28 Sep 1995	GG	Minor corrections.
	15 Nov 1995	AS	Updated for wmerge.w 3.4e.
	07 Jun 1996	AS	Updated for wmerge.w 3.4g.
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
p19	02 January 2001	AS	Updated for patch level [p19].

Version 3.64 --- Don Knuth, Silvio Levy, February 2002

p20	09 March 2002	AS	Update for patch level [p20].
p21	29 October 2005	AS	ANSI C++ patches for patch level [p21].
22p	18 August 2011	AS	ANSI C++ patches for patch level [22p].

2018	17 October 2018	AS	Updated version number [2018].
------------------------------------------------------------------------------
Two of the last long-standing bugs in CWEB; reported to DEK long ago.

@x l.8
file and and optional \.{.ch} file and sends the corresponding
@y
file and an optional \.{.ch} file and sends the corresponding
@z

@x l.88
@:caddr_t}{\bf caddr_t@>
@y
@:caddr_t}{\bf caddr\_t@>
@z

@x l.709
@* Index.
@y
@* Version information.  The {\mc AMIGA} operating system provides the
`version' command and good programs answer with some informations about
their creation date and their current version.  This might be useful for
other operating systems as well.

@<Defi...@>=
const char Version[] = "$VER: WMerge 3.64 [CWEBbin 2018] ("@|
  __DATE__@= @>", "@= @>__TIME__@= @>")\n";

@* Index.
@z
