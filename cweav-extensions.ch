Changes for CWEAVE.W by Andreas Scherer et al.

This set of changes introduces several extensions to the standard behaviour
of the CWEB system.  Several new command line options are provided here.
See `cwebmana.ch' for details about these new features.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

Section 4.

@x l.121
@d max_bytes 90000 /* the number of bytes in identifiers,
@y
@d max_bytes 1000000 /* the number of bytes in identifiers,
@z

@x l.123
@d max_names 4000 /* number of identifiers, strings, section names;
@y
@d max_names 10239 /* number of identifiers, strings, section names;
@z

@x l.125
@d max_sections 2000 /* greater than the total number of sections */
@d hash_size 353 /* should be prime */
@d buf_size 100 /* maximum length of input line, plus one */
@y
@d max_sections 10239 /* greater than the total number of sections */
@d hash_size 8501 /* should be prime */
@d buf_size 1000 /* maximum length of input line, plus one */
@z

@x l.132
@d max_refs 20000 /* number of cross-references; must be less than 65536 */
@d max_toks 20000 /* number of symbols in \CEE/ texts being parsed;
@y
@d max_refs 65535 /* number of cross-references; must be less than 65536 */
@d max_toks 65535 /* number of symbols in \CEE/ texts being parsed;
@z

@x l.135
@d max_texts 4000 /* number of phrases in \CEE/ texts being parsed;
@y
@d max_texts 10239 /* number of phrases in \CEE/ texts being parsed;
@z

@x l.137
@d max_scraps 2000 /* number of tokens in \CEE/ texts being parsed */
@d stack_size 400 /* number of simultaneous output levels */
@y
@d max_scraps 10000 /* number of tokens in \CEE/ texts being parsed */
@d stack_size 2000 /* number of simultaneous output levels */
@z

Section 21.  Cross-over from CWEAVE to COMMON.

@x l.269
@d no_xref (flags['x']==0)
@d make_xrefs flags['x'] /* should cross references be output? */
@y
@d no_xref (!make_xrefs) /* should cross references be suppressed? */
@z

Section 40.  Parse C++ string prefixes L, U, u, u8.

@x l.708
    else if (c=='\'' || c=='"' || (c=='L'&&(*loc=='\'' || *loc=='"'))@|
@y
    else if (c=='\'' || c=='"'@|
           || ((c=='L' || c=='u' || c=='U')&&(*loc=='\'' || *loc=='"'))@|
           || ((c=='u' && *loc=='8')&&(*(loc+1)=='\'' || *(loc+1)=='"'))@|
@z

Section 49.

@x l.852
  if (delim=='L') { /* wide character constant */
    delim=*loc++; *++id_loc=delim;
  }
@y
  if (delim=='L' || delim=='u' || delim=='U') { /* wide character constant */
    if (delim=='u' && *loc=='8') { *++id_loc=*loc++; }
    delim=*loc++; *++id_loc=delim;
  }
@z

Section 78.

@x l.1320
@d tex_printf(c) fprintf(active_file,c)
@y
@d tex_printf(c) fprintf(active_file,"%s",c)
@d tex_puts(c) fputs(c,active_file)
@z

Section 80.

@x l.1364 and l.257 of CWEAV-PATCH.CH
@ In particular, the |finish_line| procedure is called near the very
beginning of phase two. We initialize the output variables in a slightly
tricky way so that the first line of the output file will be
`\.{\\input cwebmac}'.

@<Start \TEX/...@>=
out_ptr=out_buf+1; out_line=1; active_file=tex_file;
*out_ptr='c'; tex_printf("\\input cwebma");
@y
@ In particular, the |finish_line| procedure is called near the very
beginning of phase two. We initialize the output variables in a slightly
tricky way so that the first line of the output file will be dependent of
the user language set by the `\.{+l}' option and its argument.  If you call
\.{CWEAVE} with `\.{+lX}' (or `\.{-lX}' as well), where `\.X' is the
(possibly empty) string of characters to the right of~`\.l', `\.X'~will be
prepended to `\.{cwebmac.tex}', e.g., if you call \.{CWEAVE} with
`\.{+ldeutsch}', you will receive the line `\.{\\input deutschcwebmac}'.
Without this option the first line of the output file will be
`\.{\\input cwebmac}'.

@<Start \TEX/...@>=
out_ptr=out_buf+1; out_line=1; active_file=tex_file; *out_ptr='c';
tex_puts("\\input ");
tex_printf(use_language);
tex_puts("cwebma");
@z

Section 117.

@x l.2540
@<Cases for |exp|@>=
if (cat1==lbrace || cat1==int_like || cat1==decl) {
  make_underlined(pp); big_app1(pp); big_app(indent); app(indent);
  reduce(pp,1,fn_decl,0,1);
}
@y
\.{CWEAVE} indents declarations after old-style function definitions.
With the \.{-i} option they will come out flush left.  You won't see
any difference if you use ANSI-style function definitions.

@d indent_param_decl flags['i'] /* should formal parameter declarations be indented? */

@<Cases for |exp|@>=
if(cat1==lbrace || cat1==int_like || cat1==decl) {
  make_underlined(pp); big_app1(pp);
  if (indent_param_decl) {
    big_app(indent); app(indent);
  }
  reduce(pp,1,fn_decl,0,1);
}
@z

Section 127.

@x l.2640
@ @<Cases for |decl_head|@>=
if (cat1==comma) {
  big_app2(pp); big_app(' '); reduce(pp,2,decl_head,-1,33);
}
else if (cat1==ubinop) {
  big_app1(pp); big_app('{'); big_app1(pp+1); big_app('}');
  reduce(pp,2,decl_head,-1,34);
}
else if (cat1==exp && cat2!=lpar && cat2!=exp && cat2!=cast) {
  make_underlined(pp+1); squash(pp,2,decl_head,-1,35);
}
else if ((cat1==binop||cat1==colon) && cat2==exp && (cat3==comma ||
    cat3==semi || cat3==rpar))
  squash(pp,3,decl_head,-1,36);
else if (cat1==cast) squash(pp,2,decl_head,-1,37);
else if (cat1==lbrace || cat1==int_like || cat1==decl) {
  big_app1(pp); big_app(indent); app(indent); reduce(pp,1,fn_decl,0,38);
}
else if (cat1==semi) squash(pp,2,decl,-1,39);
@y
@ @<Cases for |decl_head|@>=
if (cat1==comma) {
  big_app2(pp); big_app(' '); reduce(pp,2,decl_head,-1,33);
}
else if (cat1==ubinop) {
  big_app1(pp); big_app('{'); big_app1(pp+1); big_app('}');
  reduce(pp,2,decl_head,-1,34);
}
else if (cat1==exp && cat2!=lpar && cat2!=exp && cat2!=cast) {
  make_underlined(pp+1); squash(pp,2,decl_head,-1,35);
}
else if ((cat1==binop||cat1==colon) && cat2==exp && (cat3==comma ||
    cat3==semi || cat3==rpar))
  squash(pp,3,decl_head,-1,36);
else if (cat1==cast) squash(pp,2,decl_head,-1,37);
else if (cat1==lbrace || cat1==int_like || cat1==decl) {
  big_app1(pp);
  if (indent_param_decl) {
    big_app(indent); app(indent);
  }
  reduce(pp,1,fn_decl,0,38);
}
else if (cat1==semi) squash(pp,2,decl,-1,39);
@z

Section 128.

@x l.2660
@ @<Cases for |decl|@>=
if (cat1==decl) {
  big_app1(pp); big_app(force); big_app1(pp+1);
  reduce(pp,2,decl,-1,40);
}
else if (cat1==stmt || cat1==function) {
  big_app1(pp); big_app(big_force);
  big_app1(pp+1); reduce(pp,2,cat1,-1,41);
}
@y
@ The original manual described the \.{-o} option for \.{CWEAVE}, but this was
not yet present.  Here is a simple implementation.  The purpose is to suppress
the extra space between local variable declarations and the first statement in
a function block.

@d order_decl_stmt flags['o'] /* should declarations and statements be separated? */

@<Cases for |decl|@>=
if (cat1==decl) {
  big_app1(pp); big_app(force); big_app1(pp+1);
  reduce(pp,2,decl,-1,40);
}
else if (cat1==stmt || cat1==function) {
  big_app1(pp);
  if(order_decl_stmt) big_app(big_force);
  else big_app(force);
  big_app1(pp+1); reduce(pp,2,cat1,-1,41);
}
@z

Section 132.

@x l.2713
@ @<Cases for |fn_decl|@>=
if (cat1==decl) {
  big_app1(pp); big_app(force); big_app1(pp+1); reduce(pp,2,fn_decl,0,51);
}
else if (cat1==stmt) {
  big_app1(pp); app(outdent); app(outdent); big_app(force);
  big_app1(pp+1); reduce(pp,2,function,-1,52);
}
@y
@ Outdent after parameter declarations with option \.{-i}.

@<Cases for |fn_decl|@>=
if (cat1==decl) {
  big_app1(pp); big_app(force); big_app1(pp+1); reduce(pp,2,fn_decl,0,51);
}
else if (cat1==stmt) {
  big_app1(pp);
  if (indent_param_decl) {
    app(outdent); app(outdent);
  }
  big_app(force);
  big_app1(pp+1); reduce(pp,2,function,-1,52);
}
@z

@x l.105 and l.474 of CWEAV-PATCH.CH
  make_xrefs=force_lines=make_pb=1; /* controlled by command-line options */
@y
  make_xrefs=force_lines=make_pb=indent_param_decl=order_decl_stmt=1;
    /* controlled by command-line options */
@z

Addendum.

@x l.4644
@** Index.
@y
@* Language setting.  This global variable is defined and set in \.{COMMON} by
the `\.{+l}' (or `\.{-l}') command-line option.

@<Global var...@>=
extern const char *use_language; /* prefix to \.{cwebmac.tex} in \TEX/ output */

@** Index.
