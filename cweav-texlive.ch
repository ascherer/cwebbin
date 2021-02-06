% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-extensions.ch, cweav-output.ch, cweav-i18n.ch and
% cweav-texlive.ch that get tie'd into cweav-w2c.ch that is used as a
% monolithic changefile for cweave.w in TeX Live.

Material in limbo.

@x l.35 and l.181 of CWEAV-PATCH.CH
\def\title{CWEAVE (@VERSION@)}
@y
\def\title{CWEAVE (Version 4.0 [\TeX~Live])}
@z

@x l.39 and l.187 of CWEAV-PATCH.CH
  \centerline{(@VERSION@)}
@y
  \centerline{(Version 4.0 [\TeX~Live])}
@z

@x l.41
\def\botofcontents{\vfill
@y
\def\covernote{\vbox{%
@z

@x l.54
}
@y
}}\datecontentspage
@z

Section 1.

@x l.70 and l.203 of CWEAV-PATCH.CH and l.17 of CWEAV-I18N.CH
@d banner _("This is CWEAVE (@VERSION@)")
@y
@d banner "This is CWEAVE, Version 4.0"
  /* will be extended by the \TeX~Live |versionstring| */
@z

Section 2.

@x l.97 - Add Web2c version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  if (show_banner) cb_show_banner(); /* print a ``banner line'' */
@z

Sections 3--18.

@x l.112 and l.211 of CWEAV-PATCH.CH
@i comm-foo.h
@y
@i comm-w2c.h
@z

@x l.4706
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
