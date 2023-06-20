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
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}} \ifacro\sanitizecommand\Kpathsea{KPATHSEA}\fi
\def\title{CTWILL (Version 4.9 [\TeX~Live])}
@z

Section 1.

@x l.61 of CWEAV-TWILL.CH
@d banner _("This is CTWILL (@VERSION@)")
@y
@d banner "This is CTWILL, Version 4.9"
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

Section 272.

@x l.905 of CWEAV-TWILL.CH
must have fewer than 50 characters. If the \TeX\ part starts
@y
must have fewer than 80 characters. If the \TeX\ part starts
@z

@x l.947 of CWEAV-TWILL.CH
@d max_tex_chars 50 /* limit on the \TeX\ part of a meaning */
@y
@d max_tex_chars 80 /* limit on the \TeX\ part of a meaning */
@z

Section 292.

@x l.1236 of CWEAV-TWILL.CH
if ((cur_file=fopen(cur_file_name,"r"))) { cur_line=0; include_depth++; }
@y
if ( (found_filename = kpse_find_cweb(cur_file_name)) @|
    && ((cur_file=fopen(found_filename,"r"))) ) {
  @<Set up |cur_file_name| for opened |cur_file|@>@;
  cur_line=0; include_depth++;
}
@z

@x l.1241 of CWEAV-TWILL.CH
if ((cur_file=fopen(cur_file_name,"r"))) cur_line=0;
@y
if ( (found_filename = kpse_find_cweb(cur_file_name)) @|
    && ((cur_file=fopen(found_filename,"r"))) ) {
  @<Set up |cur_file_name| for opened |cur_file|@>@;
  cur_line=0;
}
@z

Section 308.

@x l.1292
@** Index.
@y
@* File lookup with \Kpathsea/.  The \.{CTANGLE} and \.{CWEAVE} programs from
the original \.{CWEB} package use the compile-time default directory or the
value of the environment variable \.{CWEBINPUTS} as an alternative place to be
searched for files, if they could not be found in the current directory.

This version uses the \Kpathsea/ mechanism for searching files.
The directories to be searched for come from three sources:
\smallskip
{\parindent1em
\item{(a)} a user-set environment variable \.{CWEBINPUTS}
    (overridden by \.{CWEBINPUTS\_cweb});
\item{(b)} a line in \Kpathsea/ configuration file \.{texmf.cnf},\hfil\break
    e.g., \.{CWEBINPUTS=\$TEXMFDOTDIR:\$TEXMF/texmf/cweb//}\hfil\break
    or \.{CWEBINPUTS.cweb=\$TEXMFDOTDIR:\$TEXMF/texmf/cweb//};
\item{(c)} compile-time default directories (specified in
    \.{texmf.in}),\hfil\break
    i.e., \.{\$TEXMFDOTDIR:\$TEXMF/texmf/cweb//}.\par}
@.CWEBINPUTS@>

@s const_string int
@s string int

@d kpse_find_cweb(name) kpse_find_file(name,kpse_cweb_format,true)

@<Include files@>=
#include <kpathsea/kpathsea.h> /* include every \Kpathsea/ header;
  for |@!kpse_find_file| */

@ @<Set up |cur_file_name|...@>=
if (strlen(found_filename) < max_file_name_length) {
  if (strcmp(cur_file_name,found_filename)) {
    strcpy(cur_file_name,found_filename + @|
      ((strncmp(found_filename,"./",2)==0) ? 2 : 0)); /* Strip path prefix */
    free(found_filename);
  }
}@+else fatal(_("! Filename too long\n"), found_filename);

@** Index.
@z
