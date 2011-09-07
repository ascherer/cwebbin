Changes for COMMON.W by Andreas Scherer, May 13, 1995.

This set of changes converts the COMMON.W module into ANSI-C and C++ code.
All functions are both declared and defined in prototypical form, while
several functions are declared `static' instead of `extern'.  At several
places additional casts are introduced and `char *' is replaced by
`void *', the default pointer type in ANSI-C.

This is a standalone change file, although COMM-PATCH.CH should be applied
as well to bump the revision information.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

@x l.89
void
common_init()
@y
void common_init(void)
@z

@x l.172
int input_ln(fp) /* copies a line into |buffer| or returns 0 */
FILE *fp; /* what file to read from */
@y
static int input_ln(@t\1\1@> /* copies a line into |buffer| or returns 0 */
  FILE *fp@t\2\2@>) /* what file to read from */
@z

@x l.236
@d lines_dont_match (change_limit-change_buffer != limit-buffer ||
  strncmp(buffer, change_buffer, limit-buffer))
@y
@d lines_dont_match (change_limit-change_buffer != limit-buffer || @|
  strncmp(buffer, change_buffer, (size_t)(limit-buffer)))
@z

@x l.251
void
prime_the_change_buffer()
@y
static void prime_the_change_buffer(void)
@z

@x l.293
  change_limit=change_buffer+(limit-buffer);
  strncpy(change_buffer,buffer,limit-buffer+1);
@y
  change_limit=change_buffer+(ptrdiff_t)(limit-buffer);
  strncpy(change_buffer,buffer,(size_t)(limit-buffer+1));
@z

@x l.320
void
check_change() /* switches to |change_file| if the buffers match */
@y
static void check_change(void)
  /* switches to |change_file| if the buffers match */
@z

@x l.378
void
reset_input()
@y
void reset_input(void)
@z

@x l.418
typedef unsigned short sixteen_bits;
@y
typedef unsigned char eight_bits;
typedef unsigned short sixteen_bits;
@z

@x l.426
int get_line() /* inputs the next line */
@y
boolean get_line(void) /* inputs the next line */
@z

@x l.470
#include <stdlib.h> /* declaration of |getenv| and |exit| */
@y
#include <stddef.h> /* type definition of |ptrdiff_t| */
#include <stdlib.h> /* declaration of |getenv| and |exit| */
@z

@x l.563
void
check_complete(){
  if (change_limit!=change_buffer) { /* |changing| is 0 */
    strncpy(buffer,change_buffer,change_limit-change_buffer+1);
    limit=buffer+(int)(change_limit-change_buffer);
@y
void check_complete(void) {
  if (change_limit!=change_buffer) { /* |changing| is 0 */
    strncpy(buffer,change_buffer,(size_t)(change_limit-change_buffer+1));
    limit=buffer+(ptrdiff_t)(change_limit-change_buffer);
@z

@x l.602
@d length(c) (c+1)->byte_start-(c)->byte_start /* the length of a name */
@y
@d length(c) (size_t)((c+1)->byte_start-(c)->byte_start) /* the length of a name */
@z

@x l.644
extern int names_match();
@y
extern int names_match(name_pointer,char *,size_t,eight_bits);@/
@z

@x l.654
name_pointer
id_lookup(first,last,t) /* looks up a string in the identifier table */
char *first; /* first character of string */
char *last; /* last character of string plus one */
char t; /* the |ilk|; used by \.{CWEAVE} only */
@y
name_pointer id_lookup(@t\1\1@> /* looks up a string in the identifier table */
  char *first, /* first character of string */
  char *last, /* last character of string plus one */
  char t@t\2\2@>) /* the |ilk|; used by \.{CWEAVE} only */
@z

@x l.665
  l=last-first; /* compute the length */
@y
  l=(int)(last-first); /* compute the length */
@z

@x l.697
void init_p();
@y
extern void init_p(name_pointer,eight_bits);@/
@z

@x l.758
void
print_section_name(p)
name_pointer p;
@y
void print_section_name(name_pointer p)
@z

@x l.767
      term_write(s,ss-s); p=q->link; q=p;
    } else {
      term_write(s,ss+1-s); p=name_dir; q=NULL;
@y
      term_write(s,(size_t)(ss-s)); p=q->link; q=p;
    } else {
      term_write(s,(size_t)(ss+1-s)); p=name_dir; q=NULL;
@z

@x l.777
void
sprint_section_name(dest,p)
  char*dest;
  name_pointer p;
@y
void sprint_section_name(char *dest,name_pointer p)
@z

@x l.791
    strncpy(dest,s,ss-s), dest+=ss-s;
@y
    strncpy(dest,s,(size_t)(ss-s)), dest+=ss-s;
@z

@x l.798
void
print_prefix_name(p)
name_pointer p;
@y
void print_prefix_name(name_pointer p)
@z

@x l.819
int web_strcmp(j,j_len,k,k_len) /* fuller comparison than |strcmp| */
  char *j, *k; /* beginning of first and second strings */
  int j_len, k_len; /* length of strings */
@y
static int web_strcmp(@t\1\1@> /* fuller comparison than |strcmp| */
  char *j, /* beginning of first string */
  int j_len, /* length of first string */
  char *k, /* beginning of second string */
  int k_len@t\2\2@>) /* length of second string */
@z

@x l.846
extern void init_node();
@y
extern void init_node(name_pointer);@/
@z

@x l.849
name_pointer
add_section_name(par,c,first,last,ispref) /* install a new node in the tree */
name_pointer par; /* parent of new node */
int c; /* right or left? */
char *first; /* first character of section name */
char *last; /* last character of section name, plus one */
int ispref; /* are we adding a prefix or a full name? */
@y
name_pointer add_section_name(@t\1\1@> /* install a new node in the tree */
  name_pointer par, /* parent of new node */
  int c, /* right or left? */
  char *first, /* first character of section name */
  char *last, /* last character of section name, plus one */
  int ispref@t\2\2@>) /* are we adding a prefix or a full name? */
@z

@x l.859
  int name_len=last-first+ispref; /* length of section name */
@y
  int name_len=(int)(last-first)+ispref; /* length of section name */
@z

@x l.878
void
extend_section_name(p,first,last,ispref)
name_pointer p; /* name to be extended */
char *first; /* beginning of extension text */
char *last; /* one beyond end of extension text */
int ispref; /* are we adding a prefix or a full name? */
@y
void extend_section_name(@t\1\1@>
  name_pointer p, /* name to be extended */
  char *first, /* beginning of extension text */
  char *last, /* one beyond end of extension text */
  int ispref@t\2\2@>) /* are we adding a prefix or a full name? */
@z

@x l.887
  int name_len=last-first+ispref;
@y
  int name_len=(int)(last-first)+ispref;
@z

@x l.906
name_pointer
section_lookup(first,last,ispref) /* find or install section name in tree */
char *first, *last; /* first and last characters of new name */
int ispref; /* is the new name a prefix or a full name? */
@y
name_pointer section_lookup(@t\1\1@> /* find or install section name in tree */
  char *first,char *last, /* first and last characters of new name */
  int ispref@t\2\2@>) /* is the new name a prefix or a full name? */
@z

@x l.917
  int name_len=last-first+1;
@y
  int name_len=(int)(last-first)+1;
@z

@x l.1011
int section_name_cmp();
@y
static int section_name_cmp(char **,int,name_pointer);@/
@z

@x l.1014
int section_name_cmp(pfirst,len,r)
char **pfirst; /* pointer to beginning of comparison string */
int len; /* length of string */
name_pointer r; /* section name being compared */
@y
static int section_name_cmp(@t\1\1@>
  char **pfirst, /* pointer to beginning of comparison string */
  int len, /* length of string */
  name_pointer r@t\2\2@>) /* section name being compared */
@z

@x l.1031
          *pfirst=first+(ss-s);
@y
          *pfirst=first+(ptrdiff_t)(ss-s);
@z

@x l.1038
      if (q!=name_dir) {len -= ss-s; s=q->byte_start; r=q; continue;}
@y
      if (q!=name_dir) {len -= (int)(ss-s); s=q->byte_start; r=q; continue;}
@z

@x l.1053
|equiv_or_xref| as a pointer to a |char|.

@<More elements of |name...@>=
char *equiv_or_xref; /* info corresponding to names */
@y
|equiv_or_xref| as a pointer to |void|.

@<More elements of |name...@>=
void *equiv_or_xref; /* info corresponding to names */
@z

@x l.1086
void  err_print();
@y
extern void err_print(char *);@/
@z

@x l.1089
void
err_print(s) /* prints `\..' and location of error message */
char *s;
@y
void err_print(char *s) /* prints `\..' and location of error message */
@z

@x l.1134
int wrap_up();
extern void print_stats();
@y
extern int wrap_up(void);@/
extern void print_stats(void);@/
@z

@x l.1144
int wrap_up() {
@y
int wrap_up(void) {
@z

@x l.1167
void fatal(), overflow();
@y
extern void fatal(char *,char *);
extern void overflow(char *);
@z

@x l.1172
@c void
fatal(s,t)
  char *s,*t;
@y
@c void fatal(char *s,char *t)
@z

@x l.1183
@c void
overflow(t)
  char *t;
@y
@c void overflow(char *t)
@z

@x l.1245
void scan_args();
@y
static void scan_args(void);@/
@z

@x l.1248
void
scan_args()
@y
static void scan_args(void)
@z

@x l.1403
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

@<Include...@>=
#include <string.h>

@** Function declarations. Here are declarations, conforming to {\mc
ANSI~C}, of all functions in this code that appear in |"common.h"| and
thus should agree with \.{CTANGLE} and \.{CWEAVE}.

@<Predecl...@>=
boolean get_line(void);@/
name_pointer add_section_name(name_pointer,int,char *,char *,int);@/
name_pointer id_lookup(char *,char *,char);@/
name_pointer section_lookup(char *,char *,int);
void check_complete(void);@/
void common_init(void);@/
void extend_section_name(name_pointer,char *,char *,int);@/
void print_prefix_name(name_pointer);@/
void print_section_name(name_pointer);@/
void reset_input(void);@/
void sprint_section_name(char *,name_pointer);

@ The following functions are private to |"common.w"|.

@<Predecl...@>=
static boolean set_path(char *,char *);@/
static int input_ln(FILE *);@/
static int web_strcmp(char *,int,char *,int);@/
static void check_change(void);@/
static void prime_the_change_buffer(void);
@z
