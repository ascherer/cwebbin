Changes for WMERGE.W by Andreas Scherer, September 19, 1995.

This set of changes introduces several extensions to the standard behaviour
of the CWEB system.  An extended path search mechanism for lookup of
`@i'include files is provided here, as well as some enlargements and
generalisations.

This change file requires WMERG-PATCH.CH, WMERG-ANSI.CH to be applied.

For a complete history of the changes made to WMERGE.W see WMERG-PATCH.CH.

@x l.18
#include <ctype.h> /* definition of |isalpha|, |isdigit| and so on */
@y
#include <ctype.h> /* definition of |isalpha|, |isdigit| and so on */
@#
#ifdef SEPARATORS
char separators[]=SEPARATORS;
#else
char separators[]="://"; /* UNIX set up */
#endif
@#
#define PATH_SEPARATOR   separators[0]
#define DIR_SEPARATOR    separators[1]
#define DEVICE_SEPARATOR separators[2]
@z

@x l.127
@d max_file_name_length 60
@y
@d max_file_name_length 255
@z

@x l.287
  @<Open input files@>;
  include_depth=0; cur_line=0; change_line=0;
@y
  include_depth=0; cur_line=0; change_line=0;
  @<Open input files@>@;
@z

@x l.352
@ When an \.{@@i} line is found in the |cur_file|, we must temporarily
stop reading it and start reading from the named include file.  The
\.{@@i} line should give a complete file name with or without
double quotes.
If the environment variable \.{CWEBINPUTS} is set, or if the compiler flag 
of the same name was defined at compile time,
\.{CWEB} will look for include files in the directory thus named, if
it cannot find them in the current directory.
(Colon-separated paths are not supported.)
The remainder of the \.{@@i} line after the file name is ignored.
@y
@ When an \.{@@i} line is found in the |cur_file|, we must temporarily
stop reading it and start reading from the named include file.  The
\.{@@i} line should give a complete file name with or without double
quotes.  The remainder of the \.{@@i} line after the file name is ignored.
\.{CWEB} will look for include files in standard directories specified in
the environment variable \.{CWEBINPUTS}. Multiple search paths can be
specified by delimiting them with \.{PATH\_SEPARATOR}s.  The given file is
searched for in the current directory first.  You also may include device
names; these must have a \.{DEVICE\_SEPARATOR} as their rightmost character.
@z

@x l.380
  kk=getenv("CWEBINPUTS");
  if (kk!=NULL) {
    if ((l=strlen(kk))>max_file_name_length-2) too_long();
    strcpy(temp_file_name,kk);
  }
  else {
#ifdef CWEBINPUTS
    if ((l=strlen(CWEBINPUTS))>max_file_name_length-2) too_long();
    strcpy(temp_file_name,CWEBINPUTS);
#else
    l=0; 
#endif /* |CWEBINPUTS| */
  }
  if (l>0) {
    if (k+l+2>=cur_file_name_end)  too_long();
@.Include file name ...@>
    for (; k>= cur_file_name; k--) *(k+l+1)=*k;
    strcpy(cur_file_name,temp_file_name);
    cur_file_name[l]='/'; /* \UNIX/ pathname separator */
    if ((cur_file=fopen(cur_file_name,"r"))!=NULL) {
      cur_line=0; 
      goto restart; /* success */
    }
  }
@y
  if(0==set_path(include_path,getenv("CWEBINPUTS"))) {
    include_depth--; goto restart; /* internal error */
  }
  path_prefix = include_path;
  while(path_prefix) {
    for(kk=temp_file_name, p=path_prefix, l=0;
      p && *p && *p!=PATH_SEPARATOR;
      *kk++ = *p++, l++);
    if(path_prefix && *path_prefix && *path_prefix!=PATH_SEPARATOR &&
      *--p!=DEVICE_SEPARATOR && *p!=DIR_SEPARATOR) {
      *kk++ = DIR_SEPARATOR; l++;
    }
    if(k+l+2>=cur_file_name_end) too_long(); /* emergency break */
    strcpy(kk,cur_file_name);
    if((cur_file = fopen(temp_file_name,"r"))!=NULL) {
      cur_line=0; goto restart; /* success */
    }
    if((next_path_prefix = strchr(path_prefix,PATH_SEPARATOR))!=NULL)
      path_prefix = next_path_prefix+1;
    else break; /* no more paths to search; no file found */
  }
@z

@x l.540
@ Some implementations may wish to pass the |history| value to the
operating system so that it can be used to govern whether or not other
programs are started. Here, for instance, we pass the operating system
a status of 0 if and only if only harmless messages were printed.
@^system dependencies@>
@y
@ On multi-tasking systems like the Amiga it is very convenient to know
a little bit more about the reasons why a program failed.  The four levels
of return indicated by the |history| value are very suitable for this
purpose.  Here, for instance, we pass the operating system a status of~0
if and only if the run was a complete success.  Any warning or error
message will result in a higher return value, so ARexx scripts can be
made sensitive to these conditions.
@^system dependencies@>

@d RETURN_OK     0 /* No problems, success */
@d RETURN_WARN   5 /* A warning only */
@d RETURN_ERROR 10 /* Something wrong */
@d RETURN_FAIL  20 /* Complete or severe failure */
@z

@x l.549
  if (history > harmless_message) return(1);
  else return(0);
@y
  switch(history) {
  case harmless_message: return(RETURN_WARN); break;
  case error_message: return(RETURN_ERROR); break;
  case fatal_message: return(RETURN_FAIL); break;
  default: return(RETURN_OK);
  }
@z

@x l.569
the names of those files. Most of the 128 flags are undefined but available
@y
the names of those files. Most of the 256 flags are undefined but available
@z

@x l.579
boolean flags[128]; /* an option for each 7-bit code */
@y
boolean flags[256]; /* an option for each 8-bit code */
@z

@x l.593
An omitted change file argument means that |'/dev/null'| should be used,
when no changes are desired.
@y
An omitted change file argument means that |'/dev/null'| or---on non-\UNIX/
systems the contents of the compile-time variable |_DEV_NULL|---should
be used, when no changes are desired.
@z

@x l.620
        else if (*s=='/') dot_pos=NULL,++s;
@y
        else if (*s==DIR_SEPARATOR || *s==DEVICE_SEPARATOR || *s=='/')
          dot_pos=NULL,++s;
@z

@x l.630
  if (!found_change) strcpy(change_file_name,"/dev/null");
@y
#ifdef _DEV_NULL
  if (!found_change) strcpy(change_file_name,_DEV_NULL);
#else
  if (!found_change) strcpy(change_file_name,"/dev/null");
#endif
@z

@x l.163 of wmerg-ansi.ch
@<Predecl...@>=
@y
@<Predecl...@>=
static boolean set_path(char *,char *);@/
@z

@x l.709
@* Index.
@y
@* Path searching.  By default, \.{CTANGLE} and \.{CWEAVE} are looking
for include files along the path |CWEBINPUTS|.  By setting the environment
variable of the same name to a different search path you can suit your
personal needs.  If this variable is empty, some decent defaults are used
internally.  The following procedure takes care that these internal entries
are appended to any setting of the environmnt variable, so you don't have
to repeat the defaults.
@^system dependencies@>

@c
static boolean set_path(char *include_path,char *environment)
{
  char string[max_path_length+2];

#ifdef CWEBINPUTS
  strcpy(include_path,CWEBINPUTS);
#endif

  if(environment) {
    if(strlen(environment)+strlen(include_path) >= max_path_length) {
      err_print("! Include path too long"); return(0);
@.Include path too long@>
    } else {
      sprintf(string,"%s%c%s",environment,PATH_SEPARATOR,include_path);
      strcpy(include_path,string);
    }
  }
  return(1);
}

@ The path search algorithm defined in section |@<Try to open...@>|
needs a few extra variables.

@d max_path_length (BUFSIZ-2)

@<Definitions...@>=
char include_path[max_path_length+2];@/
char *p, *path_prefix, *next_path_prefix;

@* Index.
@z
