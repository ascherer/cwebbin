								-*-Web-*-
This file, EXTEX-ANSI.CH, is part of CWEBBIN (Version 3.4 [p15]).  It is a
changefile written by Andreas Scherer, Rochusstra�e 22-24, 52062 Aachen,
Germany, for EXTEX.W providing changes appropriate for ANSI-C compilers.

This program is distributed WITHOUT ANY WARRANTY, express or implied.

The following copyright notice extends to this changefile only, not to the
masterfile.

Copyright (c) 1993,1998 Andreas Scherer

Permission is granted to make and distribute verbatim copies of this
document provided that the copyright notice and this permission notice
are preserved on all copies.

Permission is granted to copy and distribute modified versions of this
document under the conditions for verbatim copying, provided that the
entire resulting derived work is distributed under the terms of a
permission notice identical to this one.

Version history:

Version	Date		Author	Comment
p1	1 Sep 1993	AS	First hack.
p2	13 Aug 1998	AS	Renamed to extex-ansi.ch to avoid a naming conflict.
------------------------------------------------------------------------------
Some external routines and all the internal routines need prototypes.
@x l.46
@c
#include <stdio.h>
#include <ctype.h>
extern void exit(); /* system routine that terminates execution */
@#
@<Global variables@>@;
@<Procedures@>@;
@#
int main(argc,argv)
@y
@c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
@#
@<Global variables@>@;
@<Prototypes@>@;
@<Procedures@>@;
@#
int main(argc,argv)
@z
------------------------------------------------------------------------------
The extra module for the prototypes won't mess up the numbering.
@x l.356
@* Index.
@y
@ The internal routines are declared here.

@<Prototypes@>=
int get(void);
int controlseq(void);

@* Index.
@z
------------------------------------------------------------------------------
