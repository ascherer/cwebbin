% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% ctang-patch.ch, ctang-ansi.ch, ctang-extensions.ch, ctang-output.ch,
% ctang-i18n.ch and ctang-texlive.ch that get tie'd into ctang-w2c.ch that
% is used as a monolithic changefile for ctangle.w in TeX Live.

Material in limbo.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.27 and l.164 of CTANG-PATCH.CH
\def\title{CTANGLE (Version 3.64 [CWEBbin 2018])}
@y
\def\title{CTANGLE (Version 3.64 [\TeX~Live])}
@z

@x l.31 and l.170 of CTANG-PATCH.CH
  \centerline{(Version 3.64 [CWEBbin 2018])}
@y
  \centerline{(Version 3.64 [\TeX~Live])}
@z

Section 1.

@x l.62 and l.189 of CTANG-PATCH.CH and l.17 of CTANG-I18N.CH
@d banner _("This is CTANGLE (Version 3.64 [CWEBbin 2018])")
@y
@d banner _("This is CTANGLE, Version 3.64")
  /* will be extended by the \TeX~Live |versionstring| */
@z

Section 3.

@x l.97
  program=ctangle;
@y
  program=ctangle;
  strncpy(cb_banner,banner,max_banner-1);
@z

@x l.100 and l.62 of CTANG-ANSI.CH - Add Web2C version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  if (show_banner) cb_show_banner(); /* print a ``banner line'' */
@z

Sections 5--15.

@x l.127 and l.72 of CTANG-ANSI.CH
@i comm-foo.h
@y
@i comm-w2c.h
@z
