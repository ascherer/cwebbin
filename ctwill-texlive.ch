% Kpathsea changes for CTWILL by Andreas Scherer
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-extensions.ch, cweav-output.ch, cweav-i18n.ch,
% cweav-twill.ch, and ctwill-texlive.ch that get tie'd into ctwill.w in
% TeX Live.

Material in limbo.

@x l.21 of CWEAV-TWILL.CH
\def\title{CTWILL (@VERSION@)}
@y
\def\title{CTWILL (Version 4.3 [\TeX~Live])}
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

@x l.61 of CWEAV-TWILL.CH
@d banner _("This is CTWILL (@VERSION@)")
@y
@d banner "This is CTWILL, Version 4.3"
  /* will be extended by the \TeX~Live |versionstring| */
@z

Section 5.

@x l.98 - Add Web2c version to banner.
  if (show_banner) puts(banner); /* print a ``banner line'' */
@y
  if (show_banner) cb_show_banner(); /* print a ``banner line'' */
@z

Sections 6--21.

@x l.112 and l.214 of CWEAV-PATCH.CH
@i comm-foo.h
@y
@i comm-w2c.h
@z

Section 80.

@x l.1414 and l.628 of CWEAV-TWILL.CH
saying \.{+P} on the command line, it's `\.{\\input proofmac}' (resp.\
\.{\\input Xproofmac} with option \.{+lX}), a set of macros used when
@y
saying \.{+P} on the command line, it's `\.{\\input ctproofmac}' (resp.\
\.{\\input Xctproofmac} with option \.{+lX}), a set of macros used when
@z

@x l.638 of CWEAV-TWILL.CH
tex_puts(proofing?"proofma":"ctwima");
@y
tex_puts(proofing?"ctproofma":"ctwima");
@z

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
