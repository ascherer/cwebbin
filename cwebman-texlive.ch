CHANGES for CWEBMAN.TEX by Andreas Scherer, June 11, 2020.

This set of changes adapts CWEBMAN.TEX for TeX Live.  It requires that the
chamge files CWEBMAN-PATCH.CH and CWEBMAN-EXTENSIONS.CH be applied first.

For a complete history of the changes made to CWEBMAN.TEX see CWEBMAN-PATCH.CH.
------------------------------------------------------------------------------
@x
\def\runninghead{{\tentt CWEB} USER MANUAL (@VERSION@)}
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\runninghead{{\tentt CWEB} USER MANUAL (3.64 [\TeX~Live])}
@z
------------------------------------------------------------------------------
@x
\footnote*{This document describes the extended \.{CWEB} (@VERSION@).}}
@y
\footnote*{This document describes the extended \.{CWEB} (3.64 [\TeX~Live]).}}
@z
------------------------------------------------------------------------------
@x
\footnote{$^3$}{In this extended implementation, if an \.{@i}nclude file can
not be found in the current directory, \.{CWEB} will look in standard
directories like the \CEE/ preprocessor.  Multiple search paths may be
specified in the environment variable \.{CWEBINPUTS}, concatenated with
\.{PATH\_SEPARATOR}s (on \UNIX/ commonly known as~`\.:').  If the environment
variable is not set, some decent default paths are used instead.}
@y
\footnote{$^3$}{In this extended implementation, if an \.{@i}nclude file can
not be found in the current directory, \.{CWEB} will use the conventions of
the \Kpathsea/ library as outlined in section~\X90:File lookup with
\Kpathsea/\X~of appendix~D.}% FIXME
@z
------------------------------------------------------------------------------
@x
\option m Install communication between \.{CWEB} and the message browser of
the {\mc SAS/C} development system.  Set the external environment variable
\.{SCMSGOPT} to any legal command line option described in the documentation
by SAS Institute.  (Off by default; works only on the {\mc AMIGA} system.)

@y
@z
------------------------------------------------------------------------------
@x
  \.{ { }\\vskip 15pt \\centerline\{(@VERSION@)\}{ }\\vfill\}}\cr}$$
@y
  \.{ { }\\vskip 15pt \\centerline\{(3.64 [\\TeX~Live])\}{ }\\vfill\}}\cr}$$
@z
------------------------------------------------------------------------------
