CHANGES for CWEBMAN.TEX by Andreas Scherer, September 2023.

This set of changes describes several extensions to the standard behavior of
the CWEB system.  It suggests CWEBMAN-PATCH.CH to be applied first.

For a complete history of the changes made to CWEBMAN.TEX see CWEBMAN-PATCH.CH.
------------------------------------------------------------------------------
@x l.925
it cannot find them in the current directory.
@y
it cannot find them in the current directory.%
\cwebfootnote{In this extended implementation, if an \.{@i}nclude file can
not be found in the current directory, \.{CWEB} will look in standard
directories like the \CEE/ preprocessor.  Multiple search paths may be
specified in the environment variable \.{CWEBINPUTS}, concatenated with
\.{PATH\_SEPARATOR}s (on \UNIX/ commonly known as~`\.:').  If the environment
variable is not set, some decent default paths are used instead.}
@z
------------------------------------------------------------------------------
@x l.1038
options are currently implemented:

\yskip
\def\option#1 {\textindent{\.#1}\hangindent2\parindent}
@y
\def\option#1 {\textindent{\.#1}\hangindent2\parindent}%
options are currently implemented:%
\cwebfootnote{This extended version of \.{CWEB} adds the following options
to the list:
\hfil\smallskip
\option c Check temporary output files for changes.  (Off by default.)
\hfil\vskip\normallineskip
\option i Indent parameters in function declarations.  (On by default;
\.{-i} typesets declarations flush left; some people think this to be
more logical than indenting them.) (Has no effect on \.{CTANGLE}.)
\hfil\vskip\normallineskip
\option l This option takes the string of characters to its right as its
argument to switch between different user languages and macro packages.
(Off by default.) (Has no effect on \.{CTANGLE}.)
\hfil\vskip\normallineskip
\option o Separate declarations and the first statement in a function block.
(On by default.) (Has no effect on \.{CTANGLE}.)
\hfil\vskip\normallineskip
\option u Transliteration of UTF-8 multi-byte characters.
(Off by default.) (Has no effect on \.{CWEAVE}.)}

\yskip
@z
------------------------------------------------------------------------------
@x l.1144
the `\.{@\#}' will put extra space after `$\langle\,$Other locals$\,\rangle$'.
@y
the `\.{@\#}' will put extra space after `$\langle\,$Other locals$\,\rangle$'.%
\cwebfootnote{This extended version of \.{CWEB} acknowledges the \.{-o} option
to suppress the extra space globally.}
@z
------------------------------------------------------------------------------
@x l.1146
\section Hypertext and hyperdocumentation.
@y
\vfill\eject
\section Hypertext and hyperdocumentation.
@z
------------------------------------------------------------------------------
@x l.1172 Add HintView homepage.
from \.{https://hint.userweb.mwn.de/hint/hintview.html}.
@y
from
\pdfURL{\.{https://hint.userweb.mwn.de/hint/hintview.html}}%
          {https://hint.userweb.mwn.de/hint/hintview.html}.%
@z
------------------------------------------------------------------------------
@x l.1181 Add Appendix G, the CTWILL source code.
the program sources at \.{ftp://ftp.cs.stanford.edu/pub/ctwill}.
@y
the program sources at
\pdfURL{\.{http://ftp.cs.stanford.edu/pub/ctwill}}%
          {http://ftp.cs.stanford.edu/pub/ctwill}.%
\cwebfootnote{This extended version of \.{CWEB} comes with an up-to-date
\.{ctwill} executable -- and its associated helpers -- out of the box.}
@z
------------------------------------------------------------------------------
@x l.1196
appendices D, E, and~F, which exhibit the complete source code for
\.{CTANGLE} and \.{CWEAVE}.

\vfil\eject\titletrue
@y
appendices \pdfURL{D}{common.pdf}, \pdfURL{E}{ctangle.pdf},
and~\pdfURL{F}{cweave.pdf}, which exhibit the complete source code for
\.{CTANGLE} and \.{CWEAVE}.%
\cwebfootnote{Actually, \pdfURL{Appendix~D}{common.pdf} contains the source
code for \.{COMMON}, and the additional \pdfURL{Appendix~G}{ctwill.pdf}
exhibits the source code for \.{CTWILL}, which is based on \.{CWEAVE}.}

\eject\titletrue
@z
------------------------------------------------------------------------------
@x l.1733
if you have a duplex printer. Appendices D, E, and F of the complete
version of this manual are printed using a commented-out option that
substitutes `$\gets$' for `$=$' in the program listings. Looking at those
@y
if you have a duplex printer. Appendices \pdfURL{D}{common.pdf},
\pdfURL{E}{ctangle.pdf}, and \pdfURL{F}{cweave.pdf}\cwebfootnote{And
\pdfURL{Appendix~G}{ctwill.pdf}.} of the complete
version of this manual are printed using a commented-out option that
substitutes `$\gets$' for `$=$' in the program listings.\cwebfootnote{They
also make use of the alternative format for \CEE/ comments.}
Looking at those
@z
------------------------------------------------------------------------------
@x l.1785
\point 20. Furthermore, group titles can be converted to an arbitrary
@y
\vfill\eject
\point 20. Furthermore, group titles can be converted to an arbitrary
@z
------------------------------------------------------------------------------
@x l.1797
\vfill\end
@y
\point 21. With modern \TeX\ engines like `\.{luatex}', `\.{pdftex}', and
`\.{xetex}' (but \\{not} with classic `\.{tex}') you can say `\.{\\input
pdfwebtocfront}' as the last command in the limbo section and run \TeX\
\\{twice} on your woven \.{CWEB} document, in order to shift the
table-of-contents to the front of the {\mc PDF} output.

\vfill\end
@z
------------------------------------------------------------------------------
