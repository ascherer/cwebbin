% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

FIXME: Apply a more generic @VERSION@ scheme.

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

x l.48
\let\maybe=\iftrue
y
\let\maybe=\iffalse % print only sections that change
z

Section 1.

FIXME: Apply a more generic @VERSION@ scheme.

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

FIXME: Apply a more generic @VERSION@ scheme.

x l.100 - Add Web2C version to banner.
  if (show_banner) printf(banner); /* print a ``banner line'' */
y
  if (show_banner) {
    printf("%s%s\n", banner, versionstring); /* print a ``banner line'' */
  }
z
