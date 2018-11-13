% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.27 and l.162 of CTANG-PATCH.CH
\def\title{CTANGLE (Version 3.64 [CWEBbin 2018])}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.64 [CWEBbin 2018])}
  \vfill}
@y
\def\title{CTANGLE (Version 3.64k)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.64k)}
  \vfill}
@z

Section 1.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.62 and l.185 of CTANG-PATCH.CH and l.15 of CTANG-I18N.CH
The ``banner line'' defined here should be changed whenever \.{CTANGLE}
is modified.

@d banner _("This is CTANGLE (Version 3.64 [CWEBbin 2018])\n")
@y
The ``banner line'' defined here should be changed whenever \.{CTANGLE}
is modified.

@d banner _("This is CTANGLE, Version 3.64")
@z

Section 3.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.100 and l.54 of CTANG-ANSI.CH - Add Web2C version to banner.
  if (show_banner) fputs(banner,stdout); /* print a ``banner line'' */
@y
  if (show_banner) {
    printf("%s%s\n", banner, versionstring); /* print a ``banner line'' */
  }
@z
