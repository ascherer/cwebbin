% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-extensions.ch, cweav-output.ch, cweav-i18n.ch,
% cwtw-texlive.ch and cweav-texlive.ch that get tie'd into cweav-w2c.ch
% that is used as a monolithic changefile for cweave.w in TeX Live.

Material in limbo.

@x l.35 and CWEAV-PATCH.CH
\def\title{CWEAVE (@VERSION@)}
@y
\def\title{CWEAVE (Version 4.11 [\TeX~Live])}
@z

@x l.54 and CWTW-TEXLIVE.ch.
}}
@y
}}\datecontentspage
@z

Section 1.

@x l.70 and CWEAV-PATCH.CH and CWEAV-I18N.CH
@d banner _("This is CWEAVE (@VERSION@)")
@y
@d banner "This is CWEAVE, Version 4.11"
  /* will be extended by the \TeX~Live |versionstring| */
@z
