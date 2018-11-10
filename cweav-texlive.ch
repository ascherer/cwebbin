% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

FIXME: Apply a more generic @VERSION@ scheme.

x l.32
\def\title{CWEAVE (Version 3.64)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CWEAVE} processor}
  \vskip 15pt
  \centerline{(Version 3.64)}
  \vfill}
y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\SQUARE{\vrule width 2pt depth -1pt height 3pt}
\def\sqitem{\item{\SQUARE}}

\def\title{CWEAVE (Version 3.64k)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CWEAVE} processor}
  \vskip 15pt
  \centerline{(Version 3.64k)}
  \vfill}
z

Section 1.

FIXME: Apply a more generic @VERSION@ scheme.

x l.65
The ``banner line'' defined here should be changed whenever \.{CWEAVE}
is modified.

@d banner "This is CWEAVE (Version 3.64)\n"
y
The ``banner line'' defined here should be changed whenever \.{CWEAVE}
is modified.

@d banner "This is CWEAVE, Version 3.64"
z

Section 3.

FIXME: Apply a more generic @VERSION@ scheme.

x l.107 - Add Web2C version to banner.
  if (show_banner) printf(banner); /* print a ``banner line'' */
y
  if (show_banner) {
     printf("%s%s\n", banner, versionstring); /* print a ``banner line'' */
  }
z