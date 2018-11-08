This set of changes converts the CWEAVE.W module into ANSI-C and C++ code.
All functions are both declared and defined in prototypical form, while
several functions are declared `static' instead of `extern'.  At several
places additional casts are introduced and `char *' is replaced by
`void *', the default pointer type in ANSI-C.

This is a standalone change file, although CWEAV-PATCH.CH should be applied
as well to bump the revision information.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

@x l.54
@s not_eq normal @q unreserve a C++ keyword @>
@y
@z

@x l.73
@ We predeclare several standard system functions here instead of including
their system header files, because the names of the header files are not as
standard as the names of the functions. (For example, some \CEE/ environments
have \.{<string.h>} where others have \.{<strings.h>}.)

@<Predecl...@>=
extern int strlen(); /* length of string */
extern int strcmp(); /* compare strings lexicographically */
extern char* strcpy(); /* copy one string to another */
extern int strncmp(); /* compare up to $n$ string characters */
extern char* strncpy(); /* copy up to $n$ string characters */
@y
@ For string handling we include the {\mc ANSI C} system header file instead
of predeclaring the standard system functions |strlen|, |strcmp|, |strcpy|,
|strncmp|, and |strncpy|.
@^system dependencies@>

@<Include files@>=
#include <string.h>
@z

@x l.94
int main (ac, av)
int ac; /* argument count */
char **av; /* argument values */
@y
int main (@t\1\1@>
int ac, /* argument count */
char **av@t\2\2@>) /* argument values */
@z

@x l.107
  if (show_banner) printf(banner); /* print a ``banner line'' */
@y
  if (show_banner) fputs(banner,stdout); /* print a ``banner line'' */
@z

@x l.139
@i common.h
@y
@i comm-foo.h
@z

@x l.226
typedef struct xref_info {
  sixteen_bits num; /* section number plus zero or |def_flag| */
  struct xref_info *xlink; /* pointer to the previous cross-reference */
} xref_info;
@y
typedef sixteen_bits token;
typedef struct xref_info {
  sixteen_bits num; /* section number plus zero or |def_flag| */
  struct xref_info *xlink; /* pointer to the previous cross-reference */
} xref_info;
@z

@x l.244
xref_ptr=xmem; name_dir->xref=(char*)xmem; xref_switch=0; section_xref_switch=0;
@y
xref_ptr=xmem; name_dir->xref=(void *)xmem; xref_switch=0; section_xref_switch=0;
@z

@x l.263
void
new_xref(p)
name_pointer p;
@y
static void
new_xref(
name_pointer p)
@z

@x l.279
  append_xref(m); xref_ptr->xlink=q; p->xref=(char*)xref_ptr;
@y
  append_xref(m); xref_ptr->xlink=q; p->xref=(void *)xref_ptr;
@z

@x l.294
void
new_section_xref(p)
name_pointer p;
@y
static void
new_section_xref(
name_pointer p)
@z

@x l.306
  if (r==xmem) p->xref=(char*)xref_ptr;
@y
  if (r==xmem) p->xref=(void *)xref_ptr;
@z

@x l.314
void
set_file_flag(p)
name_pointer p;
@y
static void
set_file_flag(
name_pointer p)
@z

@x l.323
  p->xref = (char *)xref_ptr;
@y
  p->xref = (void *)xref_ptr;
@z

@x l.336
typedef sixteen_bits token;
@y
@z

@x l.359
int names_match(p,first,l,t)
name_pointer p; /* points to the proposed match */
char *first; /* position of first character of string */
int l; /* length of identifier */
eight_bits t; /* desired ilk */
@y
int names_match(@t\1\1@>
name_pointer p, /* points to the proposed match */
const char *first, /* position of first character of string */
size_t l, /* length of identifier */
eight_bits t@t\2\2@>) /* desired |ilk| */
@z

@x l.370
void
init_p(p,t)
name_pointer p;
eight_bits t;
@y
void
init_p(
name_pointer p,
eight_bits t)
@z

@x l.375
  p->ilk=t; p->xref=(char*)xmem;
@y
  p->ilk=t; p->xref=(void *)xmem;
@z

@x l.378
void
init_node(p)
name_pointer p;
@y
void
init_node(
name_pointer p)
@z

@x l.382
  p->xref=(char*)xmem;
@y
  p->xref=(void *)xmem;
@z

@x l.563
void   skip_limbo();
@y
static void skip_limbo(void);
@z

@x l.566
void
skip_limbo() {
@y
static void
skip_limbo(void) {
@z

@x l.588
unsigned
skip_TeX() /* skip past pure \TEX/ code */
@y
static unsigned
skip_TeX(void) /* skip past pure \TEX/ code */
@z

@x l.646
#include <stdlib.h> /* definition of |exit| */
@y
#include <stddef.h> /* type definition of |ptrdiff_t| */
#include <stdlib.h> /* definition of |exit| */
@z

@x l.656
eight_bits get_next();
@y
static eight_bits get_next(void);
@z

@x l.659
eight_bits
get_next() /* produces the next input token */
{@+eight_bits c; /* the current character */
@y
static eight_bits
get_next(void) /* produces the next input token */
{
  eight_bits c; /* the current character */
@z

@x l.780
    else if (*loc=='>') if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); break;
@y
    else { if (*loc=='>') { if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); } } break;
@z

@x l.795
  case '!': if (*loc=='=') compress(not_eq); break;
@y
  case '!': if (*loc=='=') compress(non_eq); break;
@z

@x l.870
    if (c=='\\') if (loc>=limit) continue;
      else if (++id_loc<=section_text_end) {
        *id_loc = '\\'; c=*loc++;
      }
@y
    if (c=='\\') { if (loc>=limit) continue;
      else { if (++id_loc<=section_text_end) {
        *id_loc = '\\'; c=*loc++;
      } } }
@z

@x l.934
void skip_restricted();
@y
void skip_restricted(void);
@z

@x l.937
void
skip_restricted()
@y
void
skip_restricted(void)
@z

@x l.987
void phase_one();
@y
static void phase_one(void);
@z

@x l.990
void
phase_one() {
@y
static void
phase_one(void) {
@z

@x l.1038
void C_xref();
@y
static void C_xref(eight_bits);
@z

@x l.1041
void
C_xref( spec_ctrl ) /* makes cross-references for \CEE/ identifiers */
  eight_bits spec_ctrl;
@y
static void
C_xref(@t\1\1@> /* makes cross-references for \CEE/ identifiers */
  eight_bits spec_ctrl@t\2\2@>)
@z

@x l.1066
void outer_xref();
@y
static void outer_xref(void);
@z

@x l.1069
void
outer_xref() /* extension of |C_xref| */
@y
static void
outer_xref(void) /* extension of |C_xref| */
@z

@x l.1168
            else lhs->xref=(char*)q->xlink;
@y
            else lhs->xref=(void *)q->xlink;
@z

@x l.1227
void section_check();
@y
static void section_check(name_pointer);
@z

@x l.1230
void
section_check(p)
name_pointer p; /* print anomalies in subtree |p| */
@y
static void
section_check(
name_pointer p) /* print anomalies in subtree |p| */
@z

@x l.1283
void
flush_buffer(b,per_cent,carryover)
char *b; /* outputs from |out_buf+1| to |b|,where |b<=out_ptr| */
boolean per_cent,carryover;
@y
static void
flush_buffer(@t\1\1@>
char *b, /* outputs from |out_buf+1| to |b|, where |b<=out_ptr| */
boolean per_cent,boolean carryover@t\2\2@>)
@z

@x l.1299
  if (b<out_ptr) strncpy(out_buf+1,b+1,out_ptr-b);
@y
  if (b<out_ptr) strncpy(out_buf+1,b+1,(size_t)(out_ptr-b));
@z

@x l.1312
void
finish_line() /* do this at the end of a line */
@y
static void
finish_line(void) /* do this at the end of a line */
@z

@x l.1344
void
out_str(s) /* output characters from |s| to end of string */
char *s;
@y
static void
out_str(@t\1\1@> /* output characters from |s| to end of string */
const char*s@t\2\2@>)
@z

@x l.1363
void break_out();
@y
static void break_out(void);
@z

@x l.1366
void
break_out() /* finds a way to break the output line */
@y
static void
break_out(void) /* finds a way to break the output line */
@z

@x l.1401
void
out_section(n)
sixteen_bits n;
@y
static void
out_section(
sixteen_bits n)
@z

@x l.1415
void
out_name(p,quote_xalpha)
name_pointer p;
boolean quote_xalpha;
@y
static void
out_name(
name_pointer p,
boolean quote_xalpha)
@z

@x l.1442
void
copy_limbo()
@y
static void
copy_limbo(void)
@z

@x l.1477
eight_bits
copy_TeX()
@y
static eight_bits
copy_TeX(void)
@z

@x l.1506
int copy_comment();
@y
static int copy_comment(boolean,int);
@z

@x l.1509
int copy_comment(is_long_comment,bal) /* copies \TEX/ code in comments */
boolean is_long_comment; /* is this a traditional \CEE/ comment? */
int bal; /* brace balance */
@y
static int copy_comment(@t\1\1@> /* copies \TeX\ code in comments */
boolean is_long_comment, /* is this a traditional \CEE/ comment? */
int bal@t\2\2@>) /* brace balance */
@z

@x l.1608
else if (c=='\\' && *loc!='@@')
  if (phase==2) app_tok(*(loc++))@; else loc++;
@y
else { if (c=='\\' && *loc!='@@') {
  if (phase==2) app_tok(*(loc++))@; else loc++; } }
@z

@x l.1734
void
print_cat(c) /* symbolic printout of a category */
eight_bits c;
@y
static void
print_cat(@t\1\1@> /* symbolic printout of a category */
eight_bits c@t\2\2@>)
@z

@x l.1787
  printf(cat_name[c]);
@y
  fputs(cat_name[c],stdout);
@z

@x l.2062
void
print_text(p) /* prints a token list for debugging; not used in |main| */
text_pointer p;
@y
#ifdef DEAD_CODE /* not used in |main| */
static void
print_text(@t\1\1@> /* prints a token list for debugging; not used in |main| */
text_pointer p@t\2\2@>)
@z

@x
  fflush(stdout);
}
@y
  fflush(stdout);
}
#endif /* |DEAD_CODE| */
@z

@x l.2180
@d app(a) *(tok_ptr++)=a
@d app1(a) *(tok_ptr++)=tok_flag+(int)((a)->trans-tok_start)
@y
@d app(a) *(tok_ptr++)=(token)(a)
@d app1(a) *(tok_ptr++)=(token)(tok_flag+(int)((a)->trans-tok_start))
@z

@x l.2187
void
app_str(s)
char *s;
@y
static void
app_str(
const char *s)
@z

@x l.2194
void
big_app(a)
token a;
@y
static void
big_app(
token a)
@z

@x l.2211
void
big_app1(a)
scrap_pointer a;
@y
static void
big_app1(
scrap_pointer a)
@z

@x l.2312
token_pointer
find_first_ident(p)
text_pointer p;
@y
static token_pointer
find_first_ident(
text_pointer p)
@z

@x l.2339
void
make_reserved(p) /* make the first identifier in |p->trans| like |int| */
scrap_pointer p;
@y
static void
make_reserved(@t\1\1@> /* make the first identifier in |p->trans| like |int| */
scrap_pointer p@t\2\2@>)
@z

@x l.2356
  (name_dir+(sixteen_bits)(tok_value%id_flag))->ilk=raw_int;
@y
  (name_dir+(ptrdiff_t)(tok_value%id_flag))->ilk=raw_int;
@z

@x l.2370
void
make_underlined(p)
/* underline the entry for the first identifier in |p->trans| */
scrap_pointer p;
@y
static void
make_underlined(@t\1\1@>
/* underline the entry for the first identifier in |p->trans| */
scrap_pointer p@t\2\2@>)
@z

@x l.2388
void  underline_xref();
@y
static void underline_xref(name_pointer);
@z

@x l.2391
void
underline_xref(p)
name_pointer p;
@y
static void
underline_xref(
name_pointer p)
@z

@x l.2423
  p->xref=(char*)xref_ptr;
@y
  p->xref=(void *)xref_ptr;
@z

@x l.2868
void
reduce(j,k,c,d,n)
scrap_pointer j;
eight_bits c;
short k, d, n;
@y
static void
reduce(
scrap_pointer j, short k,
eight_bits c,
short d, short n)
@z

@x l.2898
void
squash(j,k,c,d,n)
scrap_pointer j;
eight_bits c;
short k, d, n;
@y
static void
squash(
scrap_pointer j, short k,
eight_bits c,
short d, short n)
@z

@x l.2994
text_pointer
translate() /* converts a sequence of scraps */
@y
static text_pointer
translate(void) /* converts a sequence of scraps */
@z

@x l.3059
void
C_parse(spec_ctrl) /* creates scraps from \CEE/ tokens */
  eight_bits spec_ctrl;
@y
static void
C_parse(@t\1\1@> /* creates scraps from \CEE/ tokens */
  eight_bits spec_ctrl@t\2\2@>)
@z

@x l.3301
case not_eq: app_str("\\I");@+app_scrap(binop,yes_math);@+break;
@y
case non_eq: app_str("\\I");@+app_scrap(binop,yes_math);@+break;
@z

@x l.3421
void app_cur_id();
@y
void app_cur_id(boolean);
@z

@x l.3424
void
app_cur_id(scrapping)
boolean scrapping; /* are we making this into a scrap? */
@y
void
app_cur_id(@t\1\1@>
boolean scrapping@t\2\2@>) /* are we making this into a scrap? */
@z

@x l.3313
text_pointer
C_translate()
@y
static text_pointer
C_translate(void)
@z

@x l.3335
void
outer_parse() /* makes scraps from \CEE/ tokens and comments */
@y
static void
outer_parse(void) /* makes scraps from \CEE/ tokens and comments */
@z

@x l.3439
void
push_level(p) /* suspends the current level */
text_pointer p;
@y
static void
push_level(@t\1\1@> /* suspends the current level */
text_pointer p@t\2\2@>)
@z

@x l.3459
void
pop_level()
@y
static void
pop_level(void)
@z

@x l.3481
eight_bits
get_output() /* returns the next token of output */
@y
static eight_bits
get_output(void) /* returns the next token of output */
@z

@x l.3499
  return(a);
@y
  return((eight_bits)a);
@z

@x l.3523
void
output_C() /* outputs the current token list */
@y
static void
output_C(void) /* outputs the current token list */
@z

@x l.3544
void make_output();
@y
static void make_output(void);
@z

@x l.3547
void
make_output() /* outputs the equivalents of tokens */
{
  eight_bits a, /* current output byte */
@y
static void
make_output(void) /* outputs the equivalents of tokens */
{
  eight_bits a=0, /* current output byte */
@z

@x
  else if (b!='|') out(b)@;
@y
  else { if (b!='|') out(b)@;
@z

@x
  }
@y
  } }
@z

@x l.3927
    if (b=='\'' || b=='"')
      if (delim==0) delim=b;
      else if (delim==b) delim=0;
@y
    if (b=='\'' || b=='"') {
      if (delim==0) delim=b;
      else if (delim==b) delim=0; }
@z

@x l.3951
void phase_two();
@y
static void phase_two(void);
@z

@x l.3954
void
phase_two() {
@y
static void
phase_two(void) {
@z

@x l.4074
void finish_C();
@y
static void finish_C(boolean);
@z

@x l.4077
void
finish_C(visible) /* finishes a definition or a \CEE/ part */
  boolean visible; /* nonzero if we should produce \TEX/ output */
@y
static void
finish_C(@t\1\1@> /* finishes a definition or a \Cee\ part */
  boolean visible@t\2\2@>) /* nonzero if we should produce \TeX\ output */
@z

@x l.4088
    if (out_ptr>out_buf+1)
      if (*(out_ptr-1)=='\\')
@.\\6@>
@.\\7@>
@.\\Y@>
        if (*out_ptr=='6') out_ptr-=2;
        else if (*out_ptr=='7') *out_ptr='Y';
@y
    if (out_ptr>out_buf+1) {
      if (*(out_ptr-1)=='\\') {
@.\\6@>
@.\\7@>
@.\\Y@>
        if (*out_ptr=='6') out_ptr-=2;
        else if (*out_ptr=='7') *out_ptr='Y';
      }
    }
@z

@x l.4098
void footnote();
@y
static void footnote(sixteen_bits);
@z

@x l.4101
void
footnote(flag) /* outputs section cross-references */
sixteen_bits flag;
@y
static void
footnote(@t\1\1@> /* outputs section cross-references */
sixteen_bits flag@t\2\2@>)
@z

@x l.4146
void phase_three();
@y
static void phase_three(void);
@z

@x l.4146
void
phase_three() {
@y
static void
phase_three(void) {
@z

@x l.4238
    if (cur_name->xref!=(char*)xmem) {
@y
    if (cur_name->xref!=(void *)xmem) {
@z

@x l.4292
collate[0]=0;
strcpy(collate+1," \1\2\3\4\5\6\7\10\11\12\13\14\15\16\17");
/* 16 characters + 1 = 17 */
strcpy(collate+17,"\20\21\22\23\24\25\26\27\30\31\32\33\34\35\36\37");
/* 16 characters + 17 = 33 */
strcpy(collate+33,"!\42#$%&'()*+,-./:;<=>?@@[\\]^`{|}~_");
/* 32 characters + 33 = 65 */
strcpy(collate+65,"abcdefghijklmnopqrstuvwxyz0123456789");
/* (26 + 10) characters + 65 = 101 */
strcpy(collate+101,"\200\201\202\203\204\205\206\207\210\211\212\213\214\215\216\217");
/* 16 characters + 101 = 117 */
strcpy(collate+117,"\220\221\222\223\224\225\226\227\230\231\232\233\234\235\236\237");
/* 16 characters + 117 = 133 */
strcpy(collate+133,"\240\241\242\243\244\245\246\247\250\251\252\253\254\255\256\257");
/* 16 characters + 133 = 149 */
strcpy(collate+149,"\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277");
/* 16 characters + 149 = 165 */
strcpy(collate+165,"\300\301\302\303\304\305\306\307\310\311\312\313\314\315\316\317");
/* 16 characters + 165 = 181 */
strcpy(collate+181,"\320\321\322\323\324\325\326\327\330\331\332\333\334\335\336\337");
/* 16 characters + 181 = 197 */
strcpy(collate+197,"\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357");
/* 16 characters + 197 = 213 */
strcpy(collate+213,"\360\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377");
/* 16 characters + 213 = 229 */
@y
collate[0]=0;
strcpy((char *)collate+1,
  " \1\2\3\4\5\6\7\10\11\12\13\14\15\16\17");
/* 16 characters + 1 = 17 */
strcpy((char *)collate+17,
  "\20\21\22\23\24\25\26\27\30\31\32\33\34\35\36\37");
/* 16 characters + 17 = 33 */
strcpy((char *)collate+33,
  "!\42#$%&'()*+,-./:;<=>?@@[\\]^`{|}~_");
/* 32 characters + 33 = 65 */
strcpy((char *)collate+65,
  "abcdefghijklmnopqrstuvwxyz0123456789");
/* (26 + 10) characters + 65 = 101 */
strcpy((char *)collate+101,
  "\200\201\202\203\204\205\206\207\210\211\212\213\214\215\216\217");
/* 16 characters + 101 = 117 */
strcpy((char *)collate+117,
  "\220\221\222\223\224\225\226\227\230\231\232\233\234\235\236\237");
/* 16 characters + 117 = 133 */
strcpy((char *)collate+133,
  "\240\241\242\243\244\245\246\247\250\251\252\253\254\255\256\257");
/* 16 characters + 133 = 149 */
strcpy((char *)collate+149,
  "\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277");
/* 16 characters + 149 = 165 */
strcpy((char *)collate+165,
  "\300\301\302\303\304\305\306\307\310\311\312\313\314\315\316\317");
/* 16 characters + 165 = 181 */
strcpy((char *)collate+181,
  "\320\321\322\323\324\325\326\327\330\331\332\333\334\335\336\337");
/* 16 characters + 181 = 197 */
strcpy((char *)collate+197,
  "\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357");
/* 16 characters + 197 = 213 */
strcpy((char *)collate+213,
  "\360\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377");
/* 16 characters + 213 = 229 */
@z

@x l.4327
void  unbucket();
@y
static void unbucket(eight_bits);
@z

@x l.4330
void
unbucket(d) /* empties buckets having depth |d| */
eight_bits d;
@y
static void
unbucket(@t\1\1@> /* empties buckets having depth |d| */
eight_bits d@t\2\2@>)
@z

@x l.4447
void section_print();
@y
static void section_print(name_pointer);
@z

@x l.4450
void
section_print(p) /* print all section names in subtree |p| */
name_pointer p;
@y
static void
section_print(@t\1\1@> /* print all section names in subtree |p| */
name_pointer p@t\2\2@>)
@z

@x l.4468
@ Because on some systems the difference between two pointers is a |long|
rather than an |int|, we use \.{\%ld} to print these quantities.

@c
void
print_stats() {
@y
@ {\mc ANSI C} declares the difference between two pointers to be of type
|ptrdiff_t| which equals |long| on (almost) all systems instead of |int|,
so we use \.{\%ld} to print these quantities and cast them to |long|
explicitly.

@c
void
print_stats(void) {
@z

@x l.4496
@** Index.
@y
@** Function declarations.  Here are declarations---conforming to
{\mc ANSI~C}---of all functions in this code, as far as they are
not already in |"common.h"|.  These are private to \.{CWEAVE}.

@<Predecl...@>=
static eight_bits copy_TeX(void);@/
static eight_bits get_output(void);@/
static text_pointer C_translate(void);@/
static text_pointer translate(void);@/
static token_pointer find_first_ident(text_pointer);@/
static unsigned skip_TeX(void);@/
static void app_str(const char *);@/
static void big_app(token);@/
static void big_app1(scrap_pointer);@/
static void copy_limbo(void);@/
static void C_parse(eight_bits);@/
static void finish_line(void);@/
static void flush_buffer(char *,boolean,boolean);@/
static void make_reserved(scrap_pointer);@/
static void make_underlined(scrap_pointer);@/
static void new_section_xref(name_pointer);@/
static void new_xref(name_pointer);@/
static void outer_parse(void);@/
static void output_C(void);@/
static void out_name(name_pointer,boolean);@/
static void out_section(sixteen_bits);@/
static void out_str(const char *);@/
static void pop_level(void);@/
static void print_cat(eight_bits);@/
#ifdef DEAD_CODE
static void print_text(text_pointer p);@/
#endif
static void push_level(text_pointer);@/
static void reduce(scrap_pointer,short,eight_bits,short,short);@/
static void set_file_flag(name_pointer);@/
static void skip_limbo(void);@/
static void squash(scrap_pointer,short,eight_bits,short,short);@/

@** Index.
@z
