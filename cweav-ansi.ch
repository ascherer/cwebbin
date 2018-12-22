Changes for CWEAVE.W by Andreas Scherer, November 6, 2018.

This set of changes converts the CWEAVE.W module into ANSI-C and C++ code.
All functions are both declared and defined in prototypical form, while
several functions are declared `static' instead of `extern'.  At several
places additional casts are introduced and `char *' is replaced by
`void *', the default pointer type in ANSI-C.

This is a standalone change file, although CWEAV-PATCH.CH should be applied
as well to bump the revision information.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

Material in limbo.

@x l.54
@s not_eq normal @q unreserve a C++ keyword @>
@y
@z

Section 2.

@x l.78
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

Section 3.

@x l.99
int main (ac, av)
int ac; /* argument count */
char **av; /* argument values */
@y
int main (@t\1\1@>
int ac, /* argument count */
char **av@t\2\2@>) /* argument values */
@z

@x l.108
  if (show_banner) printf(banner); /* print a ``banner line'' */
@y
  if (show_banner) puts(banner); /* print a ``banner line'' */
@z

Sections 5--15.

@x l.144
@i common.h
@y
@i comm-foo.h
@z

Section 20.

@x l.255
xref_ptr=xmem; name_dir->xref=(char*)xmem; xref_switch=0; section_xref_switch=0;
@y
xref_ptr=xmem; init_node(name_dir); xref_switch=0; section_xref_switch=0;
@z

Section 21.

@x l.276
void
new_xref(p)
name_pointer p;
@y
static void
new_xref(
name_pointer p)
@z

@x l.292
  append_xref(m); xref_ptr->xlink=q; p->xref=(char*)xref_ptr;
@y
  append_xref(m); xref_ptr->xlink=q; update_node(p);
@z

Section 22.

@x l.307
void
new_section_xref(p)
name_pointer p;
@y
static void
new_section_xref(
name_pointer p)
@z

@x l.319
  if (r==xmem) p->xref=(char*)xref_ptr;
@y
  if (r==xmem) update_node(p);
@z

Section 23.

@x l.327
void
set_file_flag(p)
name_pointer p;
@y
static void
set_file_flag(
name_pointer p)
@z

@x l.336
  p->xref = (char *)xref_ptr;
@y
  update_node(p);
@z

Section 27.

@x l.372
int names_match(p,first,l,t)
name_pointer p; /* points to the proposed match */
char *first; /* position of first character of string */
int l; /* length of identifier */
eight_bits t; /* desired ilk */
@y
boolean names_match(@t\1\1@>
name_pointer p, /* points to the proposed match */
const char *first, /* position of first character of string */
size_t l, /* length of identifier */
eight_bits t@t\2\2@>) /* desired |ilk| */
@z

Section 27.

@x l.383
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

@x l.388
  p->ilk=t; p->xref=(char*)xmem;
@y
  p->ilk=t; init_node(p);
@z

@x l.391
void
init_node(p)
name_pointer p;
@y
void
init_node(
name_pointer p)
@z

@x l.395
  p->xref=(char*)xmem;
}
@y
  p->xref=(void *)xmem;
}

static void
update_node(
name_pointer p)
{
  p->xref=(void *)xref_ptr;
}
@z

Section 34.

@x l.601
void   skip_limbo();
@y
static void skip_limbo(void);@/
@z

Section 35.

@x l.604
void
skip_limbo() {
@y
static void
skip_limbo(void) {
@z

Section 36.

@x l.626
unsigned
skip_TeX() /* skip past pure \TEX/ code */
@y
static eight_bits
skip_TeX(void) /* skip past pure \TEX/ code */
@z

Section 39.

@x l.697
eight_bits get_next();
@y
static eight_bits get_next(void);@/
@z

Section 40.

@x l.700
eight_bits
get_next() /* produces the next input token */
{@+eight_bits c; /* the current character */
@y
static eight_bits
get_next(void) /* produces the next input token */
{
  eight_bits c; /* the current character */
@z

Section 46.

@x l.781
    else if (*loc=='>') if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); break;
@y
    else { if (*loc=='>') { if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); } } break;
@z

@x l.796
  case '!': if (*loc=='=') compress(not_eq); break;
@y
  case '!': if (*loc=='=') compress(non_eq); break;
@z

Section 47.

@x l.801
  while (isalpha(*++loc) || isdigit(*loc) || isxalpha(*loc) || ishigh(*loc));
@y
  while (isalpha((eight_bits)*++loc) || isdigit((eight_bits)*loc) @|
      || isxalpha((eight_bits)*loc) || ishigh((eight_bits)*loc));
@z

Section 48.

@x l.836
    *id_loc++='$'; *id_loc++=toupper(*loc); loc++;
@y
    *id_loc++='$'; *id_loc++=toupper((eight_bits)*loc); loc++;
@z

Section 49.

@x l.871
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

Section 50.

@x l.
    case xref_roman: case xref_wildcard: case xref_typewriter:
    case noop: case TeX_string: c=ccode[c]; skip_restricted(); return(c);
@y
    case xref_roman: case xref_wildcard: case xref_typewriter: case noop:
    case TeX_string: c=ccode[(eight_bits)c]; skip_restricted(); return(c);
@z

Section 55.

@x l.972
void skip_restricted();
@y
void skip_restricted(void);@/
@z

Section 56.

@x l.975
void
skip_restricted()
@y
void
skip_restricted(void)
@z

Section 59.

@x l.1025
void phase_one();
@y
static void phase_one(void);@/
@z

Section 60.

@x l.1028
void
phase_one() {
@y
static void
phase_one(void) {
@z

Section 62.

@x l.1077
void C_xref();
@y
static void C_xref(eight_bits);@/
@z

Section 63.

@x l.1080
void
C_xref( spec_ctrl ) /* makes cross-references for \CEE/ identifiers */
  eight_bits spec_ctrl;
@y
static void
C_xref(@t\1\1@> /* makes cross-references for \CEE/ identifiers */
  eight_bits spec_ctrl@t\2\2@>)
@z

Section 64.

@x l.1105
void outer_xref();
@y
static void outer_xref(void);@/
@z

Section 65.

@x l.1108
void
outer_xref() /* extension of |C_xref| */
@y
static void
outer_xref(void) /* extension of |C_xref| */
@z

Section 70.

@x l.1208
            else lhs->xref=(char*)q->xlink;
@y
            else lhs->xref=(void *)q->xlink;
@z

Section 74.

@x l.1267
void section_check();
@y
static void section_check(name_pointer);@/
@z

Section 75.

@x l.1270
void
section_check(p)
name_pointer p; /* print anomalies in subtree |p| */
@y
static void
section_check(
name_pointer p) /* print anomalies in subtree |p| */
@z

Section 78.

@x l.1323 and l.212 of CWEAV-PATCH.CH
void
flush_buffer(b,per_cent,carryover)
char *b; /* outputs from |out_buf+1| to |b|, where |b<=out_ptr| */
boolean per_cent,carryover;
@y
static void
flush_buffer(@t\1\1@>
char *b, /* outputs from |out_buf+1| to |b|, where |b<=out_ptr| */
boolean per_cent,boolean carryover@t\2\2@>)
@z

@x l.1339
  if (b<out_ptr) strncpy(out_buf+1,b+1,out_ptr-b);
@y
  if (b<out_ptr) strncpy(out_buf+1,b+1,(size_t)(out_ptr-b));
@z

Section 79.

@x l.1352
void
finish_line() /* do this at the end of a line */
@y
static void
finish_line(void) /* do this at the end of a line */
@z

Section 81.

@x l.1384
void
out_str(s) /* output characters from |s| to end of string */
char *s;
@y
static void
out_str(@t\1\1@> /* output characters from |s| to end of string */
const char*s@t\2\2@>)
@z

Section 83.

@x l.1403
void break_out();
@y
static void break_out(void);@/
@z

Section 84.

@x l.1406
void
break_out() /* finds a way to break the output line */
@y
static void
break_out(void) /* finds a way to break the output line */
@z

Section 86.

@x l.1441
void
out_section(n)
sixteen_bits n;
@y
static void
out_section(
sixteen_bits n)
@z

Section 87.

@x l.1455
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

Section 88.

@x l.1485
void
copy_limbo()
@y
static void
copy_limbo(void)
@z

Section 90.

@x l.1520
eight_bits
copy_TeX()
@y
static eight_bits
copy_TeX(void)
@z

Section 91.

@x l.1549
int copy_comment();
@y
static int copy_comment(boolean,int);@/
@z

Section 92.

@x l.1552
int copy_comment(is_long_comment,bal) /* copies \TEX/ code in comments */
boolean is_long_comment; /* is this a traditional \CEE/ comment? */
int bal; /* brace balance */
@y
static int copy_comment(@t\1\1@> /* copies \TeX\ code in comments */
boolean is_long_comment, /* is this a traditional \CEE/ comment? */
int bal@t\2\2@>) /* brace balance */
@z

Section 94.

@x l.1608
else if (c=='\\' && *loc!='@@')
  if (phase==2) app_tok(*(loc++))@; else loc++;
@y
else { if (c=='\\' && *loc!='@@') {
  if (phase==2) app_tok(*(loc++))@; else loc++; } }
@z

Section 99.

@x l.1784
void
print_cat(c) /* symbolic printout of a category */
eight_bits c;
@y
static void
print_cat(@t\1\1@> /* symbolic printout of a category */
eight_bits c@t\2\2@>)
@z

@x l.1788
  printf(cat_name[c]);
@y
  fputs(cat_name[c],stdout);
@z

Section 106.

@x l.2139
void
print_text(p) /* prints a token list for debugging; not used in |main| */
text_pointer p;
@y
#ifdef DEAD_CODE /* not used in |main| */
static void
print_text(@t\1\1@> /* prints a token list for debugging; not used in |main| */
text_pointer p@t\2\2@>)
@z

@x l.2160
  fflush(stdout);
}
@y
  update_terminal;
}
#endif /* |DEAD_CODE| */
@z

Section 108.

@x l.2257
@d app(a) *(tok_ptr++)=a
@d app1(a) *(tok_ptr++)=tok_flag+(int)((a)->trans-tok_start)
@y
@d app(a) *(tok_ptr++)=(token)(a)
@d app1(a) *(tok_ptr++)=(token)(tok_flag+(int)((a)->trans-tok_start))
@z

Section 109.

@x l.2264
void
app_str(s)
char *s;
@y
static void
app_str(
const char *s)
@z

@x l.2271
void
big_app(a)
token a;
@y
static void
big_app(
token a)
@z

@x l.2288
void
big_app1(a)
scrap_pointer a;
@y
static void
big_app1(
scrap_pointer a)
@z

Section 111.

@x l.2415
token_pointer
find_first_ident(p)
text_pointer p;
@y
static token_pointer
find_first_ident(
text_pointer p)
@z

Section 112.

@x l.2447
void
make_reserved(p) /* make the first identifier in |p->trans| like |int| */
scrap_pointer p;
@y
static void
make_reserved(@t\1\1@> /* make the first identifier in |p->trans| like |int| */
scrap_pointer p@t\2\2@>)
@z

Section 113.

@x l.2478
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

Section 11⅘.

@x l.2496
void  underline_xref();
@y
static void underline_xref(name_pointer);@/
@z

Section 115.

@x l.2499
void
underline_xref(p)
name_pointer p;
@y
static void
underline_xref(
name_pointer p)
@z

Section 116.

@x l.2531
  p->xref=(char*)xref_ptr;
@y
  update_node(p);
@z

Section 164.

@x l.3004
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

Section 165.

@x l.3030
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

Section 169.

@x l.3097 -- rename local var, not to shadow param
{ scrap_pointer k; /* pointer into |scrap_info| */
  if (tracing==2) {
    printf("\n%d:",n);
    for (k=scrap_base; k<=lo_ptr; k++) {
      if (k==pp) putxchar('*'); else putxchar(' ');
      if (k->mathness %4 ==  yes_math) putchar('+');
      else if (k->mathness %4 ==  no_math) putchar('-');
      print_cat(k->cat);
      if (k->mathness /4 ==  yes_math) putchar('+');
      else if (k->mathness /4 ==  no_math) putchar('-');
@y
{ scrap_pointer k_l; /* pointer into |scrap_info| */
  if (tracing==2) {
    printf("\n%d:",n);
    for (k_l=scrap_base; k_l<=lo_ptr; k_l++) {
      if (k_l==pp) putxchar('*'); else putxchar(' ');
      if (k_l->mathness %4 ==  yes_math) putchar('+');
      else if (k_l->mathness %4 ==  no_math) putchar('-');
      print_cat(k_l->cat);
      if (k_l->mathness /4 ==  yes_math) putchar('+');
      else if (k_l->mathness /4 ==  no_math) putchar('-');
@z

Section 170.

@x l.3126
text_pointer
translate() /* converts a sequence of scraps */
@y
static text_pointer
translate(void) /* converts a sequence of scraps */
@z

Section 174.

@x l.3191
void
C_parse(spec_ctrl) /* creates scraps from \CEE/ tokens */
  eight_bits spec_ctrl;
@y
static void
C_parse(@t\1\1@> /* creates scraps from \CEE/ tokens */
  eight_bits spec_ctrl@t\2\2@>)
@z

Section 178.

@x l.3302
case not_eq: app_str("\\I");@+app_scrap(binop,yes_math);@+break;
@y
case non_eq: app_str("\\I");@+app_scrap(binop,yes_math);@+break;
@z

Section 181.

@x l.3422
void app_cur_id();
@y
void app_cur_id(boolean);@/
@z

Section 182.

@x l.3425
void
app_cur_id(scrapping)
boolean scrapping; /* are we making this into a scrap? */
@y
void
app_cur_id(@t\1\1@>
boolean scrapping@t\2\2@>) /* are we making this into a scrap? */
@z

Section 183.

@x l.3450
text_pointer
C_translate()
@y
static text_pointer
C_translate(void)
@z

Section 184.

@x l.3480
void
outer_parse() /* makes scraps from \CEE/ tokens and comments */
@y
static void
outer_parse(void) /* makes scraps from \CEE/ tokens and comments */
@z

Section 189.

@x l.3586
void
push_level(p) /* suspends the current level */
text_pointer p;
@y
static void
push_level(@t\1\1@> /* suspends the current level */
text_pointer p@t\2\2@>)
@z

Section 190.

@x l.3606
void
pop_level()
@y
static void
pop_level(void)
@z

Section 192.

@x l.3628
eight_bits
get_output() /* returns the next token of output */
@y
static eight_bits
get_output(void) /* returns the next token of output */
@z

@x l.3646
  return(a);
@y
  return((eight_bits)a);
@z

Section 193.

@x l.3665
void
output_C() /* outputs the current token list */
@y
static void
output_C(void) /* outputs the current token list */
@z

Section 194.

@x l.3688
void make_output();
@y
static void make_output(void);@/
@z

Section 195.

@x l.3691
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

Section 201.

@x l.3894
  else if (b!='|') out(b)@;
@y
  else { if (b!='|') out(b)@;
@z

@x l.3900
  }
@y
  } }
@z

Section 203.

@x l.3928
    if (b=='\'' || b=='"')
      if (delim==0) delim=b;
      else if (delim==b) delim=0;
@y
    if (b=='\'' || b=='"') {
      if (delim==0) delim=b;
      else if (delim==b) delim=0; }
@z

Section 205.

@x l.3952
void phase_two();
@y
static void phase_two(void);@/
@z

Section 206.

@x l.3955
void
phase_two() {
@y
static void
phase_two(void) {
@z

Section 212.

@x l.4075
void finish_C();
@y
static void finish_C(boolean);@/
@z

Section 213.

@x l.4078
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

Section 221.

@x l.4246
void footnote();
@y
static void footnote(sixteen_bits);@/
@z

Section 222.

@x l.4249
void
footnote(flag) /* outputs section cross-references */
sixteen_bits flag;
@y
static void
footnote(@t\1\1@> /* outputs section cross-references */
sixteen_bits flag@t\2\2@>)
@z

Section 225.

@x l.4295
void phase_three();
@y
static void phase_three(void);@/
@z

Section 226.

@x l.4298
void
phase_three() {
@y
static void
phase_three(void) {
@z

Section 230.

@x l.4386
    if (cur_name->xref!=(char*)xmem) {
@y
    if (cur_name->xref!=(void *)xmem) {
@z

Section 236.

@x l.4440
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

Section 237.

@x l.4475
void  unbucket();
@y
static void unbucket(eight_bits);@/
@z

Section 238.

@x l.4478
void
unbucket(d) /* empties buckets having depth |d| */
eight_bits d;
@y
static void
unbucket(@t\1\1@> /* empties buckets having depth |d| */
eight_bits d@t\2\2@>)
@z

Section 246.

@x l.4595
void section_print();
@y
static void section_print(name_pointer);@/
@z

Section 247.

@x l.4598
void
section_print(p) /* print all section names in subtree |p| */
name_pointer p;
@y
static void
section_print(@t\1\1@> /* print all section names in subtree |p| */
name_pointer p@t\2\2@>)
@z

Section 249.

@x l.4620
void
print_stats() {
@y
void
print_stats(void) {
@z

Additional material.

@x l.4644
@** Index.
@y
@* Function declarations.  Here are declarations---conforming to
{\mc ANSI~C}---of all functions in this code, as far as they are
not already in |"common.h"|.  These are private to \.{CWEAVE}.

@<Predecl...@>=
static eight_bits copy_TeX(void);@/
static eight_bits get_output(void);@/
static eight_bits skip_TeX(void);@/
static text_pointer C_translate(void);@/
static text_pointer translate(void);@/
static token_pointer find_first_ident(text_pointer);@/
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
static void update_node(name_pointer p);@/

@** Index.
@z
