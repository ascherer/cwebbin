% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-extensions.ch, cweav-output.ch, cweav-i18n.ch and
% cweav-texlive.ch that get tie'd into cweav-w2c.ch that is used as a
% monolithic changefile for cweave.w in TeX Live.

Material in limbo.

@x l.35 and l.184 of CWEAV-PATCH.CH
\def\title{CWEAVE (@VERSION@)}
@y
\def\title{CWEAVE (Version 4.3 [\TeX~Live])}
@z

@x l.39 and l.190 of CWEAV-PATCH.CH
  \centerline{(@VERSION@)}
@y
  \centerline{(Version 4.3 [\TeX~Live])}
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

@x l.70 and l.206 of CWEAV-PATCH.CH and l.17 of CWEAV-I18N.CH
@d banner _("This is CWEAVE (@VERSION@)")
@y
@d banner "This is CWEAVE, Version 4.3"
  /* will be extended by the \TeX~Live |versionstring| */
@z

Section 2.

@x l.98 - Add Web2c version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  if (show_banner) cb_show_banner(); /* print a ``banner line'' */
@z

Sections 3--18.

@x l.112 and l.214 of CWEAV-PATCH.CH
@i comm-foo.h
@y
@i comm-w2c.h
@z

Section 19.

@x l.119
@d max_refs 20000 /* number of cross-references; must be less than 65536 */
@d max_scraps 2000 /* number of tokens in \CEE/ texts being parsed */
@y
@d max_refs 65535 /* number of cross-references; must be less than 65536 */
@d max_scraps 5000 /* number of tokens in \CEE/ texts being parsed */
@z

Section 30.

@x
@d max_toks 20000 /* number of symbols in \CEE/ texts being parsed;
  must be less than 65536 */
@d max_texts 4000 /* number of phrases in \CEE/ texts being parsed;
  must be less than 10240 */
@y
@d max_toks 65535 /* number of symbols in \CEE/ texts being parsed;
  must be less than 65536 */
@d max_texts 10239 /* number of phrases in \CEE/ texts being parsed;
  must be less than 10240 */
@z

Appendix.

@x l.4896
@** Index.
@y
@* Print ``version'' information.
Don't do this at home, kids! Push our local macro to the variable in \.{COMMON}
for printing the |banner| and the |versionstring| from there.

@d max_banner 50

@<Common code...@>=
extern char cb_banner[];

@ @<Set init...@>=
  strncpy(cb_banner,banner,max_banner-1);

@** Index.
@z
