Changes for COMMON.W by Andreas Scherer, September 19, 1995.

This set of changes provides dynamic memory allocation for the internal
fields of the CWEB system.  There is no external memory configuration file
as for TeX (yet), but there's already the advantage that the CWEB programs
can be compiled in the `NEAR' data section and be made `resident'.

This change file requires COMM-PATCH.CH, COMM-ANSI.CH, COMM-EXTENSIONS.CH
to be applied as well.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

@x l.92
  @<Initialize pointers@>;
@y
  @<Set up the event trap@>;
  @<Initialize pointers@>;
@z

@x l.159
char buffer[long_buf_size]; /* where each line of input goes */
char *buffer_end=buffer+buf_size-2; /* end of |buffer| */
char *limit=buffer; /* points to the last character in the buffer */
char *loc=buffer; /* points to the next character to be read from the buffer */
@y
char *buffer; /* where each line of input goes */
char *buffer_end; /* end of |buffer| */
char *limit; /* points to the last character in the buffer */
char *loc; /* points to the next character to be read from the buffer */
@z

@x l.215
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

@x l.240
char change_buffer[buf_size]; /* next line of |change_file| */
@y
char *change_buffer; /* next line of |change_file| */
@z

@x l.382
  @<Open input files@>;
  include_depth=0; cur_line=0; change_line=0;
@y
  include_depth=0; cur_line=0; change_line=0;
  @<Open input files@>;
@z

@x l.420
boolean changed_section[max_sections]; /* is the section changed? */
@y
boolean *changed_section; /* is the section changed? */
@z

@x l.470
#include <stdlib.h> /* declaration of |getenv| and |exit| */
@y
#include <signal.h> /* declaration of |signal| and |SIGINT| */
#include <stdlib.h> /* declaration of |getenv| and |exit| */
@z

@x l.593
char byte_mem[max_bytes]; /* characters of names */
char *byte_mem_end = byte_mem+max_bytes-1; /* end of |byte_mem| */
name_info name_dir[max_names]; /* information about names */
name_pointer name_dir_end = name_dir+max_names-1; /* end of |name_dir| */
@y
char *byte_mem; /* characters of names */
char *byte_mem_end; /* end of |byte_mem| */
name_pointer name_dir; /* information about names */
name_pointer name_dir_end; /* end of |name_dir| */
@z

@x l.614
@ @<Init...@>=
name_dir->byte_start=byte_ptr=byte_mem; /* position zero in both arrays */
@y
@ @f type int /* \.{type} becomes the pseudotype \&{type} */
@#
@d alloc_object(object,size,@!type)
   if(!(object = (type *)malloc((size)*sizeof(type))))
      fatal("","! Memory allocation failure")@;
@d free_object(object)
   if(object) free(object), object=NULL@;

@<Init...@>=
alloc_object(buffer,long_buf_size,char);
buffer_end = buffer + buf_size - 2;
limit = loc = buffer;
alloc_object(file,max_include_depth,FILE *);
alloc_object(file_name,max_include_depth,char *);
for(phase=0; phase<max_include_depth; phase++)
  alloc_object(file_name[phase],max_file_name_length,char);
alloc_object(change_file_name,max_file_name_length,char);
alloc_object(alt_web_file_name,max_file_name_length,char);
alloc_object(line,max_include_depth,int);
alloc_object(change_buffer,buf_size,char);
alloc_object(changed_section,max_sections,boolean);
alloc_object(byte_mem,max_bytes,char);
alloc_object(name_dir,max_names,name_info);
byte_mem_end = byte_mem + max_bytes - 1;
name_dir_end = name_dir + max_names - 1;
name_dir->byte_start=byte_ptr=byte_mem; /* position zero in both arrays */
@z

@x l.639
name_pointer hash[hash_size]; /* heads of hash lists */
hash_pointer hash_end = hash+hash_size-1; /* end of |hash| */
@y
hash_pointer hash; /* heads of hash lists */
hash_pointer hash_end; /* end of |hash| */
@z

@x l.649
for (h=hash; h<=hash_end; *h++=NULL) ;
@y
alloc_object(hash,hash_size,name_pointer);
hash_end = hash + hash_size - 1;
for (h=hash; h<=hash_end; *h++=NULL) ;
alloc_object(C_file_name,max_file_name_length,char);
alloc_object(tex_file_name,max_file_name_length,char);
alloc_object(idx_file_name,max_file_name_length,char);
alloc_object(scn_file_name,max_file_name_length,char);
@z

@x l.1216
char C_file_name[max_file_name_length]; /* name of |C_file| */
char tex_file_name[max_file_name_length]; /* name of |tex_file| */
char idx_file_name[max_file_name_length]; /* name of |idx_file| */
char scn_file_name[max_file_name_length]; /* name of |scn_file| */
@y
char *C_file_name; /* name of |C_file| */
char *tex_file_name; /* name of |tex_file| */
char *idx_file_name; /* name of |idx_file| */
char *scn_file_name; /* name of |scn_file| */
@z

@x l.268 of COMM-EXTENSIONS.CH
  char string[max_path_length+2];
@y
  char *string;

  alloc_object(string,max_path_length+2,char);
@z

@x l.272 of COMM-EXTENSIONS.CH
      err_print("! Include path too long"); return(0);
@y
      err_print("! Include path too long");
      free_object(string); return(0);
@z

@x l.280 of COMM-EXTENSIONS.CH
  return(1);
@y
  free_object(string); return(1);
@z

@x l.292 of COMM-EXTENSIONS.CH
char include_path[max_path_length+2];@/
char *p, *path_prefix, *next_path_prefix;
@y
char *include_path;@/
char *p, *path_prefix, *next_path_prefix;

@ @<Init...@>=
alloc_object(include_path,max_path_length+2,char);
strcpy(include_path,"");
@z

@x l. 1415
@** Index.
@y
@** Memory allocation.  The idea of dynamic memory allocation is extended
to all internal arrays (except the |flags| field).  Especially on the {\mc
AMIGA} this is very useful, because the programs can be compiled in the
\.{NEAR} data segment and thus can be made \\{resident}.

In case of an user break we must take care of the dynamically allocated
memory and opened resources like system libraries and catalog files.
There is no warranty that in such cases the exit code automatically
frees these resources.  |exit| is not necessarily called after a break.
{\mc ANSI-C} provides ``interrupt handlers'' for this purpose.
|catch_break| simply calls |wrap_up| before |exit|ing the aborted program.
@^system dependencies@>

@<Set up the event trap@>=
  if(signal(SIGINT,&catch_break) == SIG_ERR)
    exit(EXIT_FAILURE); /* Interrupt handler could not be set up. */

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

@** Index.
@z
