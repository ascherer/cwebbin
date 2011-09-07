Changes for COMMON.W by Andreas Scherer, May 7, 1995.

This set of changes provides support for installing CWEB on MS/DOS systems
with Borland C++ 3.1.  Arrays larger than 64 KB are allocated with a
system-dependent routine `farcalloc'.  For this, several pointer variables
have to be declared as `huge'.  Also a mysterious bug in a multiple
`return' situation is fixed.  Care has been taken to avoid conflicts with
other operating systems which are not restricted to the limitations of DOS.
(DOS isn't restricted to the 64 KB limit either, or else this full sized
patch would not be possible.  But instead of `farcalloc' a `non-ANSI' sized
`malloc' would be much more convenient.)  For other MS/DOS compilers than
Borland C++ 3.1 you'll have to replace this file by other changes.

This change file requires COMM-PATCH.CH, COMM-ANSI.CH, COMM-EXTENSIONS.CH,
COMM-MEMORY.CH, COMM-TRANSLATIONS.CH to be applied as well.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

@x l.58
@<Include files@>@/
@y
@<Include files@>@/
@<Macro definitions@>@/
@z

@x l.589
  char *byte_start; /* beginning of the name in |byte_mem| */
@y
  char HUGE *byte_start; /* beginning of the name in |byte_mem| */
@z

@x l.592
typedef name_info *name_pointer; /* pointer into array of |name_info|s */
char *byte_mem; /* characters of names */
char *byte_mem_end; /* end of |byte_mem| */
@y
typedef name_info HUGE *name_pointer; /* pointer into array of |name_info|s */
char HUGE *byte_mem; /* characters of names */
char HUGE *byte_mem_end; /* end of |byte_mem| */
@z

@x l.612
char *byte_ptr; /* first unused position in |byte_mem| */
@y
char HUGE *byte_ptr; /* first unused position in |byte_mem| */
@z

@x l.105 of COMM-MEMORY.CH
alloc_object(byte_mem,max_bytes,char);
alloc_object(name_dir,max_names,name_info);
@y
#ifdef __TURBOC__
byte_mem=(char HUGE *)allocsafe(max_bytes,sizeof(*byte_mem));
name_dir=(name_pointer)allocsafe(max_names,sizeof(*name_dir));
#else
alloc_object(byte_mem,max_bytes,char);
alloc_object(name_dir,max_names,name_info);
#endif
@^system dependencies@>
@z

@x l.625
struct name_info *link;
@y
struct name_info HUGE *link;
@z

@x l.725
  struct name_info *Rlink; /* right link in binary search tree for section
@y
  struct name_info HUGE *Rlink; /* right link in binary search tree for section
@z

@x l.762
  char *ss, *s = first_chunk(p);
@y
  char HUGE *ss;
  char HUGE *s = first_chunk(p);
@z

@x l.782
  char *ss, *s = first_chunk(p);
@y
  char HUGE *ss;
  char HUGE *s = first_chunk(p);
@z

@x l.802
  char *s = first_chunk(p);
@y
  char HUGE *s = first_chunk(p);
@z

@x l.183 of COMM-ANSI.CH
static int web_strcmp(@t\1\1@> /* fuller comparison than |strcmp| */
  char *j, /* beginning of first string */
  int j_len, /* length of first string */
  char *k, /* beginning of second string */
  int k_len@t\2\2@>) /* length of second string */
{
  char *j1=j+j_len, *k1=k+k_len;
@y
static int web_strcmp(@t\1\1@> /* fuller comparison than |strcmp| */
  char HUGE *j, /* beginning of first string */
  int j_len, /* length of first string */
  char HUGE *k, /* beginning of second string */
  int k_len@t\2\2@>) /* length of second string */
{
  char HUGE *j1=j+j_len;
  char HUGE *k1=k+k_len;
@z

@x l.858
  char *s=first_chunk(p);
@y
  char HUGE *s=first_chunk(p);
@z

@x l.885
  char *s;
@y
  char HUGE *s;
@z

@x l.1021
  char *ss, *s=first_chunk(r);
@y
  char HUGE *ss;
  char HUGE *s=first_chunk(r);
@z

@x l.1055
@<More elements of |name...@>=
void *equiv_or_xref; /* info corresponding to names */
@y
@<More elements of |name...@>=
void HUGE *equiv_or_xref; /* info corresponding to names */
@z

@x l.125 of COMM-EXTENSIONS.CH
made sensitive to these conditions.
@y
made sensitive to these conditions.

|__TURBOC__| has another shitty ``feature'' that has to be fixed.
|return|ing from several |case|s is not possible.  Either always the
first case is used, or the system is crashed completely.  Really funny.
@^system dependencies@>
@z

@x l.140 of COMM-EXTENSIONS.CH
  switch(history) {
  case harmless_message: return(RETURN_WARN); break;
  case error_message: return(RETURN_ERROR); break;
  case fatal_message: return(RETURN_FAIL); break;
  default: return(RETURN_OK);
    }
@y
#ifdef __TURBOC__
  {
  int return_val;

  switch(history) {
  case harmless_message: return_val=RETURN_WARN; break;
  case error_message: return_val=RETURN_ERROR; break;
  case fatal_message: return_val=RETURN_FAIL; break;
  default: return_val=RETURN_OK;
    }
  return(return_val);
  }
#else
  switch(history) {
  case harmless_message: return(RETURN_WARN); break;
  case error_message: return(RETURN_ERROR); break;
  case fatal_message: return(RETURN_FAIL); break;
  default: return(RETURN_OK);
    }
#endif
@z

@x l.387 of COMM-ANSI.CH
static int web_strcmp(char *,int,char *,int);@/
@y
static int web_strcmp(char HUGE *,int,char HUGE *,int);@/
@z

@x l.1415
@** Index.
@y
@** DOS sucks.  Due to restrictions of most {\mc MS-DOS}-\CEE/ compilers,
large arrays will be allocated dynamically rather than statically.  In the
{\mc TURBO}-\CEE/ implementation the |farcalloc| function provides a way to
allocate more than 64~KByte of data. The |allocsafe| function tries to carry
out an allocation of |nunits| blocks of size |unitsz| by calling |farcalloc|
and takes a safe method, when this fails: the program will be aborted.

To deal with such allocated data areas |huge| pointers will be used in this
implementation.  Care has been taken that no conflicts arise on other systems
when these changes are applied.

@f far int
@f huge int
@f HUGE int

@<Pred...@>=
#ifdef __TURBOC__
void far *allocsafe(unsigned long,unsigned long);
#endif
@^system dependencies@>

@ @c
#ifdef __TURBOC__
void far *allocsafe (unsigned long nunits,unsigned long unitsz)
{
  void far *p = farcalloc(nunits,unitsz);
  if (p==NULL) fatal("",get_string(MSG_FATAL_CO85));
@.Memory allocation failure@>
  return p;
}
#endif
@^system dependencies@>

@ @<Include...@>=
#ifdef __TURBOC__
#include <alloc.h> /* import |farcalloc| */
#include <io.h> /* import |write| */
#endif
@^system dependencies@>

@ @<Macro...@>=
#ifdef __TURBOC__
#define HUGE huge
#else
#define HUGE
#endif
@^system dependencies@>

@** Index.
@z
