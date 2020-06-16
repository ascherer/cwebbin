@x
The information that \.{CTWILL} concocts from \.{foo.w} is not always
correct. Sometimes you'll use an identifier that you don't want
indexed; for example, your exposition might talk about |f(x)| when you
don't mean to refer to program variables |f| or |x|. Sometimes you'll
use an identifier that's defined in a header file, unknown to
\.{CTWILL}. Sometimes you'll define a single identifier in several
different places, and \.{CTWILL} won't know which definition to choose.
But all is not lost. \.{CTWILL} guesses right most of the time, and you can
give it the necessary hints in other places via your change file.
@y
The information that \.{CTWILL} concocts from \.{foo.w} is not always
correct. Sometimes you'll use an identifier that you don't want
indexed; for example, your exposition might talk about |f(x)| when you
don't mean to refer to program variables |f| or |x|. Sometimes you'll
use an identifier that's defined in a header file, unknown to
\.{CTWILL}. Sometimes you'll define a single identifier in several
different places, and \.{CTWILL} won't know which definition to choose.
But all is not lost. \.{CTWILL} guesses right most of the time, and you can
give it the necessary hints in other places via your change file.
@-f@>
@-x@>
@z

@x
must have fewer than 50 characters. If the \TeX\ part starts
@y
must have fewer than 50 characters.

\vfill\eject

If the \TeX\ part starts
@z

@x
@d max_tex_chars 50 /* limit on the \TeX\ part of a meaning */
@y
\vfill\eject
@z

@x
to \.{CTANGLE} and \.{CWEAVE}, before proceeding further.
@y
to \.{CTANGLE} and \.{CWEAVE}, before proceeding further.
@d max_tex_chars 50 /* limit on the \TeX\ part of a meaning */
@z

@x
you have to change them also in the file |"common.w"|.
@y
you have to change them also in file |"common.w"|.
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
preceded by \.{@@(} instead of \.{@@<}.  \par}
@z

@x
with |next_control!='|'| and ends with |next_control>=format_code|. Thus, it
@y
with |next_control| |!='|'| and ends with |next_control>=format_code|. Thus, it
@z

@x
@ Finally, when the \TEX/ and definition parts have been treated, we have
|next_control>=begin_C|.
@y
@ Finally, when the \TEX/ and definition parts have been treated, we have
\hfil\break|next_control>=begin_C|.
@z

@x
code is followed by an integer |n|, and the break will occur with penalty
@y
code is followed by an integer \\{n}, and the break will occur with penalty
@z

@x
|n| is the section number.
@y
\\{n} is the section number.
@z

@x
@ The raw input is converted into scraps according to the following table,
@y
@  \advance \hsize by 4cm \advance \pdfpagewidth by 4cm
The raw input is converted into scraps according to the following table,
@z

@x
\.{extern}&|int_like|: \stars&maybe\cr
@y
\.{extern}&|int_like|: \stars&maybe\cr
}

\vfill\eject

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
@z

@x
\.{@@h}&|insert|: |force| \.{\\ATH} |force|&no\cr
@y
\.{@@h}&|insert|: |force| \.{\\ATH} |force|&no\cr
}

\vfill\eject

\yskip\halign{\quad#\hfil&\quad#\hfil&\quad\hfil#\hfil\cr
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
the category codes |pp->cat,@,@,(pp+1)->cat|$,\,\,\ldots\,$
@y
the category codes |pp->cat|, |(pp+1)->cat|, $\,\ldots\,$
@z

@x
@ Token lists in |@!tok_mem| are composed of the following kinds of
items for \TEX/ output.
@y
@ \eject \advance \hsize by -4cm \advance \pdfpagewidth by -4cm
Token lists in |@!tok_mem| are composed of the following kinds of
items for \TEX/ output.
@z

@x
of identifiers in case labels.

If the first identifier is the keyword `\&{operator}', we give up;
@y
of identifiers in case labels.
If the first identifier is the keyword `\&{operator}', we give up;
@z

@x
|make_reserved|, hence |tok_loc| has been set.
@y
\hfil\break|make_reserved|, hence |tok_loc| has been set.
@z

@x
called when |stack_ptr==1|.
@y
called when |stack_ptr| |==1|.
@z

@x
|next_control>=begin_C|. We will make the global variable |this_section|
@y
\hfil\break|next_control>=begin_C|. We will make the global variable |this_section|
@z

@x
$|collate|[0]<|collate|[1]<\cdots<|collate|[100]$.
@y
|collate[0]| $<$|collate[1]|$<\cdots<$|collate[100]|.
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
