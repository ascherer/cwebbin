% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% ctang-patch.ch, ctang-ansi.ch, ctang-extensions.ch, ctang-output.ch,
% ctang-i18n.ch and ctang-texlive.ch that get tie'd into ctang-w2c.ch that
% is used as a monolithic changefile for ctangle.w in TeX Live.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.27 and l.162 of CTANG-PATCH.CH
\def\title{CTANGLE (Version 3.64 [CWEBbin 2018])}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.64 [CWEBbin 2018])}
  \vfill}
@y
\def\title{CTANGLE (\TeX~Live 2019/dev)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CTANGLE} processor}
  \vskip 15pt
  \centerline{(Version 3.64 [\TeX~Live 2019/dev])}
  \vfill}
@z

Section 1.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.62 and l.185 of CTANG-PATCH.CH and l.15 of CTANG-I18N.CH
The ``banner line'' defined here should be changed whenever \.{CTANGLE}
is modified.

@d banner _("This is CTANGLE (Version 3.64 [CWEBbin 2018])")
@y
The ``banner line'' defined here should be changed whenever \.{CTANGLE}
is modified.

@d banner _("This is CTANGLE, Version 3.64")
@z

Section 3.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.100 and l.54 of CTANG-ANSI.CH - Add Web2C version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  textdomain("cweb-tl");
  if (show_banner) printf("%s%s\n", banner, versionstring);
    /* print a ``banner line'' */
  textdomain("cweb");
@z
