% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% ctang-patch.ch, ctang-output.ch, ctang-i18n.ch, and ctang-texlive.ch
% that get tie'd into ctang-w2c.ch that is used as a monolithic changefile
% for ctangle.w in TeX Live.

Material in limbo.

@x l.30 and l.169 of CTANG-PATCH.CH
\def\title{CTANGLE (@VERSION@)}
@y
\def\title{CTANGLE (Version 4.3 [\TeX~Live])}
@z

@x l.34 and l.175 of CTANG-PATCH.CH
  \centerline{(@VERSION@)}
@y
  \centerline{(Version 4.3 [\TeX~Live])}
@z

@x l.36
\def\botofcontents{\vfill
@y
\def\covernote{\vbox{%
@z

@x l.49
}
@y
}}\datecontentspage
@z

Section 1.

@x l.64 and l.188 of CTANG-PATCH.CH and l.17 of CTANG-I18N.CH
@d banner _("This is CTANGLE (@VERSION@)")
@y
@d banner "This is CTANGLE, Version 4.3"
  /* will be extended by the \TeX~Live |versionstring| */
@z

Section 2.

@x l.90 - Add Web2c version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  if (show_banner) cb_show_banner(); /* print a ``banner line'' */
@z

Sections 2--18.

@x l.101 and l.199 of CTANG-PATCH.CH
@i comm-foo.h
@y
@i comm-w2c.h
@z

Section 20.

@x l.129
@ @d max_texts 2500 /* number of replacement texts, must be less than 10240 */
@d max_toks 270000 /* number of bytes in compressed \CEE/ code */
@y
@ @d max_texts 10239 /* number of replacement texts, must be less than 10240 */
@d max_toks 1000000 /* number of bytes in compressed \CEE/ code */
@z

Appendix.

@x l.1553
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
