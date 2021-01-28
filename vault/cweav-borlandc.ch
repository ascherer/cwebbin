Changes for CWEAVE.W by Andreas Scherer, December 4, 2018.

This set of changes provides support for installing CWEB on MS/DOS systems
with Borland C++ 3.1.  Arrays larger than 64 KB are allocated with a
system-dependent routine `farcalloc'.  For this, several pointer variables
have to be declared as `huge'.  Care has been taken to avoid conflicts with
other operating systems which are not restricted to the limitations of DOS.
(DOS isn't restricted to the 64 KB limit either, or else this full sized
patch would not be possible.  But instead of `farcalloc' a `non-ANSI' sized
`malloc' would be much more convenient.)  For other MS/DOS compilers than
Borland C++ 3.1 you'll have to replace this file by other changes.

This change file requires CWEAV-PATCH.CH, CWEAV-ANSI.CH, CWEAV-EXTENSIONS.CH,
CWEAV-OUTPUT.CH, CWEAV-MEMORY.CH, CWEAV-TRANSLATIONS.CH to be applied as well.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

@x l.223
typedef struct xref_info {
  sixteen_bits num; /* section number plus zero or |def_flag| */
  struct xref_info *xlink; /* pointer to the previous cross-reference */
} xref_info;
typedef xref_info *xref_pointer;
@y
typedef struct xref_info {
  sixteen_bits num; /* section number plus zero or |def_flag| */
  struct xref_info HUGE *xlink; /* pointer to the previous cross-reference */
} xref_info;
typedef xref_info HUGE *xref_pointer;
@z

@x l.26 of CWEAV-MEMORY.CH
alloc_object(xmem,max_refs,xref_info);
@y
#ifdef __TURBOC__
xmem=(xref_pointer)allocsafe(max_refs,sizeof(*xmem));
#else
alloc_object(xmem,max_refs,xref_info);
#endif
@z

@x l.334
typedef token *token_pointer;
typedef token_pointer *text_pointer;
@y
typedef token HUGE *token_pointer;
typedef token_pointer HUGE *text_pointer;
@z

@x l.51 of CWEAV-MEMORY.CH
alloc_object(tok_mem,max_toks,token);
@y
#ifdef __TURBOC__
tok_mem=(token_pointer)allocsafe(max_toks,sizeof(*tok_mem));
#else
alloc_object(tok_mem,max_toks,token);
#endif
@^system dependencies@>
@z

@x l.134 of CWEAV-ANSI.CH
  p->xref=(void *)xmem;
@y
  p->xref=(void HUGE*)xmem;
@z

@x l.239 of CWEAV-ANSI.CH
            else lhs->xref=(void *)q->xlink;
@y
            else lhs->xref=(void HUGE*)q->xlink;
@z

@x l.1419
  char *k, *k_end=(p+1)->byte_start; /* pointers into |byte_mem| */
@y
  char HUGE *k;
  char HUGE *k_end=(p+1)->byte_start; /* pointers into |byte_mem| */
@z

@x l.3554
  char *k, *k_limit; /* indices into |scratch| */
@y
  char HUGE *k;
  char HUGE *k_limit; /* indices into |scratch| */
@z

We need a huge pointer here instead of j; k seems a good choice, since it is
declared as index into byte_mem anyhow.

@x l.3600
    for (p=cur_name->byte_start;p<(cur_name+1)->byte_start;p++)
      out(*p=='_'? 'x': *p=='$'? 'X': *p);
@y
#ifdef __TURBOC__
    for (k=cur_name->byte_start;k<(cur_name+1)->byte_start;k++)
      out(*k=='_'? 'x': *k=='$'? 'X': *k);
#else
    for (p=cur_name->byte_start;p<(cur_name+1)->byte_start;p++)
      out(*p=='_'? 'x': *p=='$'? 'X': *p);
#endif
@^system dependencies@>
@z

@x l.3606
    for (p=cur_name->byte_start;p<(cur_name+1)->byte_start;p++)
      if (xislower(*p)) { /* not entirely uppercase */
@y
#ifdef __TURBOC__
    for (k=cur_name->byte_start;k<(cur_name+1)->byte_start;k++)
      if (xislower(*k)) { /* not entirely uppercase */
#else
    for (p=cur_name->byte_start;p<(cur_name+1)->byte_start;p++)
      if (xislower(*p)) { /* not entirely uppercase */
#endif
@^system dependencies@>
@z

@x l.606 of CWEAV-ANSI.CH
    if (cur_name->xref!=(void *)xmem) {
@y
    if (cur_name->xref!=(void HUGE*)xmem) {
@z

@x l.4268
char *cur_byte; /* index into |byte_mem| */
@y
char HUGE *cur_byte; /* index into |byte_mem| */
@z

@x l.4387
    else {char *j;
@y
    else {char HUGE *j;
@z

@x l.4550
  case custom: {char *j; out_str("$\\");
@y
  case custom: {char HUGE *j; out_str("$\\");
@z
