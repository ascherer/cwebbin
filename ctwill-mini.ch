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
@ Here is a sort of user manual for \.{CTWILL}---which is exactly like
@y
@* \.{CTWILL} user manual.
 Here is a sort of user manual for \.{CTWILL}---which is exactly like
@z

@x
give it the necessary hints in other places via your change file.
@y
give it the necessary hints in other places via your change file.
@-f@>
@-x@>
@z

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

@x
@d max_tex_chars 50 /* limit on the \TeX\ part of a meaning */
@y
@z

@x
you have to change them also in the file |"common.w"|.
@y
you have to change them also in file |"common.w"|.
@z

@x
@ The next few sections contain stuff from the file |"common.w"| that must
@y
@r @ The next few sections contain stuff from the file |"common.w"| that must
@z

@x
@ Code related to section numbers:
@y
@r @ Code related to section numbers:
@z

@x
@ \.{CTWILL} also has special data structures to keep track of current
@y
@r @ \.{CTWILL} also has special data structures to keep track of current
@z

@x
@ The |new_meaning| routine changes the current ``permanent meaning''
@y
@r @ The |new_meaning| routine changes the current ``permanent meaning''
@z

@x
id_lookup("do",NULL,do_like);
@y
@ @<Store all...@>=
id_lookup("do",NULL,do_like);
@z

@x
id_lookup("undef",NULL,if_like);
@y
@ @<Store all...@>=
id_lookup("undef",NULL,if_like);
@z

@x
@ Control codes are converted to \.{CWEAVE}'s internal
@y
@r @ Control codes are converted to \.{CWEAVE}'s internal
@z

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

@x
@ @<Put section name...@>=
@y
@r @ @<Put section name...@>=
@z

@x
with |next_control!='|'| and ends with |next_control>=format_code|. Thus, it
@y
with |next_control| |{}!='|'| and ends with |next_control>=format_code|.
Thus, it
@z

@x
@ Finally, when the \TEX/ and definition parts have been treated, we have
|next_control>=begin_C|.
@y
@ Finally, when the \TEX/ and definition parts have been treated, we have
\hfil\break|next_control>=begin_C|.
@z

@x
@ When we are copying \TEX/ source material, we retain line breaks
@y
@r @ When we are copying \TEX/ source material, we retain line breaks
@z

@x
@ We get to this section only in the unusual case that the entire output line
@y
@r @ We get to this section only in the unusual case that the entire output line
@z

@x
@ @<Copy special things when |c=='@@'...@>=
@y
@r @ @<Copy special things when |c=='@@'...@>=
@z

@x
@ Here is a list of the category codes that scraps can have.
@y
@r @ Here is a list of the category codes that scraps can have.
@z

@x
@ The token lists for translated \TEX/ output contain some special control
@y
@r @ The token lists for translated \TEX/ output contain some special control
@z

@x
\yskip\noindent All of these tokens are removed from the \TEX/ output that
@y
@ All of these tokens are removed from the \TEX/ output that
@z

@x
|n| is the section number.
@y
|n| is the section number.
@-n@>
@z

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

@x
\.>&|prerangle|: \.{\\rangle}&yes\cr
@y
\.>&|prerangle|: \.{\\rangle}&yes\cr}

@ Cont.

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
%\vskip\halign{\quad#\hfil&\quad\hbox to11cm{#\hfil}&\quad\hfil#\hfil\cr
@z

@x
\.{continue}&|case_like|: \stars&maybe\cr
@y
\.{continue}&|case_like|: \stars&maybe\cr}

@r @ Cont.

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
%\vskip\halign{\quad#\hfil&\quad\hbox to11cm{#\hfil}&\quad\hfil#\hfil\cr
@z

@x
\.{long}&|raw_int|: \stars&maybe\cr
@y
\.{long}&|raw_int|: \stars&maybe\cr}

@ Cont.

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
%\vskip\halign{\quad#\hfil&\quad\hbox to11cm{#\hfil}&\quad\hfil#\hfil\cr
@z

@x
\.{try}&|else_like|: \stars&maybe\cr
@y
\.{try}&|else_like|: \stars&maybe\cr}

@r @ Cont.

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
%\vskip\halign{\quad#\hfil&\quad\hbox to11cm{#\hfil}&\quad\hfil#\hfil\cr
@z

@x
@i prod-twill.w
@y
@i prod-twill.w
@-any@>
@-any_other@>
@-g@>
@-in@>
@-z@>
@z

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

@x
@ @<Set init...@>=
@y
@r @ @<Set init...@>=
@z

@x
#ifdef DEAD_CODE /* not used in |main| */
@y
@ Debugging routine, use at your own risk.

@c
#ifdef DEAD_CODE /* not used in |main| */
@z

@x
@ @<Print token |r|...@>=
@y
@r @ @<Print token |r|...@>=
@z

@x
The code below is an exact translation of the production rules into
@y
@r @ The code below is an exact translation of the production rules into
@z

@x
@ Let us consider the big switch for productions now, before looking
@y
@r @ Let us consider the big switch for productions now, before looking
@z

@x
  switch (pp->cat) {
    case exp: @<Cases for |exp|@>; @+break;
    case lpar: @<Cases for |lpar|@>; @+break;
    case unop: @<Cases for |unop|@>; @+break;
    case ubinop: @<Cases for |ubinop|@>; @+break;
    case binop: @<Cases for |binop|@>; @+break;
    case cast: @<Cases for |cast|@>; @+break;
    case sizeof_like: @<Cases for |sizeof_like|@>; @+break;
    case int_like: @<Cases for |int_like|@>; @+break;
    case public_like: @<Cases for |public_like|@>; @+break;
    case colcol: @<Cases for |colcol|@>; @+break;
    case decl_head: @<Cases for |decl_head|@>; @+break;
    case decl: @<Cases for |decl|@>; @+break;
    case base: @<Cases for |base|@>; @+break;
    case struct_like: @<Cases for |struct_like|@>; @+break;
    case struct_head: @<Cases for |struct_head|@>; @+break;
    case fn_decl: @<Cases for |fn_decl|@>; @+break;
    case function: @<Cases for |function|@>; @+break;
    case lbrace: @<Cases for |lbrace|@>; @+break;
    case if_like: @<Cases for |if_like|@>; @+break;
    case else_like: @<Cases for |else_like|@>; @+break;
    case else_head: @<Cases for |else_head|@>; @+break;
    case if_clause: @<Cases for |if_clause|@>; @+break;
    case if_head: @<Cases for |if_head|@>; @+break;
    case do_like: @<Cases for |do_like|@>; @+break;
    case case_like: @<Cases for |case_like|@>; @+break;
    case catch_like: @<Cases for |catch_like|@>; @+break;
    case tag: @<Cases for |tag|@>; @+break;
    case stmt: @<Cases for |stmt|@>; @+break;
    case semi: @<Cases for |semi|@>; @+break;
    case lproc: @<Cases for |lproc|@>; @+break;
    case section_scrap: @<Cases for |section_scrap|@>; @+break;
    case insert: @<Cases for |insert|@>; @+break;
    case prelangle: @<Cases for |prelangle|@>; @+break;
    case prerangle: @<Cases for |prerangle|@>; @+break;
    case langle: @<Cases for |langle|@>; @+break;
    case template_like: @<Cases for |template_like|@>; @+break;
    case new_like: @<Cases for |new_like|@>; @+break;
    case new_exp: @<Cases for |new_exp|@>; @+break;
    case ftemplate: @<Cases for |ftemplate|@>; @+break;
    case for_like: @<Cases for |for_like|@>; @+break;
    case raw_ubin: @<Cases for |raw_ubin|@>; @+break;
    case const_like: @<Cases for |const_like|@>; @+break;
    case raw_int: @<Cases for |raw_int|@>; @+break;
    case operator_like: @<Cases for |operator_like|@>; @+break;
    case typedef_like: @<Cases for |typedef_like|@>; @+break;
    case delete_like: @<Cases for |delete_like|@>; @+break;
    case question: @<Cases for |question|@>; @+break;
  }
  pp++; /* if no match was found, we move to the right */
}
@y
  switch (pp->cat) {
    @<Cases for |pp->cat|@>@;
  }
  pp++; /* if no match was found, we move to the right */
}

@ @<Cases for |pp->cat|@>=
    case exp: @<Cases for |exp|@>; @+break;
    case lpar: @<Cases for |lpar|@>; @+break;
    case unop: @<Cases for |unop|@>; @+break;
    case ubinop: @<Cases for |ubinop|@>; @+break;
    case binop: @<Cases for |binop|@>; @+break;
    case cast: @<Cases for |cast|@>; @+break;
    case sizeof_like: @<Cases for |sizeof_like|@>; @+break;
    case int_like: @<Cases for |int_like|@>; @+break;
    case public_like: @<Cases for |public_like|@>; @+break;
    case colcol: @<Cases for |colcol|@>; @+break;
    case decl_head: @<Cases for |decl_head|@>; @+break;
    case decl: @<Cases for |decl|@>; @+break;
    case base: @<Cases for |base|@>; @+break;
    case struct_like: @<Cases for |struct_like|@>; @+break;
    case struct_head: @<Cases for |struct_head|@>; @+break;
    case fn_decl: @<Cases for |fn_decl|@>; @+break;
    case function: @<Cases for |function|@>; @+break;
    case lbrace: @<Cases for |lbrace|@>; @+break;
    case if_like: @<Cases for |if_like|@>; @+break;
    case else_like: @<Cases for |else_like|@>; @+break;
    case else_head: @<Cases for |else_head|@>; @+break;
    case if_clause: @<Cases for |if_clause|@>; @+break;
    case if_head: @<Cases for |if_head|@>; @+break;
    case do_like: @<Cases for |do_like|@>; @+break;
    case case_like: @<Cases for |case_like|@>; @+break;
    case catch_like: @<Cases for |catch_like|@>; @+break;
    case tag: @<Cases for |tag|@>; @+break;
    case stmt: @<Cases for |stmt|@>; @+break;
    case semi: @<Cases for |semi|@>; @+break;
    case lproc: @<Cases for |lproc|@>; @+break;
    case section_scrap: @<Cases for |section_scrap|@>; @+break;
    case insert: @<Cases for |insert|@>; @+break;
    case prelangle: @<Cases for |prelangle|@>; @+break;
    case prerangle: @<Cases for |prerangle|@>; @+break;
    case langle: @<Cases for |langle|@>; @+break;
    case template_like: @<Cases for |template_like|@>; @+break;
    case new_like: @<Cases for |new_like|@>; @+break;
    case new_exp: @<Cases for |new_exp|@>; @+break;
    case ftemplate: @<Cases for |ftemplate|@>; @+break;
    case for_like: @<Cases for |for_like|@>; @+break;
    case raw_ubin: @<Cases for |raw_ubin|@>; @+break;
    case const_like: @<Cases for |const_like|@>; @+break;
    case raw_int: @<Cases for |raw_int|@>; @+break;
    case operator_like: @<Cases for |operator_like|@>; @+break;
    case typedef_like: @<Cases for |typedef_like|@>; @+break;
    case delete_like: @<Cases for |delete_like|@>; @+break;
    case question: @<Cases for |question|@>; @+break;
@z

@x
of identifiers in case labels.

If the first identifier is the keyword `\&{operator}', we give up;
@y
of identifiers in case labels.
If the first identifier is the keyword `\&{operator}', we give up;
@z

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

@x
@ @<Cases for |lpar|@>=
@y
@r @ @<Cases for |lpar|@>=
@z

@x
@ Outdent after parameter declarations with option \.{-i}.
@y
@r @ Outdent after parameter declarations with option \.{-i}.
@z

@x
@ Here's the |squash| procedure, which
@y
@r @ Here's the |squash| procedure, which
@z

@x
@ @d cur_end cur_state.end_field /* current ending location in |tok_mem| */
@y
@r @ @d cur_end cur_state.end_field /* current ending location in |tok_mem| */
@z

@x
called when |stack_ptr==1|.
@y
called when |stack_ptr| |==1|.
@z

@x
  text_pointer save_text_ptr;
  sixteen_bits save_next_control; /* values to be restored */
  text_pointer p; /* translation of the \CEE/ text */
@y
  text_pointer save_text_ptr, p; /* translation of the \CEE/ text */
  sixteen_bits save_next_control; /* values to be restored */
@z

@x
@ An identifier of length one does not have to be enclosed in braces, and it
@y
@r @ An identifier of length one does not have to be enclosed in braces, and it
@z

@x
else @<Look ahead for strongest line break, |goto reswitch|@>
@y
else {@<Look ahead for strongest line break, |goto reswitch|@>}
@z

@x
@<Look ahead for st...@>= {
@y
@<Look ahead for st...@>=
@z

@x
}
@y
@z

@x
@ @<Output saved...@>=
@y
@r @ @<Output saved...@>=
@z

@x
@ The output file will contain the control sequence \.{\\Y} between non-null
@y
@r @ The output file will contain the control sequence \.{\\Y} between non-null
@z

@x
@<Translate the \T...@>= do {
@y
@<Translate the \T...@>= do {@+
@z

@x
|next_control>=begin_C|. We will make the global variable |this_section|
@y
\hfil\break|next_control>=begin_C|. We will make the global variable |this_section|
@z

@x
@ @<Translate the \CEE/...@>=
@y
@r @ @<Translate the \CEE/...@>=
@z

@x
@ The |footnote| procedure gives cross-reference information about
@y
@r @ The |footnote| procedure gives cross-reference information about
@z

@x
@ @<Output information about usage of id's defined in other sections@>=
@y
@r @ @<Output information about usage of id's defined in other sections@>=
@z

@x
the index section itself---NOT!

@<Global...@>=
sixteen_bits k_section; /* runs through the sections */
@y
the index section itself---NOT!
@z

@x
name_pointer blink[max_names]; /* links in the buckets */
@y
name_pointer blink[max_names]; /* links in the buckets */
sixteen_bits k_section; /* runs through the sections */
@z

@x
$|collate|[0]<|collate|[1]<\cdots<|collate|[100]$.
@y
|collate[0]| $<$|collate[1]|$<\cdots<$|collate[100]|.
@z

@x
    else {char *j;
@y
    else {@+char *j;
@z

@x
@ Because on some systems the difference between two pointers is a |long|
@y
@r @ Because on some systems the difference between two pointers is a |long|
@z

@x
extern const char *use_language; /* prefix to \.{cwebmac.tex} in \TEX/ output */
@y
extern const char *use_language; /* prefix to \.{ctwimac.tex} in \TEX/ output */
@z

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
