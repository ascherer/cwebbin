								-*-Web-*-
This file, WC-ANSI.CH, is part of CWEBBIN (Version 4.12.2).

This program is distributed WITHOUT ANY WARRANTY, express or implied.

The following copyright notice extends to this changefile only, not to the
masterfile.

Copyright (c) 1993,1998,2026 Andreas Scherer

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
p2	29 Sep 1993	AS	File descriptor fd replaced by FILE pointer fp
p3	13 Aug 1998	AS	Renamed to wc-ansi.ch for CWEB 3.42.
p4	23 Jan 2026	AS	Reduce changes to 'open/fopen' etc.
------------------------------------------------------------------------------
@x l.5 Save paper.
\def\SPARC{SPARC\-\kern.1em station}
@y
\def\SPARC{SPARC\-\kern.1em station}
\def\fin{\par\vfill\eject % this is done when we are ending the index
  \message{Section names:}
  \def\note##1##2.{\quad{\eightrm##1~##2.}}
  \def\U{\note{Used in section}} % crossref for use of a section
  \def\Us{\note{Used in sections}} % crossref for uses of a section
  \def\I{\par\hangindent 2em}\let\*=*
  \readsections}
@z
------------------------------------------------------------------------------
We want *all* programs in this directory to be fully ANSI compatible.
@x l.119
@ Here's the code to open the file.  A special trick allows us to
handle input from |stdin| when no name is given.
Recall that the file descriptor to |stdin| is~0; that's what we
use as the default initial value.

@<Variabl...@>=
int fd=0; /* file descriptor, initialized to |stdin| */
@y
@ Here's the code to open the file.  A special trick allows us to
handle input from |stdin| when no name is given.

@<Variabl...@>=
FILE *fp=stdin; /* file pointer, initialized to the console */
@z
------------------------------------------------------------------------------
@x l.127
@ @d READ_ONLY 0 /* read access code for system |open| routine */
@y
@ @d READ_ONLY "r" /* read access code for system |fopen| routine */
@z
------------------------------------------------------------------------------
@x l.130
if (file_count>0 && (fd=open(*(++argv),READ_ONLY))<0) {
@y
if (file_count>0 && (fp=fopen(*(++argv),READ_ONLY))==0) {
@z
------------------------------------------------------------------------------
@x l.138
@ @<Close file@>=
close(fd);
@y
@ @<Close file@>=
fclose(fp);
@z
------------------------------------------------------------------------------
@x l.189
if (ptr>=buf_end) {
  ptr=buffer; c=read(fd,ptr,buf_size);
  if (c<=0) break;
  char_count+=c; buf_end=buffer+c;
}
@y
if (ptr>=buf_end) {
  ptr=buffer; c=fread(ptr,1,buf_size,fp);
  if (c<=0) break;
  char_count+=c; buf_end=buffer+c;
}
@z
------------------------------------------------------------------------------
