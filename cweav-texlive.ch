% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-ansi.ch, cweav-extensions.ch, cweav-output.ch,
% cweav-i18n.ch and cweav-texlive.ch that get tie'd into cweav-w2c.ch that
% is used as a monolithic changefile for cweave.w in TeX Live.

Material in limbo.

@x l.33 and l.179 of CWEAV-PATCH.CH
\def\title{CWEAVE (@VERSION@)}
@y
\def\title{CWEAVE (Version 3.64 [\TeX~Live])}
@z

@x l.37 and l.185 of CWEAV-PATCH.CH
  \centerline{(@VERSION@)}
@y
  \centerline{(Version 3.64 [\TeX~Live])}
@z

Section 1.

@x l.69 and l.201 of CWEAV-PATCH.CH and l.17 of CWEAV-I18N.CH
@d banner _("This is CWEAVE (@VERSION@)")
@y
@d banner _("This is CWEAVE, Version 3.64")
  /* will be extended by the \TeX~Live |versionstring| */
@z

Section 3.

@x l.108 and l.60 of CWEAV-ANSI.CH - Add Web2C version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  if (show_banner) cb_show_banner(); /* print a ``banner line'' */
@z

Sections 5--15.

@x l.144 and l.68 of CWEAV-ANSI.CH
@i comm-foo.h
@y
@i comm-w2c.h
@z

@x l.4644
@** Index.
@y
@* Put ``version'' information in a single spot.
Don't do this at home, kids! Push our local macro to the variable in \.{COMMON}
for printing the |banner| and the |versionstring| from there.

@d max_banner 50

@<Common code...@>=
extern char cb_banner[];

@ @<Set init...@>=
  strncpy(cb_banner,banner,max_banner-1);

@** Index.
@z
