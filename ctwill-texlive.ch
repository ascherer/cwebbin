% Kpathsea changes for CTWILL by Andreas Scherer
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-extensions.ch, cweav-output.ch, cweav-i18n.ch,
% cweav-twill.ch, ctwt-texlive.ch, and ctwill-texlive.ch that get tie'd
% into ctwill.w in TeX Live.

Material in limbo.

@x l.21 of CWEAV-TWILL.CH
\def\title{CTWILL (@VERSION@)}
@y
\def\title{CTWILL (Version 4.6 [\TeX~Live])}
@z

Section 1.

@x l.61 of CWEAV-TWILL.CH
@d banner _("This is CTWILL (@VERSION@)")
@y
@d banner "This is CTWILL, Version 4.6"
  /* will be extended by the \TeX~Live |versionstring| */
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
