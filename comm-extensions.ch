Changes for COMMON.W by Andreas Scherer, November 10, 2018.

This set of changes introduces several extensions to the standard behaviour
of the CWEB system.  Several new command line options are provided here, as
well as an extended path search mechanism for lookup of `@i'input files.
See `cwebmana.ch' for details about these new features.

This change file requires COMM-PATCH.CH and COMM-ANSI.CH to be applied.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

Section 22.

@x l.457
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
\.{@@i} line should give a complete file name with or without
double quotes.
The remainder of the \.{@@i} line after the file name is ignored.
\.{CWEB} will look for include files in standard directories specified in the
environment variable \.{CWEBINPUTS}. Multiple search paths can be specified by
delimiting them with \.{PATH\_SEPARATOR}s.  The given file is searched for in
the current directory first.  You also may include device names; these must
have a \.{DEVICE\_SEPARATOR} as their rightmost character.
@^system dependencies@>
@z

Section 23.

@x l.493
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
      cur_line=0; print_where=1;
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
    if(path_prefix && *path_prefix && *path_prefix!=PATH_SEPARATOR && @|
      *--p!=DEVICE_SEPARATOR && *p!=DIR_SEPARATOR) {
      *kk++ = DIR_SEPARATOR; l++;
    }
    if(k+l+2>=cur_file_name_end) too_long(); /* emergency break */
    strcpy(kk,cur_file_name);
    if((cur_file = fopen(temp_file_name,"r"))!=NULL) {
      cur_line=0; print_where=1; goto restart; /* success */
    }
    if((next_path_prefix = strchr(path_prefix,PATH_SEPARATOR))!=NULL)
      path_prefix = next_path_prefix+1;
    else break; /* no more paths to search; no file found */
  }
@z

Section 61.

@x l.1144
@ Some implementations may wish to pass the |history| value to the
operating system so that it can be used to govern whether or not other
programs are started. Here, for instance, we pass the operating system
a status of 0 if and only if only harmless messages were printed.
@^system dependencies@>
@y
@ On multi-tasking systems like the {\mc AMIGA} it is very convenient to
know a little bit more about the reasons why a program failed.  The four
levels of return indicated by the |history| value are very suitable for
this purpose.  Here, for instance, we pass the operating system a status
of~0 if and only if the run was a complete success.  Any warning or error
message will result in a higher return value, so that {\mc AREXX} scripts
can be made sensitive to these conditions.
@^system dependencies@>

@d RETURN_OK     0 /* No problems, success */
@d RETURN_WARN   5 /* A warning only */
@d RETURN_ERROR 10 /* Something wrong */
@d RETURN_FAIL  20 /* Complete or severe failure */
@z

@x l.1156
  if (history > harmless_message) return(1);
  else return(0);
@y
  switch(history) {
  case harmless_message: return RETURN_WARN;
  case error_message: return RETURN_ERROR;
  case fatal_message: return RETURN_FAIL;
  default: return RETURN_OK;
  }
@z

Section 67.

C and CWEB are `international' languages, so non-English speaking users may
want to write program documentations in their native language instead of in
English.  With the \.{+lX} (or \.{-lX} as well) option CWEAVE includes TeX
macros `Xcwebmac.tex'.  This option works differently than all the others,
because it takes the rest of the command line argument and prepends it to
the string ``cwebmac'' in the first line of the TeX output, so you can call
CWEAVE with the option ``+ldeutsch'' to yield ``\input deutschcwebmac'' in
the first line.

These changes by Andreas Scherer are based on ideas by Carsten Steger
provided in his `CWeb 2.0' port from ><> 551 and his `CWeb 2.8' port
from the electronic nets and on suggestions by Giuseppe Ghibò.  The string
argument to the `-l' option was suggested by Carsten Steger in a private
communication in 1994.  Originally this was meant to be the single
character following `l', but there would have been collisions between
``dansk'' and ``deutsch,'' ``espanol'' and ``english,'' and many others.

@x l.1227
boolean flags[128]; /* an option for each 7-bit code */
@y
boolean flags[128]; /* an option for each 7-bit code */
const char *use_language=""; /* prefix of \.{cwebmac.tex} in \TEX/ output */
@z

Section 69.

@x l.1245
An omitted change file argument means that |"/dev/null"| should be used,
when no changes are desired.
@y
An omitted change file argument means that |"/dev/null"| or---on non-\UNIX/
systems the contents of the compile-time variable |DEV_NULL| (\TeX~Live) or
|_DEV_NULL| (Amiga)---should be used, when no changes are desired.
@z

Section 70.

@x l.1263
  boolean flag_change;
@y
@z

@x l.1265+ and l.214 of COMM-PATCH.CH
  strcpy(change_file_name,"/dev/null");
@y
@#
#if defined DEV_NULL
  strncpy(change_file_name,DEV_NULL,max_file_name_length-2);
  change_file_name[max_file_name_length-2]='\0';
#elif defined _DEV_NULL
  strncpy(change_file_name,_DEV_NULL,max_file_name_length-2);
  change_file_name[max_file_name_length-2]='\0';
#else
  strcpy(change_file_name,"/dev/null");
#endif
@^system dependencies@>
@z

@x l.1269
      while (*s) {
        if (*s=='.') dot_pos=s++;
        else if (*s=='/') dot_pos=NULL,name_pos=++s;
        else s++;
      }
@y
      while (*s) {
        if (*s=='.') dot_pos=s++;
        else if (*s==DIR_SEPARATOR || *s==DEVICE_SEPARATOR || *s=='/')
          dot_pos=NULL,name_pos=++s;
        else s++;
      }
@^system dependencies@>
@z

Section 74.

@x l.1361
  for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++)
@y
  for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++)
    if(*dot_pos=='l') {
       use_language=++dot_pos;
       break;
    } else
@z

Section NN.

@x l.1442
@ The following functions are private to |"common.w"|.

@<Predecl...@>=
@y
@ The following functions are private to |"common.w"|.

@<Predecl...@>=
static boolean set_path(char *,char *);@/
@z

Add even more material ...

@x l.1452
@** Index.
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
@#
#ifdef CWEBINPUTS
  strncpy(include_path,CWEBINPUTS,max_path_length);
  include_path[max_path_length]='\0';
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

@d PATH_SEPARATOR   separators[0]
@d DIR_SEPARATOR    separators[1]
@d DEVICE_SEPARATOR separators[2]

@<Other...@>=
char include_path[max_path_length+2];@/
char *p, *path_prefix, *next_path_prefix;

#ifndef SEPARATORS
#define SEPARATORS "://"
#endif
char separators[]=SEPARATORS;

@** Index.
@z
