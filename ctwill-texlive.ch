% Kpathsea changes for CTWILL by Andreas Scherer
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% cweav-patch.ch, cweav-ansi.ch, cweav-extensions.ch, cweav-output.ch,
% cweav-i18n.ch, cweav-twill.ch, and ctwill-texlive.ch that get tie'd into
% ctwill.w in TeX Live.

Material in limbo.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.28 of CWEAV-TWILL.CH
\def\title{CTWILL (Version 3.64 [CWEBbin 2018])}
@y
\def\title{CTWILL (\TeX~Live 2019/dev)}
@z

@x l.37 and l.185 of CWEAV-PATCH.CH
  \centerline{(Version 3.64 [CWEBbin 2018])}
@y
  \centerline{(Version 3.64 [\TeX~Live 2019/dev])}
@z

Section 1.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.68 of CWEAV-TWILL.CH
@d banner _("This is CTWILL (Version 3.64 [CWEBbin 2018])")
@y
@d banner _("This is CTWILL, Version 3.64")
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

Sections 5--15.

@x l.144 and l.70 of CWEAV-ANSI.CH
@i comm-foo.h
@y
@i comm-w2c.h
@z

Section 80.

@x l.1367 and l.616 of CWEAV-TWILL.CH
saying \.{+P} on the command line, it's `\.{\\input proofmac}',
@y
saying \.{+P} on the command line, it's `\.{\\input ctproofmac}',
@z

@x l.626 of CWEAV-TWILL.CH
if (proofing) tex_puts("proofma");
@y
if (proofing) tex_puts("ctproofma");
@z
