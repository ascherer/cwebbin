% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% ctang-patch.ch, ctang-output.ch, ctang-i18n.ch, and ctang-texlive.ch
% that get tie'd into ctang-w2c.ch that is used as a monolithic changefile
% for ctangle.w in TeX Live.

Material in limbo.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.30 and l.165 of CTANG-PATCH.CH
\def\title{CTANGLE (Version 3.65 [CWEBbin 2018])}
@y
\def\title{CTANGLE (\TeX~Live 2019/dev)}
@z

@x l.34 and l.171 of CTANG-PATCH.CH
  \centerline{(Version 3.65 [CWEBbin 2018])}
@y
  \centerline{(Version 3.65 [\TeX~Live 2019/dev])}
@z

Section 1.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.64 and l.187 of CTANG-PATCH.CH and l.16 of CTANG-I18N.CH
@d banner _("This is CTANGLE (Version 3.65 [CWEBbin 2018])")
@y
@d banner _("This is CTANGLE, Version 3.65")
  /* will be extended by the \TeX~Live |versionstring| */
@z

Section 3.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.97 - Add Web2C version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  textdomain("cweb-tl");
@.cweb-tl.mo@>
  if (show_banner) printf("%s%s\n", banner, versionstring);
    /* print a ``banner line'' */
  textdomain("cweb");
@.cweb.mo@>
@z
