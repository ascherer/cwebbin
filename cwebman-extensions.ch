CHANGES for CWEBMAN.TEX by Andreas Scherer, June 11, 2020.

This set of changes describes several extensions to the standard behavior of
the CWEB system.  It suggests CWEBMAN-PATCH.CH to be applied first.

For a complete history of the changes made to CWEBMAN.TEX see CWEBMAN-PATCH.CH.
------------------------------------------------------------------------------
@x l.918
it cannot find them in the current directory.
@y
it cannot find them in the current directory.%
\footnote{$^3$}{In this extended implementation, if an \.{@i}nclude file can
not be found in the current directory, \.{CWEB} will look in standard
directories like the \CEE/ preprocessor.  Multiple search paths may be
specified in the environment variable \.{CWEBINPUTS}, concatenated with
\.{PATH\_SEPARATOR}s (on \UNIX/ commonly known as~`\.:').  If the environment
variable is not set, some decent default paths are used instead.}
@z
------------------------------------------------------------------------------
@x l.1059
output by \.{CWEAVE}. (On by default.) (Has no effect on \.{CTANGLE}.)
@y
output by \.{CWEAVE}. (On by default.) (Has no effect on \.{CTANGLE}.)%
\footnote{$^4$}{This extended version of \.{CWEB} adds the following options
to the list:

\option i Indent parameters in function declarations.  This causes the
formal parameter declarations in function heads to be indented.  (On by
default; \.{-i} typesets declarations flush left; some people think this
to be more logical than indenting them) (Has no effect on \.{CTANGLE}.)

\option l This option takes the string of characters to its right as its
argument to switch between different user languages and macro packages.
For example, if you call \.{CWEAVE} with the `\.{+ld}' (or `\.{-ld}') option,
the German \.{CWEB} macros \.{dcwebmac.tex} will be loaded in the first line
of output instead of the English ones. To avoid conflicts, the Danish
macros could be called \.{dkcwebmac.tex} and would be included by `\.{+ldk}'.
(Off by default) (Has no effect on \.{CTANGLE}.)

\option m Install communication between \.{CWEB} and the message browser of
the {\mc SAS/C} development system.  Set the external environment variable
\.{SCMSGOPT} to any legal command line option described in the documentation
by SAS Institute.  (Off by default; works only on the {\mc AMIGA} system.)

\option o Separate declarations and the first statement in a function block.
\.{CWEAVE} automatically inserts a bit of extra space.  (On by default.)
(Has no effect on \.{CTANGLE}.)

\option t Overwrite output files with temporary output only if changes occur.
(On by default.)}
@z
------------------------------------------------------------------------------
@x l.1153
saying `\.{pdftex}~\.{cob}'.
@y
saying `\.{pdftex}~\.{cob}'.%
\footnote{$^5$}{A third way to create PDF output from \.{CWEB} input is the
use of \.{XeTeX}, which uses `\.{[x]dvipdfm[x]}' in the background, but the
``plain \TeX'' macros from \.{cwebmac.tex} otherwise.  The process works with
a small trick in the first step:
$$\vbox{\halign{\.{#}\hfil\cr
cweave -lp+ cob\cr
xetex cob\cr
acroread cob.pdf\cr}}$$}
@z
------------------------------------------------------------------------------
@x l.1178 Add Appendix G, the CTWILL source code.
\.{CTANGLE} and \.{CWEAVE}.

\vfil\eject\titletrue
@y
\.{CTANGLE} and \.{CWEAVE}.%
\footnote{$^6$}{Actually, appendix~D contains the source code for \.{COMMON},
and the additional appendix~G exhibits the source code for \.{CTWILL}, which
is based on \.{CWEAVE}.}

\eject\titletrue
@z
------------------------------------------------------------------------------
@x l.1697
if you have a duplex printer. Appendices D, E, and F of the complete
@y
if you have a duplex printer. Appendices D, E, and F\footnote{$^7$}{And
Appendix~G.} of the complete
@z
------------------------------------------------------------------------------
