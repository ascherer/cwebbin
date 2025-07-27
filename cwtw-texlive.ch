% Kpathsea changes for CWEAVE and CTWILL by Andreas Scherer
% This file is in the Public Domain.

% These changes apply to both CWEAVE and CTWILL when preparing their
% incantations for TeX Live. They were factored out of cweav-texlive.ch
% and ctwill-texlive.ch to avoid redundancy and discrepancy.

Material in limbo.

@x l.39 and CWEAV-PATCH.CH
  \centerline{(@VERSION@)}
@y
  \centerline{(Version 4.12.2 [\TeX~Live])}
@z

@x l.41
\def\botofcontents{\vfill
@y
\def\covernote{\vbox{%
@z

@x l.54
}
@y
}}
@z

Section 2.

@x l.98 - Add Web2c version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  if (show_banner) cb_show_banner(); /* print a ``banner line'' */
@z

Sections 3--18.

@x l.112 and CWEAV-PATCH.CH
@i comm-foo.h
@y
@i comm-w2c.h
@z

Section 23.

@x l.217
@ @d max_refs 30000 /* number of cross-references; must be less than 65536 */
@y
@ @d max_refs 65535 /* number of cross-references; must be less than 65536 */
@z

Section 30.

@x l.337
@d max_toks 30000 /* number of symbols in \CEE/ texts being parsed;
  must be less than 65536 */
@d max_texts 8000 /* number of phrases in \CEE/ texts being parsed;
  must be less than 10240 */
@y
@d max_toks 65535 /* number of symbols in \CEE/ texts being parsed;
  must be less than 65536 */
@d max_texts 10239 /* number of phrases in \CEE/ texts being parsed;
  must be less than 10240 */
@z

Appendix.

@x l.4892
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
