% Kpathsea changes for CTWILL by Andreas Scherer
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-ansi.ch, cweav-extensions.ch, cweav-output.ch,
% cweav-i18n.ch, cweav-twill.ch, and ctwill-texlive.ch that get tie'd into
% ctwill.w in TeX Live.

Material in limbo.

@x l.28 of CWEAV-TWILL.CH
\def\title{CTWILL (@VERSION@)}
@y
\def\title{CTWILL (Version 3.64 [\TeX~Live])}
@z

@x l.37 and l.185 of CWEAV-PATCH.CH
  \centerline{(@VERSION@)}
@y
  \centerline{(Version 3.64 [\TeX~Live])}
@z

Section 1.

@x l.68 of CWEAV-TWILL.CH
@d banner _("This is CTWILL (@VERSION@)")
@y
@d banner "This is CTWILL, Version 3.64"
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

Section 80.

@x l.1367 and l.629 of CWEAV-TWILL.CH
saying \.{+P} on the command line, it's `\.{\\input proofmac}' (resp.\
\.{\\input Xproofmac} with option \.{+lX}), a set of macros used when
@y
saying \.{+P} on the command line, it's `\.{\\input ctproofmac}' (resp.\
\.{\\input Xctproofmac} with option \.{+lX}), a set of macros used when
@z

@x l.628 of CWEAV-TWILL.CH
tex_puts(proofing?"proofma":"ctwima");
@y
tex_puts(proofing?"ctproofma":"ctwima");
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
