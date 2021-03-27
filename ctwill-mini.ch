Section 1.

@x
@** Introduction.
@y
\ifacro \ifx\undefined\pdfpagewidth\else
  \pdfpagewidth=\pagewd  \advance\pdfpagewidth by 2cm
  \pdfpageheight=\pageht \advance\pdfpageheight by 5cm
  \ifpdftex \pdfhorigin=1cm \pdfvorigin=1cm
  \else \global\hoffset=-1.54cm \global\voffset=-1.54cm \fi
\fi\fi

@** Introduction.
@z

@x
@d banner "This is CTWILL, Version 4.2"
@y
\bigskip
{\font\itt=cmitt10 \font\bit=cmbxti10
\noindent \bit Editor's Note: \it Although {\itt CTWILL} is based on
{\itt cweave.w}, new and modified material is incorporated all over the place,
without taking special care to keep the original section numbering intact.
\smallskip
\noindent Moreover, this heavily redacted version of {\itt ctwill.pdf} had to
meddle with the section numbering even more, spreading tabular material over
several sections and splitting long sections into smaller chunks in order to
fix overful pages---both horizontally and vertically---, to make the overall
appearance of the {\itt CTWILL} documentation most pleasing to the
readers'~eyes.
\smallskip
\noindent Please do not try to compare this {\itt ctwill.pdf} to the one
created by {\itt CWEAVE} instead of {\itt CTWILL}; the section numbering will
be even more ``off'' from {\itt cweave.w}.  Care has been taken to give a
faithful overall rendering of {\itt CTWILL}'s code, though. \hfill
---Enjoy!\bigskip}

@d banner "This is CTWILL, Version 4.2"
@z

Section 2.

@x
@ Here is a sort of user manual for \.{CTWILL}---which is exactly like
@y
@* {\tentex CTWILL} user manual.
Here is a sort of user manual for \.{CTWILL}---which is exactly like
@z

@x
give it the necessary hints in other places via your change file.
@y
give it the necessary hints in other places via your change file.
@-f@>
@-x@>
@z

Section 3.

@x
The current meaning of every identifier is initially `\.{\\uninitialized}'.
@y
@ The current meaning of every identifier is initially `\.{\\uninitialized}'.
@z

@x
must have fewer than 50 characters. If the \TeX\ part starts
@y
must have fewer than 50 characters.

@d max_tex_chars 50 /* limit on the \TeX\ part of a meaning */

@ If the \TeX\ part starts
@z

Section 4.

@x
@d max_tex_chars 50 /* limit on the \TeX\ part of a meaning */
@y
@z

Section 5.

@x
@ \.{CWEAVE} has a fairly straightforward outline.  It operates in
@y
@* Introduction (continued). \.{CWEAVE} has a fairly straightforward outline.
It operates in
@z

Section 7.

@x
internationalization.

@d _(S) gettext(S)

@<Include files@>=
#ifndef HAVE_GETTEXT
#define HAVE_GETTEXT 0
#endif
@#
@y
internationalization.

@d _(S) gettext(S)
@-S@>

@r @ @<Include files@>=
@-A@>
@-HAVE_GETTEXT@>
#ifndef HAVE_GETTEXT
#define HAVE_GETTEXT 0
#endif
@z

Section 10.

@x
@ Code related to input routines:
@y
@ Code related to input routines:
@-c@>
@z

Section 14.

@x
@ Code related to identifier and section name storage:
@y
@ Code related to identifier and section name storage:
@-c@>
@z

Section 16.

@x
@ Code related to error handling:
@y
@ Code related to error handling:
@-s@>
@z

Section 18.

@x
extern const char *use_language; /* prefix to \.{cwebmac.tex} in \TEX/ output */
@y
extern const char *use_language; /* prefix to \.{ctwimac.tex} in \TEX/ output */
@z

Section 19.

@x
@ Code related to output:
@y
@ Code related to output:
@-a@>
@-b@>
@-c@>
@z

Section 24.

@x
@* Data structures exclusive to {\tt CWEAVE}.
@y
@* Data structures exclusive to {\tt CWEAVE}.
@-a@>
@z

Section 25.

@x
@ We keep track of the current section number in |section_count|, which
@y
@r @ We keep track of the current section number in |section_count|, which
@z

Section 26.

@x
@ The other large memory area in \.{CWEAVE} keeps the cross-reference data.
@y
@ The other large memory area in \.{CWEAVE} keeps the cross-reference data.
@-p@>
@-x@>
@z

Section 36.

@x
@ A new cross-reference for an identifier is formed by calling |new_xref|,
@y
@ A new cross-reference for an identifier is formed by calling |new_xref|,
@-a@>
@-c@>
@z

Section 46.

@x
id_lookup("register",NULL,int_like);
@y
@ @<Store all...@>=
id_lookup("register",NULL,int_like);
@z

Section 50.

@x
@ Control codes are converted to \.{CWEAVE}'s internal
@y
@r @ Control codes are converted to \.{CWEAVE}'s internal
@z

Section 56.

@x
\yskip\hang |xref_roman|, |xref_wildcard|, |xref_typewriter|, |TeX_string|,
|meaning|, |suppress|,
|verbatim|: The values of |id_first| and |id_loc| will have been set to
the beginning and ending-plus-one locations in the buffer.

\yskip\hang |section_name|: In this case the global variable |cur_section| will
point to the |byte_start| entry for the section name that has just been scanned.
The value of |cur_section_char| will be |'('| if the section name was
preceded by \.{@@(} instead of \.{@@<}.
@y
{\raggedright
\yskip\hang |xref_roman|, |xref_wildcard|, |xref_typewriter|, |TeX_string|,
|meaning|, |suppress|,
and |verbatim|: The values of |id_first| and |id_loc| will have been set to
the beginning and ending-plus-one locations in the buffer.

\yskip\hang |section_name|: In this case the global variable |cur_section| will
point to the\hfil\break |byte_start| entry for the section name that has just been scanned.
The value of |cur_section_char| will be |'('| if the section name was
preceded by \.{@@(} instead of \.{@@<}.\par}
@z

Section 57.

@x
@ As one might expect, |get_next| consists mostly of a big switch
@y
@ As one might expect, |get_next| consists mostly of a big switch
@-c@>
@z

Section 64.

@x
@ The following code assigns values to the combinations \.{++},
@y
@ The following code assigns values to the combinations \.{++},
@-c@>
@z

@x
              if (*(loc+1)=='*') {loc++;@+compress(minus_gt_ast);}
@y
              if (*(loc+1)=='*') {@+loc++;@+compress(minus_gt_ast);@+}
@z

@x
            else if (*loc=='.' && *(loc+1)=='.') {
              loc++;@+compress(dot_dot_dot);
            } break;
@y
            else if (*loc=='.' && *(loc+1)=='.') {@+
              loc++;@+compress(dot_dot_dot);@+
            } break;
@z

Section 68.

@x
@ @<Get a bin...@>={
@y
@r @ @<Get a bin...@>={
@z

Section 71.

@x
@ @<Get a wide...@>={
@y
@r @ @<Get a wide...@>={
@z

Section 75.

@x
@ @<Put section name...@>=
@y
@ @<Put section name...@>=
@z

Section 76.

@x
@ @<If end of name...@>=
@y
@r @ @<If end of name...@>=
@z

Section 89--90.

@x
@ The |outer_xref| subroutine is like |C_xref| except that it begins
with |next_control!='|'| and ends with |next_control>=format_code|. Thus, it
handles \CEE/ text with embedded comments.

@c
static void
outer_xref(void) /* extension of |C_xref| */
{
  int bal; /* brace level in comment */
@y
@ The |outer_xref| subroutine is like |C_xref| except that it begins
with |next_control| |!='|'| and ends with |next_control>=format_code|.
Thus, it
handles \CEE/ text with embedded comments.

@ @c
static void
outer_xref(void) /* extension of |C_xref| */
{@+
  int bal; /* brace level in comment */
@z

Section 92.

@x
@ @<Replace |"@@@@"| by |"@@"| @>=
{
  char *src=id_first,*dst=id_first;
@y
@ @<Replace |"@@@@"| by |"@@"| @>=
{@+
  char *src=id_first,*dst=id_first;
@z

Section 97.

@x
@ Finally, when the \TEX/ and definition parts have been treated, we have
|next_control>=begin_C|.
@y
@r @ Finally, when the \TEX/ and definition parts have been treated, we have
\hfil\break|next_control>=begin_C|.
@z

Section 103.

@x
@ The |flush_buffer| routine empties the buffer up to a given breakpoint,
@y
@ The |flush_buffer| routine empties the buffer up to a given breakpoint,
@-c@>
@z

Section 107.

@x
@ When we wish to append one character |c| to the output buffer, we write
@y
@ When we wish to append one character |c| to the output buffer, we write
@-c@>
@z

Section 114.

@x
@ The |out_name| procedure is used to output an identifier or index
@y
@r @ The |out_name| procedure is used to output an identifier or index
@z

Section 117.

@x
@ The |copy_TeX| routine processes the \TEX/ code at the beginning of a
@y
@r @ The |copy_TeX| routine processes the \TEX/ code at the beginning of a
@z

@x
static eight_bits
copy_TeX(void)
{
@y
static eight_bits
copy_TeX(void)
{@+
@z

Section 118.

@x
@ The |copy_comment| function issues a warning if more braces are opened than
@y
@ The |copy_comment| function issues a warning if more braces are opened than
@-t@>
@z

@x
int bal) /* brace balance */
{
  char c; /* current character being copied */
@y
int bal) /* brace balance */
{@+
  char c; /* current character being copied */
@z

Section 123.

@x
@ Here is a list of the category codes that scraps can have.
@y
@r @ Here is a list of the category codes that scraps can have.
@z

Section 127.

@x
@ The token lists for translated \TEX/ output contain some special control
@y
@r @ The token lists for translated \TEX/ output contain some special control
@-n@>
@z

Section 128.

@x
\yskip\noindent All of these tokens are removed from the \TEX/ output that
@y
@ All of these tokens are removed from the \TEX/ output that
@-n@>
@z

Section 129.

@x
@ The raw input is converted into scraps according to the following table,
@y
@* From raw input to scraps.
@-c@>
\advance \hsize by 4cm
\ifx\undefined\pdfpagewidth \else \advance \pdfpagewidth by 4cm \fi
The raw input is converted into scraps according to the following table,
@z

@x
\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
@y
\yskip\halign{\quad#\hfil&\quad\hbox to11cm{#\hfil}&\quad\hfil#\hfil\cr
@z

Section 130.

@x
\.\%&|binop|: \.{\\MOD}&yes\cr
@y
\.\%&|binop|: \.{\\MOD}&yes\cr}

@ Cont.

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
@z

Section 131.

@x
\.{co\_await}&|case_like|: \stars&maybe\cr
@y
\.{co\_await}&|case_like|: \stars&maybe\cr}

@ Cont.

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
@z

Section 127.

@x
\.{long}&|raw_int|: \stars&maybe\cr
@y
\.{long}&|raw_int|: \stars&maybe\cr}

@ Cont.

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
@z

Section 128.

@x
\.{try}&|else_like|: \stars&maybe\cr
@y
\.{try}&|else_like|: \stars&maybe\cr}

@r @ Cont.

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
@z

Sections 129--136.

@x l.7 line numbers refer to 'prod.w'
@ Here is a table of all the productions.  Each production that
@y
@* Table of all productions.  Each production that
@z

TeX reports 'extra \fi' when running on twilled 'ctwill.w'.

@x l.14
\fi \newcount\prodno \newdimen\midcol \let\+\relax \ifon
@y
\newcount\prodno \newdimen\midcol \let\+\relax
@z

@x l.78
\+& |lpar| |rpar| & |exp| \hfill $L\.{\\,}R$ & functions, declarations\cr
@y
\+& |lpar| |rpar| & |exp| \hfill $L\.{\\,}R$ & functions, declarations\cr
\endgroup
@-in@>@-f@>@-x@>@-y@>

@r @ Cont.
\begingroup \lineskip=4pt
\def\alt #1 #2
{$\displaystyle\Bigl\{\!\matrix{\strut\hbox{#1}\cr
   \strut\hbox{#2}\cr}\!\Bigr\}$ }
\def\altt #1 #2 #3
{$\displaystyle\Biggl\{\!\matrix{\strut\hbox{#1}\cr\hbox{#2}\cr
   \strut\hbox{#3}\cr}\!\Biggr\}$ }
\def\malt #1 #2
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\strut\hbox{#2}\hfill\cr}$}
\def\maltt #1 #2 #3
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\hbox{#2}\hfill\cr
   \strut\hbox{#3}\hfill\cr}$}
\yskip@-in@>@-x@>@-y@>
\prodno=13 \midcol=2.5in
\def\theprodno{\number\prodno \global\advance\prodno by1\enspace}
\def\dagit{\dag\theprodno}
\def\+#1&#2&#3&#4\cr{\def\next{#1}%
 \line{\hbox to 2em{\hss
  \ifx\next\empty\theprodno\else\next\fi}\strut
  \ignorespaces#2\hfil\hbox to\midcol{$\RA$
  \ignorespaces#3\hfil}\quad \hbox to1.45in{\ignorespaces#4\hfil}}}
@z

@x l.45
         |int_like| \alt|raw_int| |struct_like| & |extern "Ada" int|\cr
@y
         |int_like| \alt|raw_int| |struct_like| & |extern "Ada" int|\cr
\endgroup

@ Cont.
\begingroup \lineskip=4pt
\def\alt #1 #2
{$\displaystyle\Bigl\{\!\matrix{\strut\hbox{#1}\cr
   \strut\hbox{#2}\cr}\!\Bigr\}$ }
\def\altt #1 #2 #3
{$\displaystyle\Biggl\{\!\matrix{\strut\hbox{#1}\cr\hbox{#2}\cr
   \strut\hbox{#3}\cr}\!\Biggr\}$ }
\def\malt #1 #2
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\strut\hbox{#2}\hfill\cr}$}
\def\maltt #1 #2 #3
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\hbox{#2}\hfill\cr
   \strut\hbox{#3}\hfill\cr}$}
\yskip@-in@>
\prodno=27 \midcol=2.5in
\def\theprodno{\number\prodno \global\advance\prodno by1\enspace}
\def\dagit{\dag\theprodno}
\def\+#1&#2&#3&#4\cr{\def\next{#1}%
 \line{\hbox to 2em{\hss
  \ifx\next\empty\theprodno\else\next\fi}\strut
  \ignorespaces#2\hfil\hbox to\midcol{$\RA$
  \ignorespaces#3\hfil}\quad \hbox to1.45in{\ignorespaces#4\hfil}}}
@z

@x l.75
              \&{struct} \&{name\_info} $\{$\cr
@y
              \&{struct} \&{name\_info} $\{$\cr
\endgroup

@r @ Cont.@-z@>@-in@>
\begingroup \lineskip=4pt
\def\alt #1 #2
{$\displaystyle\Bigl\{\!\matrix{\strut\hbox{#1}\cr
   \strut\hbox{#2}\cr}\!\Bigr\}$ }
\def\altt #1 #2 #3
{$\displaystyle\Biggl\{\!\matrix{\strut\hbox{#1}\cr\hbox{#2}\cr
   \strut\hbox{#3}\cr}\!\Biggr\}$ }
\def\malt #1 #2
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\strut\hbox{#2}\hfill\cr}$}
\def\maltt #1 #2 #3
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\hbox{#2}\hfill\cr
   \strut\hbox{#3}\hfill\cr}$}
\yskip@-in@>
\prodno=47 \midcol=2.5in
\def\theprodno{\number\prodno \global\advance\prodno by1\enspace}
\def\dagit{\dag\theprodno}
\def\+#1&#2&#3&#4\cr{\def\next{#1}%
 \line{\hbox to 2em{\hss
  \ifx\next\empty\theprodno\else\next\fi}\strut
  \ignorespaces#2\hfil\hbox to\midcol{$\RA$
  \ignorespaces#3\hfil}\quad \hbox to1.45in{\ignorespaces#4\hfil}}}
@z

@x l.164
       $|force|\,E\,\\{in}\,\\{bsp}\,S\,\\{out}\,|force|$ & $\!\!$|else x=0;|\cr
@y
       $|force|\,E\,\\{in}\,\\{bsp}\,S\,\\{out}\,|force|$ & $\!\!$|else x=0;|\cr
\endgroup

@ Cont.
\begingroup \lineskip=4pt
\def\alt #1 #2
{$\displaystyle\Bigl\{\!\matrix{\strut\hbox{#1}\cr
   \strut\hbox{#2}\cr}\!\Bigr\}$ }
\def\altt #1 #2 #3
{$\displaystyle\Biggl\{\!\matrix{\strut\hbox{#1}\cr\hbox{#2}\cr
   \strut\hbox{#3}\cr}\!\Biggr\}$ }
\def\malt #1 #2
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\strut\hbox{#2}\hfill\cr}$}
\def\maltt #1 #2 #3
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\hbox{#2}\hfill\cr
   \strut\hbox{#3}\hfill\cr}$}
\yskip@-any@>@-z@>@-g@>@-a@>@-x@>@-y@>@-f@>
\prodno=61 \midcol=2.5in
\def\theprodno{\number\prodno \global\advance\prodno by1\enspace}
\def\dagit{\dag\theprodno}
\def\+#1&#2&#3&#4\cr{\def\next{#1}%
 \line{\hbox to 2em{\hss
  \ifx\next\empty\theprodno\else\next\fi}\strut
  \ignorespaces#2\hfil\hbox to\midcol{$\RA$
  \ignorespaces#3\hfil}\quad \hbox to1.45in{\ignorespaces#4\hfil}}}
\advance\midcol20pt
@z

@x l.211
\+& |prerangle| & |binop| \hfill \.> & $>$ not in template\cr
@y
\+& |prerangle| & |binop| \hfill \.> & $>$ not in template\cr
\endgroup

@r @ Cont.
\begingroup \lineskip=4pt
\def\alt #1 #2
{$\displaystyle\Bigl\{\!\matrix{\strut\hbox{#1}\cr
   \strut\hbox{#2}\cr}\!\Bigr\}$ }
\def\altt #1 #2 #3
{$\displaystyle\Biggl\{\!\matrix{\strut\hbox{#1}\cr\hbox{#2}\cr
   \strut\hbox{#3}\cr}\!\Biggr\}$ }
\def\malt #1 #2
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\strut\hbox{#2}\hfill\cr}$}
\def\maltt #1 #2 #3
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\hbox{#2}\hfill\cr
   \strut\hbox{#3}\hfill\cr}$}
\yskip@-any@>@-z@>@-g@>@-a@>
\prodno=86 \midcol=2.5in
\def\theprodno{\number\prodno \global\advance\prodno by1\enspace}
\def\dagit{\dag\theprodno}
\def\+#1&#2&#3&#4\cr{\def\next{#1}%
 \line{\hbox to 2em{\hss
  \ifx\next\empty\theprodno\else\next\fi}\strut
  \ignorespaces#2\hfil\hbox to\midcol{$\RA$
  \ignorespaces#3\hfil}\quad \hbox to1.45in{\ignorespaces#4\hfil}}}
@z

@x l.232
\+\dagit& |new_exp| & |exp| & |new int;|\cr
@y
\+\dagit& |new_exp| & |exp| & |new int;|\cr
\endgroup

@ Cont.
\begingroup \lineskip=4pt
\def\alt #1 #2
{$\displaystyle\Bigl\{\!\matrix{\strut\hbox{#1}\cr
   \strut\hbox{#2}\cr}\!\Bigr\}$ }
\def\altt #1 #2 #3
{$\displaystyle\Biggl\{\!\matrix{\strut\hbox{#1}\cr\hbox{#2}\cr
   \strut\hbox{#3}\cr}\!\Biggr\}$ }
\def\malt #1 #2
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\strut\hbox{#2}\hfill\cr}$}
\def\maltt #1 #2 #3
{$\displaystyle\!\matrix{\strut\hbox{#1}\hfill\cr\hbox{#2}\hfill\cr
   \strut\hbox{#3}\hfill\cr}$}
\yskip@-any_other@>@-z@>@-f@>@-x@>@-p@>
\prodno=100 \midcol=2.5in
\def\theprodno{\number\prodno \global\advance\prodno by1\enspace}
\def\dagit{\dag\theprodno}
\def\+#1&#2&#3&#4\cr{\def\next{#1}%
 \line{\hbox to 2em{\hss
  \ifx\next\empty\theprodno\else\next\fi}\strut
  \ignorespaces#2\hfil\hbox to\midcol{$\RA$
  \ignorespaces#3\hfil}\quad \hbox to1.45in{\ignorespaces#4\hfil}}}
\advance\midcol20pt
@z

@x
\advance\midcol-3pt
\+\dag200\enspace& |typedef_like| |decl_head| \alt|exp| |int_like| &
      |typedef_like| |decl_head| \hfill $D=D$\alt $E^{**}$ $I^{**}$ \unskip &
          \&{typedef} \&{char} \&{ch};\cr
\advance\midcol+3pt
\+201\enspace& |typedef_like| |decl_head| |semi| & |decl| \hfill $T\.\ D$ &
                                             \&{typedef} \&{int} $\&x,\&y$;\cr
\+\dag202\enspace& |typedef_like| |int_like| |raw_int| & |typedef_like| |int_like| |exp| &
  \&{typedef} \&{int} \&{foo}\cr
@y
@z

@x l.326
\+& |alignas_like| |cast| & |attr| & |alignas(int)| \cr
\yskip
\yskip
\yskip
\yskip
\yskip
\yskip
\yskip
\yskip
\parindent=0pt
\dag{\bf Notes}
@y
\+& |alignas_like| |cast| & |attr| & |alignas(int)| \cr
@-deprecated@>
@-fallthrough@>
@-likely@>
@-nodiscard@>
@-unlikely@>
\advance\midcol-3pt
\+\dag200\enspace& |typedef_like| |decl_head| \alt|exp| |int_like| &
      |typedef_like| |decl_head| \hfill $D=D$\alt $E^{**}$ $I^{**}$ \unskip &
          \&{typedef} \&{char} \&{ch};\cr
\advance\midcol+3pt
\+201\enspace& |typedef_like| |decl_head| |semi| & |decl| \hfill $T\.\ D$ &
                                             \&{typedef} \&{int} $\&x,\&y$;\cr
\+\dag202\enspace& |typedef_like| |int_like| |raw_int| & |typedef_like| |int_like| |exp| &
  \&{typedef} \&{int} \&{foo}\cr
\endgroup

@r @-any_other@>@-z@>@ \begingroup\dag{\bf Notes}
@z

Section 137.

@x
@* Implementing the productions.
@y
@* Implementing the productions.  \advance \hsize by -4cm
\ifx\undefined\pdfpagewidth \else \advance \pdfpagewidth by -4cm \fi
@z

@x
the category codes |pp->cat,@,@,(pp+1)->cat|$,\,\,\ldots\,$
@y
the category codes |pp->cat|, |(pp+1)->cat|, $\,\ldots\,$
@z

Section 140.

@x
@ Token lists in |@!tok_mem| are composed of the following kinds of
@y
@ Token lists in |@!tok_mem| are composed of the following kinds of
@-p@>
@z

Section 142.

@x
@ @<Print token |r|...@>=
@y
@r @ @<Print token |r|...@>=
@z

Section 143.

@x
@ The production rules listed above are embedded directly into \.{CWEAVE},
@y
@ The production rules listed above are embedded directly into \.{CWEAVE},
@-a@>
@-c@>
@-d@>
@-j@>
@-k@>
@-n@>
@-pp@>
@z

Section 144.

@x
The code below is an exact translation of the production rules into
@y
@r @ The code below is an exact translation of the production rules into
@-a@>
@z

Section 152.

@x
@ Let us consider the big switch for productions now, before looking
@y
@r @ Let us consider the big switch for productions now, before looking
@z

@x
        && pp->cat!=new_exp
        && pp->cat!=ftemplate @|
@y
        && pp->cat!=new_exp @|
        && pp->cat!=ftemplate
@z

@x
        && pp->cat!=const_like
@y
        && pp->cat!=const_like @|
@z

Section 148.

@x
  switch (pp->cat) {
    case exp: @<Cases for |exp|@>@; @+break;
    case lpar: @<Cases for |lpar|@>@; @+break;
    case unop: @<Cases for |unop|@>@; @+break;
    case ubinop: @<Cases for |ubinop|@>@; @+break;
    case binop: @<Cases for |binop|@>@; @+break;
    case cast: @<Cases for |cast|@>@; @+break;
    case sizeof_like: @<Cases for |sizeof_like|@>@; @+break;
    case int_like: @<Cases for |int_like|@>@; @+break;
    case public_like: @<Cases for |public_like|@>@; @+break;
    case colcol: @<Cases for |colcol|@>@; @+break;
    case decl_head: @<Cases for |decl_head|@>@; @+break;
    case decl: @<Cases for |decl|@>@; @+break;
    case base: @<Cases for |base|@>@; @+break;
    case struct_like: @<Cases for |struct_like|@>@; @+break;
    case struct_head: @<Cases for |struct_head|@>@; @+break;
    case fn_decl: @<Cases for |fn_decl|@>@; @+break;
    case function: @<Cases for |function|@>@; @+break;
    case lbrace: @<Cases for |lbrace|@>@; @+break;
    case if_like: @<Cases for |if_like|@>@; @+break;
    case else_like: @<Cases for |else_like|@>@; @+break;
    case else_head: @<Cases for |else_head|@>@; @+break;
    case if_clause: @<Cases for |if_clause|@>@; @+break;
    case if_head: @<Cases for |if_head|@>@; @+break;
    case do_like: @<Cases for |do_like|@>@; @+break;
    case case_like: @<Cases for |case_like|@>@; @+break;
    case catch_like: @<Cases for |catch_like|@>@; @+break;
    case tag: @<Cases for |tag|@>@; @+break;
    case stmt: @<Cases for |stmt|@>@; @+break;
    case semi: @<Cases for |semi|@>@; @+break;
    case lproc: @<Cases for |lproc|@>@; @+break;
    case section_scrap: @<Cases for |section_scrap|@>@; @+break;
    case insert: @<Cases for |insert|@>@; @+break;
    case prelangle: @<Cases for |prelangle|@>@; @+break;
    case prerangle: @<Cases for |prerangle|@>@; @+break;
    case langle: @<Cases for |langle|@>@; @+break;
    case template_like: @<Cases for |template_like|@>@; @+break;
    case new_like: @<Cases for |new_like|@>@; @+break;
    case new_exp: @<Cases for |new_exp|@>@; @+break;
    case ftemplate: @<Cases for |ftemplate|@>@; @+break;
    case for_like: @<Cases for |for_like|@>@; @+break;
    case raw_ubin: @<Cases for |raw_ubin|@>@; @+break;
    case const_like: @<Cases for |const_like|@>@; @+break;
    case raw_int: @<Cases for |raw_int|@>@; @+break;
    case operator_like: @<Cases for |operator_like|@>@; @+break;
    case typedef_like: @<Cases for |typedef_like|@>@; @+break;
    case delete_like: @<Cases for |delete_like|@>@; @+break;
    case question: @<Cases for |question|@>@; @+break;
    case alignas_like: @<Cases for |alignas_like|@>@; @+break;
    case lbrack: @<Cases for |lbrack|@>@; @+break;
    case attr_head: @<Cases for |attr_head|@>@; @+break;
    case attr: @<Cases for |attr|@>@; @+break;
    case default_like: @<Cases for |default_like|@>@; @+break;
  }
  pp++; /* if no match was found, we move to the right */
}
@y
  switch (pp->cat) {
    @<Cases for |pp->cat|@>@;
  }
  pp++; /* if no match was found, we move to the right */
}

@ @<Cases for |pp->cat|@>=@t\1\5\5@>
    case exp: @<Cases for |exp|@>@; @+break;
    case lpar: @<Cases for |lpar|@>@; @+break;
    case unop: @<Cases for |unop|@>@; @+break;
    case ubinop: @<Cases for |ubinop|@>@; @+break;
    case binop: @<Cases for |binop|@>@; @+break;
    case cast: @<Cases for |cast|@>@; @+break;
    case sizeof_like: @<Cases for |sizeof_like|@>@; @+break;
    case int_like: @<Cases for |int_like|@>@; @+break;
    case public_like: @<Cases for |public_like|@>@; @+break;
    case colcol: @<Cases for |colcol|@>@; @+break;
    case decl_head: @<Cases for |decl_head|@>@; @+break;
    case decl: @<Cases for |decl|@>@; @+break;
    case base: @<Cases for |base|@>@; @+break;
    case struct_like: @<Cases for |struct_like|@>@; @+break;
    case struct_head: @<Cases for |struct_head|@>@; @+break;
    case fn_decl: @<Cases for |fn_decl|@>@; @+break;
    case function: @<Cases for |function|@>@; @+break;
    case lbrace: @<Cases for |lbrace|@>@; @+break;
    case if_like: @<Cases for |if_like|@>@; @+break;
    case else_like: @<Cases for |else_like|@>@; @+break;
    case else_head: @<Cases for |else_head|@>@; @+break;
    case if_clause: @<Cases for |if_clause|@>@; @+break;
    case if_head: @<Cases for |if_head|@>@; @+break;
    case do_like: @<Cases for |do_like|@>@; @+break;
    case case_like: @<Cases for |case_like|@>@; @+break;
    case catch_like: @<Cases for |catch_like|@>@; @+break;
    case tag: @<Cases for |tag|@>@; @+break;
    case stmt: @<Cases for |stmt|@>@; @+break;
    case semi: @<Cases for |semi|@>@; @+break;
    case lproc: @<Cases for |lproc|@>@; @+break;
    case section_scrap: @<Cases for |section_scrap|@>@; @+break;
    case insert: @<Cases for |insert|@>@; @+break;
    case prelangle: @<Cases for |prelangle|@>@; @+break;
    case prerangle: @<Cases for |prerangle|@>@; @+break;
    case langle: @<Cases for |langle|@>@; @+break;
    case template_like: @<Cases for |template_like|@>@; @+break;
    case new_like: @<Cases for |new_like|@>@; @+break;
    case new_exp: @<Cases for |new_exp|@>@; @+break;
    case ftemplate: @<Cases for |ftemplate|@>@; @+break;
    case for_like: @<Cases for |for_like|@>@; @+break;
    case raw_ubin: @<Cases for |raw_ubin|@>@; @+break;
    case const_like: @<Cases for |const_like|@>@; @+break;
    case raw_int: @<Cases for |raw_int|@>@; @+break;
    case operator_like: @<Cases for |operator_like|@>@; @+break;
    case typedef_like: @<Cases for |typedef_like|@>@; @+break;
    case delete_like: @<Cases for |delete_like|@>@; @+break;
    case question: @<Cases for |question|@>@; @+break;
    case alignas_like: @<Cases for |alignas_like|@>@; @+break;
    case lbrack: @<Cases for |lbrack|@>@; @+break;
    case attr_head: @<Cases for |attr_head|@>@; @+break;
    case attr: @<Cases for |attr|@>@; @+break;
    case default_like: @<Cases for |default_like|@>@; @+break;
@z

Section 149.

@x
of identifiers in case labels.

If the first identifier is the keyword `\&{operator}', we give up;
@y
of identifiers in case labels.
If the first identifier is the keyword `\&{operator}', we give up;
@z

Section 151.

@x
@ The scraps currently being parsed must be inspected for any
@y
@r @ The scraps currently being parsed must be inspected for any
@z

@x
|make_reserved|, hence |tok_loc| has been set.
@y
\hfil\break|make_reserved|, hence |tok_loc| has been set.
@z

Section 155.

@x
@ \.{CTWILL} needs the following procedure, which appends tokens of a
@y
@r @ \.{CTWILL} needs the following procedure, which appends tokens of a
@z

Section 156.

@x
@ The trickiest part of \.{CTWILL} is the procedure |make_ministring(l)|,
@y
@ The trickiest part of \.{CTWILL} is the procedure |make_ministring(l)|,
@-b@>
@z

@x
  int l) /* 0, 1, or 2 */
{
@y
  int l) /* 0, 1, or 2 */
{@+
@z

Section 163.

@x
   && *(*r+1)=='{') app(**q); /* |struct_like| identifier */
@y
   @|&& *(*r+1)=='{') app(**q); /* |struct_like| identifier */
@z

Section 160.

@x
@ @<Cases for |lpar|@>=
@y
@r @ @<Cases for |lpar|@>=
@z

Section 169.

@x
@ @<Cases for |decl_head|@>=
@y
@r @ @<Cases for |decl_head|@>=
@z

Section 174.

@x
@ @<Cases for |fn_decl|@>=
@y
@r @ @<Cases for |fn_decl|@>=
@z

Section 209.

@x
@ Here's the |squash| procedure, which
@y
@r @ Here's the |squash| procedure, which
@z

Section 213.

@x
@ @<Print a snapsh...@>=
@y
@r @ @<Print a snapsh...@>=
@z

Section 229.

@x
    if (next_control=='|' || next_control==begin_comment ||
        next_control==begin_short_comment) return;
@y
    if (next_control=='|' || next_control==begin_comment @| ||
        next_control==begin_short_comment) return;
@z

Section 221.

@x
@ The following macro is used to append a scrap whose tokens have just
@y
@ The following macro is used to append a scrap whose tokens have just
@-b@>
@-c@>
@z

Section 222.

@x
@<Make sure that there is room for the new scraps, tokens, and texts@>@;
@y
@#
@<Make sure that there is room for the new scraps, tokens, and texts@>@;
@#
@z

@x
  case ignore: case xref_roman: case xref_wildcard:
  case meaning: case suppress:
@y
  case ignore: case xref_roman: case xref_wildcard:@/
  case meaning: case suppress:@/
@z

@x
  @t\4@>  @<Cases involving nonstandard characters@>@;
@y
@#
  @t\4@>  @<Cases involving nonstandard characters@>@;
@#
@z

@x
  default: app(inserted);@+app(next_control);
@y
@#
  default: app(inserted);@+app(next_control);
@z

Section 230.

@x
@ The |outer_parse| routine is to |C_parse| as |outer_xref|
@y
@r @ The |outer_parse| routine is to |C_parse| as |outer_xref|
@z

Section 236.

@x
@ To insert token-list |p| into the output, the |push_level| subroutine
@y
@r @ To insert token-list |p| into the output, the |push_level| subroutine
@z

Section 238.

@x
called when |stack_ptr==1|.
@y
called when |stack_ptr| |==1|.
@z

Section 242.

@x
  text_pointer save_text_ptr;
  sixteen_bits save_next_control; /* values to be restored */
  text_pointer p; /* translation of the \CEE/ text */
@y
  text_pointer save_text_ptr, p; /* translation of the \CEE/ text */
  sixteen_bits save_next_control; /* values to be restored */
@z

Section 245.

@x
else @<Look ahead for strongest line break, |goto reswitch|@>
@y
else {@<Look ahead for strongest line break, |goto reswitch|@>}
@z

Section 246.

@x
@<Look ahead for st...@>= {
@y
@<Look ahead for st...@>=
@z

@x
}
@y
@z

Section 247.

@x
@ @<Output saved...@>=
@y
@r @ @<Output saved...@>=
@z

Section 251.

@x
@ The \CEE/ text enclosed in \pb\ should not contain `\.{\v}' characters,
@y
@r @ The \CEE/ text enclosed in \pb\ should not contain `\.{\v}' characters,
@z

Section 257.

@x
@ The output file will contain the control sequence \.{\\Y} between non-null
@y
@r @ The output file will contain the control sequence \.{\\Y} between non-null
@z

Section 260.

@x
@<Translate the \T...@>= do {
@y
@<Translate the \T...@>= do {@+
@z

Section 268.

@x
|next_control>=begin_C|. We will make the global variable |this_section|
@y
\hfil\break|next_control>=begin_C|. We will make the global variable |this_section|
@z

Section 269.

@x
@ @<Translate the \CEE/...@>=
@y
@r @ @<Translate the \CEE/...@>=
@z

Section 273.

@x
@ The |footnote| procedure gives cross-reference information about
@y
@r @ The |footnote| procedure gives cross-reference information about
@z

Section 285.

@x
@ A left-to-right radix sorting method is used, since this makes it easy to
@y
@ A left-to-right radix sorting method is used, since this makes it easy to
@-c@>
@z

Section 287.

@x
@ During the sorting phase we shall use the |cat| and |trans| arrays from
@y
@ During the sorting phase we shall use the |cat| and |trans| arrays from
@-j@>
@-k@>
@z

Section 290.

@x
$|collate|[0]<|collate|[1]<\cdots<|collate|[100]$.
@y
|collate[0]| $<$|collate[1]|$<\cdots<$|collate[100]|.
@z

Section 304.

@x
@ Because on some systems the difference between two pointers is a |ptrdiff_t|
rather than an |int|, we use \.{\%ld} to print these quantities.
@y
@r @ Because on some systems the difference between two pointers is a
|ptrdiff_t| rather than an |int|, we use \.{\%ld} to print these quantities.
@z

Section 305.

@x
\bigskip
\font\itt=cmitt10
{\noindent \it Although {\itt CTWILL} is based on {\itt cweave.w}, new and
modified material is incorporated all over the place, without taking special
care for keeping the original section numbering intact.}
@y
@z

Section 313.

@x
@** Index.
If you have read and understood the code for Phase III above, you know what
is in this index and how it got here. All sections in which an identifier is
used are listed with that identifier, except that reserved words are
indexed only when they appear in format definitions, and the appearances
of identifiers in section names are not indexed. Underlined entries
correspond to where the identifier was declared. Error messages, control
sequences put into the output, and a few
other things like ``recursion'' are indexed here too.
@y
@z
