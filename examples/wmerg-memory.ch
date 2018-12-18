Changes for WMERGE.W by Andreas Scherer, December 4, 2018.

This set of changes provides dynamic memory allocation for the internal
fields of the CWEB system.  There is no external memory configuration file
as for TeX (yet), but there's already the advantage that the CWEB programs
can be compiled in the `NEAR' data section and be made `resident'.

This change file requires WMERG-PATCH.CH, WMERG-ANSI.CH, WMERG-EXTENSIONS.CH,
and WMERG-OUTPUT.CH to be applied as well.

For a complete history of the changes made to WMERGE.W see WMERG-PATCH.CH.

@x l.16
#include <stdio.h>
@y
#include <signal.h>
#include <stdio.h>
@z

@x l.26
  @<Set the default options@>;
  @<Scan arguments and open output file@>;
@y
  @<Set up the exit trap@>@;
  @<Initialize the memory blocks@>@;
  @<Set the default options@>@;
  @<Scan arguments and open output file@>@;
@z

@x l.71
ASCII buffer[buf_size]; /* where each line of input goes */
ASCII *buffer_end=buffer+buf_size-2; /* end of |buffer| */
@y
ASCII *buffer; /* where each line of input goes */
ASCII *buffer_end; /* end of |buffer| */
@z

@x l.138
FILE *file[max_include_depth]; /* stack of non-change files */
FILE *change_file; /* change file */
char file_name[max_include_depth][max_file_name_length];
  /* stack of non-change file names */
char change_file_name[max_file_name_length]; /* name of change file */
char alt_web_file_name[max_file_name_length]; /* alternate name to try */
int line[max_include_depth]; /* number of current line in the stacked files */
@y
FILE **file; /* stack of non-change files */
FILE *change_file; /* change file */
char **file_name; /* stack of non-change file names */
char *change_file_name; /* name of change file */
char *alt_web_file_name; /* alternate name to try */
int *line; /* number of current line in the stacked files */
@z

@x l.163
char change_buffer[buf_size]; /* next line of |change_file| */
@y
char *change_buffer; /* next line of |change_file| */
@z

@x l.370
  char temp_file_name[max_file_name_length]; 
@y
  static char *temp_file_name; 
@z

@x l.375
  if (*loc=='"') {
@y
  alloc_object(temp_file_name,max_file_name_length,char);
  if (*loc=='"') {
@z

@x l.587 and l.35 of WMERG-OUTPUT.CH
char out_file_name[max_file_name_length]; /* name of |out_file| */
char check_file_name[max_file_name_length]; /* name of |check_file| */
boolean flags[256]; /* an option for each 8-bit code */
@y
char *out_file_name; /* name of |out_file| */
char *check_file_name; /* name of |check_file| */
boolean *flags; /* an option for each 8-bit code */
@z

@x l.196 of WMERG-EXTENSIONS.CH
  char string[max_path_length+2];
@y
  char *string;
  alloc_object(string,max_path_length+2,char);
@z

@x l.204 of WMERG-EXTENSIONS.CH
      err_print("! Include path too long"); return(0);
@y
      err_print("! Include path too long");
      free_object(string); return(0);
@z

@x l.211 of WMERG-EXTENSIONS.CH
  return(1);
@y
  free_object(string); return(1);
@z

@x l.220 of WMERG-EXTENSIONS.CH
char include_path[max_path_length+2];@/
@y
char *include_path;@/
@z

@x l.717
@* Index.
@y
@* Dynamic memory allocation.  Just as \.{CTANGLE} and \.{CWEAVE} before,
\.{WMERGE} allocates all its internal arrays dynamically, so the resulting
program can be compiled in the \.{NEAR} data segment and made resident on
the Amiga.  We do all the global allocations here.

@f type int /* \.{type} becomes the pseudotype \&{type} */
@#
@d alloc_object(object,size,@!type)
   if(!(object = (type *)malloc((size)*sizeof(type))))
      fatal("! Memory allocation failure","");
@d free_object(object)
   if(object) {
      free(object);
      object=NULL;
   }

@<Init...@>=
alloc_object(buffer,buf_size,ASCII);
buffer_end=buffer+buf_size-2;
alloc_object(file,max_include_depth,FILE*);
alloc_object(file_name,max_include_depth,char *);
for(i=0; i<max_include_depth; i++)
  alloc_object(file_name[i],max_file_name_length,char);
alloc_object(change_file_name,max_file_name_length,char);
alloc_object(alt_web_file_name,max_file_name_length,char);
alloc_object(line,max_include_depth,int);
alloc_object(change_buffer,buf_size,char);
alloc_object(out_file_name,max_file_name_length,char);
alloc_object(check_file_name,max_file_name_length,char);
alloc_object(flags,256,boolean);
alloc_object(include_path,max_path_length+2,char);
strcpy(include_path,"");

@ @<Definitions@>=
int i; /* index variable for initializing matrices */

@ In case of an user break we must take care of the dynamically allocated
and opened resources like memory segments.  There is no warranty that in
such cases the exit code automatically frees these resources.  |exit| is
not necessarily called after a break.  {\mc ANSI-C} provides ``interrupt
handlers'' for this purpose.  |catch_break| simply calls |wrap_up| before
|exit|ing the aborted program.
@^system dependencies@>

@<Set up the exit trap@>=
  if(signal(SIGINT,&catch_break) == SIG_ERR)
    exit(1); /* Interrupt handler could not be set up. */

@ The only purpose of the interrupt handler |catch_break| in case of an
user abort is to call the cleanup routine that takes care of any opened
system resources.

@c
void catch_break(int)
{
   history=fatal_message;
   exit(wrap_up());
}

@ @<Predec...@>=
void catch_break(int);

@* Index.
@z
