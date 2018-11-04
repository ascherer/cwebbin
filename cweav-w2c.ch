% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.


@x l.32
\def\title{CWEAVE (Version 3.64)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CWEAVE} processor}
  \vskip 15pt
  \centerline{(Version 3.64)}
  \vfill}
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\SQUARE{\vrule width 2pt depth -1pt height 3pt}
\def\sqitem{\item{\SQUARE}}

\def\title{CWEAVE (Version 3.64k)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CWEAVE} processor}
  \vskip 15pt
  \centerline{(Version 3.64k)}
  \vfill}
@z

This change cannot be applied when `tie' is  used
(TOC file can not be typeset).

%@x l.51
%\let\maybe=\iftrue
%@y
%\let\maybe=\iffalse % print only changed modules
%@z


Section 1.

@x l.65
The ``banner line'' defined here should be changed whenever \.{CWEAVE}
is modified.

@d banner "This is CWEAVE (Version 3.64)\n"
@y
The ``banner line'' defined here should be changed whenever \.{CWEAVE}
is modified.

@d banner "This is CWEAVE, Version 3.64"
@z


Section 3.

@x l.107 - Add Web2C version to banner.
  if (show_banner) printf(banner); /* print a ``banner line'' */
@y
  if (show_banner) {
     printf("%s%s\n", banner, versionstring); /* print a ``banner line'' */
  }
@z

@x l.112 - 'use' print_text(), used nowhere else
  return wrap_up(); /* and exit gracefully */
@y
  if (0) print_text(text_ptr);
  return wrap_up(); /* and exit gracefully */
@z

Section 6.

@x common.h l.36
#include <stdio.h>
@y
#include <kpathsea/kpathsea.h>
#include <stdio.h>
@z

Section 9.

@x common.h l.109 - protos now all in cweb.h.
extern name_pointer id_lookup(); /* looks up a string in the identifier table */
extern name_pointer section_lookup(); /* finds section name */
extern void print_section_name(), sprint_section_name();
@y
#include "cweb.h"
@z

Section 10.

@x common.h l.123 - explicit types, protos now all in cweb.h.
extern err_print(); /* print error message and context */
extern wrap_up(); /* indicate |history| and exit */
extern void fatal(); /* issue error message and die */
extern void overflow(); /* succumb because a table has overflowed */
@y
@z

Section 11.

@x common.h l.153 - protos now all in cweb.h.
extern reset_input(); /* initialize to read the web file and change file */
extern get_line(); /* inputs the next line */
extern check_complete(); /* checks that all changes were picked up */
@y
@z

Section 15.

@x common.h l.192 - protos now all in cweb.h.
extern void common_init();
@y
@z

Section 38.

@x l.682 - Add declaration for versionstring.
#include <ctype.h> /* definition of |isalpha|, |isdigit| and so on */
@y
@z

Section 169.

@x l.3096 -- rename local var, not to shadow param
{ scrap_pointer k; /* pointer into |scrap_info| */
  if (tracing==2) {
    printf("\n%d:",n);
    for (k=scrap_base; k<=lo_ptr; k++) {
      if (k==pp) putxchar('*'); else putxchar(' ');
      if (k->mathness %4 ==  yes_math) putchar('+');
      else if (k->mathness %4 ==  no_math) putchar('-');
      print_cat(k->cat);
      if (k->mathness /4 ==  yes_math) putchar('+');
      else if (k->mathness /4 ==  no_math) putchar('-');
@y
{ scrap_pointer k_l; /* pointer into |scrap_info| */
  if (tracing==2) {
    printf("\n%d:",n);
    for (k_l=scrap_base; k_l<=lo_ptr; k_l++) {
      if (k_l==pp) putxchar('*'); else putxchar(' ');
      if (k_l->mathness %4 ==  yes_math) putchar('+');
      else if (k_l->mathness %4 ==  no_math) putchar('-');
      print_cat(k_l->cat);
      if (k_l->mathness /4 ==  yes_math) putchar('+');
      else if (k_l->mathness /4 ==  no_math) putchar('-');
@z

Section 226.

@x l.4309 Use binary mode for output files
  if ((idx_file=fopen(idx_file_name,"w"))==NULL)
@y
  if ((idx_file=fopen(idx_file_name,"wb"))==NULL)
@z

@x l.4324 Use binary mode for output files
  if ((scn_file=fopen(scn_file_name,"w"))==NULL)
@y
  if ((scn_file=fopen(scn_file_name,"wb"))==NULL)
@z
