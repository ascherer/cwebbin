% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

FIXME: Use central @VERSION@ setting.

@x l.27
\def\title{CTANGLE (Version 3.64)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.64)}
  \vfill}
@y
\def\title{CTANGLE (Version 3.64k)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.64k)}
  \vfill}
@z

This change can not be applied when `tie' is  used
(TOC file can not be typeset).

%@x l.48
%\let\maybe=\iftrue
%@y
%\let\maybe=\iffalse % print only sections that change
%@z

Section 1.

FIXME: Use central @VERSION@ setting.

@x l.49
The ``banner line'' defined here should be changed whenever \.{CTANGLE}
is modified.

@d banner "This is CTANGLE (Version 3.64)\n"
@y
The ``banner line'' defined here should be changed whenever \.{CTANGLE}
is modified.

@d banner "This is CTANGLE, Version 3.64"
@z

Section 3.

FIXME: Use central @VERSION@ setting.

@x l.100 - Add Web2C version to banner.
  if (show_banner) printf(banner); /* print a ``banner line'' */
@y
  if (show_banner) {
    printf("%s%s\n", banner, versionstring); /* print a ``banner line'' */
  }
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
