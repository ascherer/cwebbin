Changes for CWEAVE.W by Andreas Scherer et al.

This set of changes introduces several extensions to the standard behaviour
of the CWEB system.  Several new command line options are provided here.
See CWEBMAN-EXTENSIONS.CH for details about these new features.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

Section 88.

@x l.1395
@ In particular, the |finish_line| procedure is called near the very
beginning of phase two. We initialize the output variables in a slightly
tricky way so that the first line of the output file will be
`\.{\\input cwebmac}'.

@<Start \TEX/...@>=
out_ptr=out_buf+1; out_line=1; active_file=tex_file;
tex_printf("\\input cwebma"); *out_ptr='c';
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
out_ptr=out_buf+1; out_line=1; active_file=tex_file;
tex_puts("\\input ");
tex_printf(use_language);
tex_puts("cwebma");
*out_ptr='c';
@z

Section 110.

@x
@i prod.w
@y
@i prod-cweave.w
@z

Section 127.

@x l.2641
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

Section 137.

@x l.2745
@ @<Cases for |decl_head|@>=
if (cat1==comma) {
  big_app2(pp); app(opt); app('9'); reduce(pp,2,decl_head,-1,33);
}
else if (cat1==ubinop) {
  big_app1_insert(pp,'{'); big_app('}'); reduce(pp,2,decl_head,-1,34);
}
else if (cat1==exp && cat2!=lpar && cat2!=lbrack && cat2!=exp && cat2!=cast) {
  make_underlined(pp+1); squash(pp,2,decl_head,-1,35);
}
else if ((cat1==binop||cat1==colon) && cat2==exp && (cat3==comma ||
    cat3==semi || cat3==rpar))
  squash(pp,3,decl_head,-1,36);
else if (cat1==cast) squash(pp,2,decl_head,-1,37);
else if (cat1==int_like || cat1==lbrace || cat1==decl) {
  big_app(dindent); squash(pp,1,fn_decl,0,38);
}
else if (cat1==semi) squash(pp,2,decl,-1,39);
@y
@ @<Cases for |decl_head|@>=
if (cat1==comma) {
  big_app2(pp); app(opt); app('9'); reduce(pp,2,decl_head,-1,33);
}
else if (cat1==ubinop) {
  big_app1_insert(pp,'{'); big_app('}');
  reduce(pp,2,decl_head,-1,34);
}
else if (cat1==exp && cat2!=lpar && cat2!=lbrack && cat2!=exp && cat2!=cast) {
  make_underlined(pp+1); squash(pp,2,decl_head,-1,35);
}
else if ((cat1==binop||cat1==colon) && cat2==exp && (cat3==comma ||
    cat3==semi || cat3==rpar))
  squash(pp,3,decl_head,-1,36);
else if (cat1==cast) squash(pp,2,decl_head,-1,37);
else if (cat1==int_like || cat1==lbrace || cat1==decl) {
  if (indent_param_decl) big_app(dindent);
  squash(pp,1,fn_decl,0,38);
}
else if (cat1==semi) squash(pp,2,decl,-1,39);
@z

Section 138.

@x l.2767
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

Section 142.

@x l.2824
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

Section 152.

@x l.2924
  big_app1_insert(pp,dindent); reduce(pp,2,fn_decl,0,73);
@y
  big_app1(pp); if (indent_param_decl) big_app(dindent);
  big_app1(pp+1); reduce(pp,2,fn_decl,0,73);
@z

Section 155.

@x
  big_app1_insert(pp, (cat1==decl || cat1==function) ? big_force :
     force_lines ? force : break_space); reduce(pp,2,cat1,-1,76);
@y
  big_app1_insert(pp, (cat1==decl || cat1==function) ? @|
     ( order_decl_stmt ? big_force : force ) : @|
     ( force_lines ? force : break_space ) ); reduce(pp,2,cat1,-1,76);
@z

Addendum.

@x l.4873
@** Index.
@y
@* Formatting alternatives.
\.{CWEAVE} indents declarations after old-style function definitions and
long parameter lists of modern function definitions.
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
