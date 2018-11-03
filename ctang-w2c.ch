% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

FIXME: Use central @VERSION@ setting.

x l.27
\def\title{CTANGLE (Version 3.64)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.64)}
  \vfill}
y
\def\title{CTANGLE (Version 3.64k)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.64k)}
  \vfill}
z

This change can not be applied when `tie' is  used
(TOC file can not be typeset).

%@x l.48
%\let\maybe=\iftrue
%@y
%\let\maybe=\iffalse % print only sections that change
%@z

Section 1.

FIXME: Use central @VERSION@ setting.

x l.49
The ``banner line'' defined here should be changed whenever \.{CTANGLE}
is modified.

@d banner "This is CTANGLE (Version 3.64)\n"
y
The ``banner line'' defined here should be changed whenever \.{CTANGLE}
is modified.

@d banner "This is CTANGLE, Version 3.64"
z

Section 3.

FIXME: Use central @VERSION@ setting.

x l.100 - Add Web2C version to banner.
  if (show_banner) printf(banner); /* print a ``banner line'' */
y
  if (show_banner) {
    printf("%s%s\n", banner, versionstring); /* print a ``banner line'' */
  }
z

Section 6.

x common.h l.36
#include <stdio.h>
y
#include <kpathsea/kpathsea.h>
#include <stdio.h>
z

x common.h l.65
@d xisalpha(c) (isalpha(c)&&((eight_bits)c<0200))
@d xisdigit(c) (isdigit(c)&&((eight_bits)c<0200))
@d xisspace(c) (isspace(c)&&((eight_bits)c<0200))
@d xislower(c) (islower(c)&&((eight_bits)c<0200))
@d xisupper(c) (isupper(c)&&((eight_bits)c<0200))
@d xisxdigit(c) (isxdigit(c)&&((eight_bits)c<0200))
y
@d xisalpha(c) (isalpha((eight_bits)c)&&((eight_bits)c<0200))
@d xisdigit(c) (isdigit((eight_bits)c)&&((eight_bits)c<0200))
@d xisspace(c) (isspace((eight_bits)c)&&((eight_bits)c<0200))
@d xislower(c) (islower((eight_bits)c)&&((eight_bits)c<0200))
@d xisupper(c) (isupper((eight_bits)c)&&((eight_bits)c<0200))
@d xisxdigit(c) (isxdigit((eight_bits)c)&&((eight_bits)c<0200))
z

Section 9.

x common.h l.109 - protos now all in cweb.h.
extern name_pointer id_lookup(); /* looks up a string in the identifier table */
extern name_pointer section_lookup(); /* finds section name */
extern void print_section_name(), sprint_section_name();
y
#include "cweb.h"
z

Section 10.

x common.h l.123 - explicit types, protos now all in cweb.h.
extern history; /* indicates how bad this run was */
extern err_print(); /* print error message and context */
extern wrap_up(); /* indicate |history| and exit */
extern void fatal(); /* issue error message and die */
extern void overflow(); /* succumb because a table has overflowed */
y
extern int history; /* indicates how bad this run was */
z

Section 11.

x common.h l.131 - max_file_name_length is way too small.
@d max_file_name_length 60
y
@d max_file_name_length 1024
z

x common.h l.138 - explicit types.
extern include_depth; /* current level of nesting */
y
extern int include_depth; /* current level of nesting */
z

x common.h l.148 - explicit types.
extern line[]; /* number of current line in the stacked files */
extern change_line; /* number of current line in change file */
extern change_depth; /* where \.{@@y} originated during a change */
y
extern int line[]; /* number of current line in the stacked files */
extern int change_line; /* number of current line in change file */
extern int change_depth; /* where \.{@@y} originated during a change */
z

x common.h l.153 - protos now all in cweb.h.
extern reset_input(); /* initialize to read the web file and change file */
extern get_line(); /* inputs the next line */
extern check_complete(); /* checks that all changes were picked up */
y
z

Section 15.

x common.h l.192 - protos now all in cweb.h.
extern void common_init();
y
z
