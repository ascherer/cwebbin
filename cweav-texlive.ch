% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-ansi.ch, cweav-extensions.ch, cweav-output.ch,
% cweav-i18n.ch and cweav-texlive.ch that get tie'd into cweav-w2c.ch that
% is used as a monolithic changefile for cweave.w in TeX Live.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.32 and l.177 of CWEAV-PATCH.CH
\def\title{CWEAVE (Version 3.64 [CWEBbin 2018])}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CWEAVE} processor}
  \vskip 15pt
  \centerline{(Version 3.64 [CWEBbin 2018])}
  \vfill}
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\SQUARE{\vrule width 2pt depth -1pt height 3pt}
\def\sqitem{\item{\SQUARE}}

\def\title{CWEAVE (\TeX~Live 2019/dev)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont The {\ttitlefont CWEAVE} processor}
  \vskip 15pt
  \centerline{(Version 3.64 [\TeX~Live 2019/dev])}
  \vfill}
@z

Section 1.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.65 and l.200 of CWEAV-PATCH.CH and l.15 of CWEAV-I18N.CH
The ``banner line'' defined here should be changed whenever \.{CWEAVE}
is modified.

@d banner _("This is CWEAVE (Version 3.64 [CWEBbin 2018])")
@y
The ``banner line'' defined here should be changed whenever \.{CWEAVE}
is modified.

@d banner _("This is CWEAVE, Version 3.64")
@z

Section 3.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.108 and l.54 of CWEAV-ANSI.CH - Add Web2C version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  textdomain("cweb-tl");
  if (show_banner) printf("%s%s\n", banner, versionstring);
    /* print a ``banner line'' */
  textdomain("cweb");
@z
