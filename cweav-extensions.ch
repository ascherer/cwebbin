Changes for CWEAVE.W by Andreas Scherer et al.

This set of changes introduces several extensions to the standard behaviour
of the CWEB system.  Several new command line options are provided here.
See `cwebmana.ch' for details about these new features.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

Section 89.

@x l.1415
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

Section 129.

@x l.2660
@<Cases for |exp|@>=
if (cat1==lbrace || cat1==int_like || cat1==decl) {
  make_underlined(pp); big_app(dindent); big_app1(pp);
  reduce(pp,1,fn_decl,0,1);
}
@y
@<Cases for |exp|@>=
if(cat1==lbrace || cat1==int_like || cat1==decl) {
  make_underlined(pp); if (indent_param_decl) big_app(dindent); big_app1(pp);
  reduce(pp,1,fn_decl,0,1);
}
@z

Section 139.

@x l.2763
@ @<Cases for |decl_head|@>=
if (cat1==comma) {
  big_app2(pp); big_app(' '); reduce(pp,2,decl_head,-1,33);
}
else if (cat1==ubinop) {
  big_app1_insert(pp,'{'); big_app('}'); reduce(pp,2,decl_head,-1,34);
}
else if (cat1==exp && cat2!=lpar && cat2!=exp && cat2!=cast) {
  make_underlined(pp+1); squash(pp,2,decl_head,-1,35);
}
else if ((cat1==binop||cat1==colon) && cat2==exp && (cat3==comma ||
    cat3==semi || cat3==rpar))
  squash(pp,3,decl_head,-1,36);
else if (cat1==cast) squash(pp,2,decl_head,-1,37);
else if (cat1==lbrace || cat1==int_like || cat1==decl) {
  big_app(dindent); big_app1(pp); reduce(pp,1,fn_decl,0,38);
}
else if (cat1==semi) squash(pp,2,decl,-1,39);
@y
@ @<Cases for |decl_head|@>=
if (cat1==comma) {
  big_app2(pp); big_app(' '); reduce(pp,2,decl_head,-1,33);
}
else if (cat1==ubinop) {
  big_app1_insert(pp,'{'); big_app('}');
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
  if (indent_param_decl) big_app(dindent); big_app1(pp);
  reduce(pp,1,fn_decl,0,38);
}
else if (cat1==semi) squash(pp,2,decl,-1,39);
@z

Section 140.

@x l.2785
@ @<Cases for |decl|@>=
if (cat1==decl) {
  big_app1_insert(pp,force); reduce(pp,2,decl,-1,40);
}
else if (cat1==stmt || cat1==function) {
  big_app1_insert(pp,big_force); reduce(pp,2,cat1,-1,41);
}
@y
@ @<Cases for |decl|@>=
if (cat1==decl) {
  big_app1_insert(pp,force); reduce(pp,2,decl,-1,40);
}
else if (cat1==stmt || cat1==function) {
  big_app1_insert(pp,order_decl_stmt ? big_force : force);
  reduce(pp,2,cat1,-1,41);
}
@z

Section 144.

@x l.2842
@ @<Cases for |fn_decl|@>=
if (cat1==decl) {
  big_app1_insert(pp,force); reduce(pp,2,fn_decl,0,51);
}
else if (cat1==stmt) {
  big_app1(pp); app(outdent); app(outdent); big_app(force);
  big_app1(pp+1); reduce(pp,2,function,-1,52);
}
@y
@ @<Cases for |fn_decl|@>=
if (cat1==decl) {
  big_app1_insert(pp,force); reduce(pp,2,fn_decl,0,51);
}
else if (cat1==stmt) {
  big_app1(pp);
  if (indent_param_decl) {
    app(outdent); app(outdent);
  }
  big_app(force); big_app1(pp+1); reduce(pp,2,function,-1,52);
}
@z

Section 153.

@x l.2942
  big_app1_insert(pp,dindent); reduce(pp,2,fn_decl,0,73);
@y
  big_app1(pp); if (indent_param_decl) big_app(dindent);
  big_app1(pp+1); reduce(pp,2,fn_decl,0,73);
@z

Addendum.

@x l.4895
@** Index.
@y
@* Formatting alternatives.
\.{CWEAVE} indents declarations after old-style function definitions.
With the \.{-i} option they will come out flush left.

@d indent_param_decl flags['i'] /* should formal parameter declarations be indented? */

@<Set init...@>=
indent_param_decl=true;

@ The original manual described the \.{-o} option for \.{CWEAVE}, but this was
not yet present.  Here is a simple implementation.  The purpose is to suppress
the extra space between local variable declarations and the first statement in
a function block.

@d order_decl_stmt flags['o'] /* should declarations and statements be separated? */

@<Set init...@>=
order_decl_stmt=true;

@** Index.
@z
