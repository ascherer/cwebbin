% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-ansi.ch, cweav-extensions.ch, cweav-output.ch,
% cweav-i18n.ch and cweav-texlive.ch that get tie'd into cweav-w2c.ch that
% is used as a monolithic changefile for cweave.w in TeX Live.

Material in limbo.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.33 and l.179 of CWEAV-PATCH.CH
\def\title{CWEAVE (Version 3.64 [CWEBbin 2018])}
@y
\def\title{CWEAVE (\TeX~Live 2019/dev)}
@z

@x l.37 and l.185 of CWEAV-PATCH.CH
  \centerline{(Version 3.64 [CWEBbin 2018])}
@y
  \centerline{(Version 3.64 [\TeX~Live 2019/dev])}
@z

Section 1.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.69 and l.204 of CWEAV-PATCH.CH and l.17 of CWEAV-I18N.CH
@d banner _("This is CWEAVE (Version 3.64 [CWEBbin 2018])")
@y
@d banner _("This is CWEAVE, Version 3.64")
  /* will be extended by the \TeX~Live |versionstring| */
@z

Section 3.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.108 and l.60 of CWEAV-ANSI.CH - Add Web2C version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  textdomain("cweb-tl");
@.cweb-tl.mo@>
  if (show_banner) printf("%s%s\n", banner, versionstring);
    /* print a ``banner line'' */
  textdomain("cweb");
@.cweb.mo@>
@z
