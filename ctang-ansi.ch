This set of changes converts the CTANGLE.W module into ANSI-C and C++ code.
All functions are both declared and defined in prototypical form, while
several functions are declared `static' instead of `extern'.  At several
places additional casts are introduced and `char *' is replaced by
`void *', the default pointer type in ANSI-C.

This is a standalone change file, although CTANG-PATCH.CH should be applied
as well to bump the revision information.

For a complete history of the changes made to CTANGLE.W see CTANG-PATCH.CH.

@x l.49
@s not_eq normal @q unreserve a C++ keyword @>
@y
@ The next few sections contain stuff from the file |"common.w"| that must
be included in both |"ctangle.w"| and |"cweave.w"|. It appears in
file |"comm-foo.h"|, which needs to be updated when |"common.w"| or any of
the added changefiles change.

@i comm-foo.h
@z

@x l.69
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

@x l.89
int main (ac, av)
int ac;
char **av;
@y
int main (
int ac,
char **av)
@z

@x l.100
  if (show_banner) printf(banner); /* print a ``banner line'' */
@y
  if (show_banner) fputs(banner,stdout); /* print a ``banner line'' */
@z

@x l.124
@ The next few sections contain stuff from the file |"common.w"| that must
be included in both |"ctangle.w"| and |"cweave.w"|. It appears in
file |"common.h"|, which needs to be updated when |"common.w"| changes.

@i common.h
@y
@z

@x l.175
name_dir->equiv=(char *)text_info; /* the undefined section has no replacement text */
@y
name_dir->equiv=(void *)text_info; /* the undefined section has no replacement text */
@z

@x l.181
int names_match(p,first,l)
name_pointer p; /* points to the proposed match */
char *first; /* position of first character of string */
int l; /* length of identifier */
@y
int names_match(@t\1\1@>
name_pointer p, /* points to the proposed match */
const char *first, /* position of first character of string */
size_t l, /* length of identifier */
eight_bits@t\2\2@>) /* not used by \.{TANGLE} */
@z

@x l.196
void
init_node(node)
name_pointer node;
@y
void
init_node(
name_pointer node)
@z

@x l.200
    node->equiv=(char *)text_info;
@y
    node->equiv=(void *)text_info;
@z

@x l.202
void
init_p() {}
@y
void
init_p(name_pointer,eight_bits) {}
@z

@x l.258
void
store_two_bytes(x)
sixteen_bits x;
@y
static void
store_two_bytes(
sixteen_bits x)
@z

@x l.334
void
push_level(p) /* suspends the current level */
name_pointer p;
@y
static void
push_level(@t\1\1@> /* suspends the current level */
name_pointer p@t\2\2@>)
@z

@x l.353
void
pop_level(flag) /* do this when |cur_byte| reaches |cur_end| */
int flag; /* |flag==0| means we are in |output_defs| */
@y
static void
pop_level(@t\1\1@> /* do this when |cur_byte| reaches |cur_end| */
int flag@t\2\2@>) /* |flag==0| means we are in |output_defs| */
@z

@x l.389
void
get_output() /* sends next token to |out_char| */
@y
static void
get_output(void) /* sends next token to |out_char| */
@z

@x l.423
  if ((a+name_dir)->equiv!=(char *)text_info) push_level(a+name_dir);
@y
  if ((a+name_dir)->equiv!=(void *)text_info) push_level(a+name_dir);
@z

@x l.479
void
flush_buffer() /* writes one line to output file */
@y
static void
flush_buffer(void) /* writes one line to output file */
@z

@x l.531
void phase_two();
@y
static void phase_two(void);
@z

@x l.534
void
phase_two () {
@y
static void
phase_two (void) {
@z

@x l.600
void output_defs();
@y
static void output_defs(void);
@z

@x l.603
void
output_defs()
@y
static void
output_defs(void)
@z

@x l.646
static void out_char();
@y
static void out_char(eight_bits);
@z

@x l.649
static void
out_char(cur_char)
eight_bits cur_char;
@y
static void
out_char(
eight_bits cur_char)
@z

@x l.690
case not_eq: C_putc('!'); C_putc('='); out_state=normal; break;
@y
case non_eq: C_putc('!'); C_putc('='); out_state=normal; break;
@z

@x l.807
eight_bits
skip_ahead() /* skip to next control code */
@y
static eight_bits
skip_ahead(void) /* skip to next control code */
@z

@x l.842
int skip_comment(is_long_comment) /* skips over comments */
boolean is_long_comment;
@y
static int skip_comment(@t\1\1@> /* skips over comments */
boolean is_long_comment@t\2\2@>)
@z

@x l.893
eight_bits
get_next() /* produces the next input token */
@y
static eight_bits
get_next(void) /* produces the next input token */
@z

@x l.954
    else if (*loc=='>') if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); break;
@y
    else { if (*loc=='>') { if (*(loc+1)=='*') {loc++; compress(minus_gt_ast);}
                        else compress(minus_gt); } } break;
@z

@x l.969
  case '!': if (*loc=='=') compress(not_eq); break;
@y
  case '!': if (*loc=='=') compress(non_eq); break;
@z

@x l.1196
void
scan_repl(t) /* creates a replacement text */
eight_bits t;
@y
static void
scan_repl(@t\1\1@> /* creates a replacement text */
eight_bits t@t\2\2@>)
@z

@x l.1349
void
scan_section()
@y
static void
scan_section(void)
@z

@x l.1437
else if (p->equiv==(char *)text_info) p->equiv=(char *)cur_text;
@y
else if (p->equiv==(void *)text_info) p->equiv=(void *)cur_text;
@z

@x l.1449
void phase_one();
@y
static void phase_one(void);
@z

@x l.1452
void
phase_one() {
@y
static void
phase_one(void) {
@z

@x l.1467
void skip_limbo();
@y
static void skip_limbo(void);
@z

@x l.1470
void
skip_limbo()
@y
static void
skip_limbo(void)
@z

@x l.1516
      strncpy(translit[i-0200],beg,loc-beg);
@y
      strncpy(translit[i-0200],beg,(size_t)(loc-beg));
@z

@x l.1521
@ Because on some systems the difference between two pointers is a |long|
but not an |int|, we use \.{\%ld} to print these quantities.

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

@x l.1538
@** Index.
@y
@** Function declarations.  Here are declarations---conforming to
{\mc ANSI~C}---of all functions in this code, as far as they are
not already in |"common.h"|.  These are private to \.{CTANGLE}.

@<Predecl...@>=
static eight_bits get_next(void);@/
static eight_bits skip_ahead(void);@/
static int skip_comment(boolean);@/
static void flush_buffer(void);@/
static void get_output(void);@/
static void pop_level(int);@/
static void push_level(name_pointer);@/
static void scan_repl(eight_bits);@/
static void scan_section(void);@/
static void store_two_bytes(sixteen_bits);

@** Index.
@z
