Changes for WMERGE.W by Andreas Scherer, January 22, 2000.

This set of changes converts the WMERGE.W module into ANSI-C and C++ code.
All functions are both declared and defined in prototypical form, while
several functions are declared `static' instead of `extern'.  Additional
casts are introduced.

This change file requires that WMERG-PATCH.CH is applied as well.

For a complete history of the changes made to WMERGE.W see WMERG-PATCH.CH.

@x l.14
#include <stdio.h>
@y
#include <string.h>
#include <stdio.h>
@z

@x l.20
main (ac,av)
int ac; char **av;
@y
int main (int ac, char **av)
@z

@x l.40
@ We predeclare some standard string-handling functions here instead of
including their system header files, because the names of the header files
are not as standard as the names of the functions. (There's confusion
between \.{<string.h>} and \.{<strings.h>}.)

@<Predecl...@>=
extern size_t strlen(); /* length of string */
extern char* strcpy(); /* copy one string to another */
extern int strncmp(); /* compare up to $n$ string characters */
extern char* strncpy(); /* copy up to $n$ string characters */
@y
@ For string handling we include the {\mc ANSI C} system header file
instead of predeclaring the standard system functions |strlen|, |strcmp|,
|strcpy|, and |strncpy|.  This is done in the main section.
@^system dependencies@>
@z

@x l.86
@:caddr_t}{\bf caddr_t@>
@y
@:caddr_t}{\bf caddr\_t@>
@z

@x l.94
input_ln(fp) /* copies a line into |buffer| or returns 0 */
FILE *fp; /* what file to read from */
@y
int input_ln(@t\1\1@> /* copies a line into |buffer| or returns 0 */
  FILE *fp@t\2\2@>) /* what file to read from */
@z

@x l.157
@d lines_dont_match (change_limit-change_buffer != limit-buffer ||
  strncmp(buffer, change_buffer, limit-buffer))
@y
@d lines_dont_match (change_limit-change_buffer != limit-buffer ||
  strncmp(buffer, change_buffer, (size_t)(limit-buffer)))
@z

@x l.172
void
prime_the_change_buffer()
@y
void prime_the_change_buffer(void)
@z

@x l.215
  strncpy(change_buffer,buffer,limit-buffer+1);
@y
  strncpy(change_buffer,buffer,(size_t)(limit-buffer+1));
@z

@x l.231
void
check_change() /* switches to |change_file| if the buffers match */
@y
void check_change(void) /* switches to |change_file| if the buffers match */
@z

@x l.283
void
reset_input()
@y
void reset_input(void)
@z

@x l.318
int get_line() /* inputs the next line */
@y
int get_line(void) /* inputs the next line */
@z

@x l.345
void put_line()
@y
void put_line(void)
@z

@x l.450
void
check_complete(){
@y
void check_complete(void) {
@z

@x l.453
    strncpy(buffer,change_buffer,change_limit-change_buffer+1);
@y
    strncpy(buffer,change_buffer,(size_t)(change_limit-change_buffer+1));
@z

@x l.491
void  err_print();
@y
void  err_print(const char *);
@z

@x l.495
void
err_print(s) /* prints `\..' and location of error message */
char *s;
@y
void err_print(const char *s) /* prints `\..' and location of error message */
@z

@x l.547
wrap_up() {
@y
int wrap_up(void) {
@z

@x l.600
void scan_args();
@y
void scan_args(void);
@z

@x l.604
void
scan_args()
@y
void scan_args(void)
@z

@x l.687
    flags[*dot_pos]=flag_change;
@y
    flags[0+*dot_pos]=flag_change;
@z

@x l.709
@* Index.
@y
@* Function declarations.  To satisfy all the {\mc ANSI} compilers out
there, here are the prototypes of all internal functions.

@<Predecl...@>=
int get_line(void);@/
int input_ln(FILE *);@/
int main(int,char **);@/
int wrap_up(void);@/
void check_change(void);@/
void check_complete(void);@/
void prime_the_change_buffer(void);@/
void put_line(void);@/
void reset_input(void);

@* Index.
@z
