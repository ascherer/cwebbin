Changes for COMMON.W by Andreas Scherer, November 10, 2018.

This set of changes introduces several extensions to the standard behaviour
of the CWEB system.  Several new command line options are provided here, as
well as an extended path search mechanism for lookup of `@i'input files.
See `cwebmana.ch' for details about these new features.

This change file requires COMM-PATCH.CH and COMM-ANSI.CH to be applied.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

@x l.153
@d buf_size 100 /* for \.{CWEAVE} and \.{CTANGLE} */
@y
@d buf_size 1000 /* for \.{CWEAVE} and \.{CTANGLE} */
@z

@x l.207 - max_file_name_length is way too small.
@d max_file_name_length 60
@y
@d max_file_name_length 1024
@z

@x l.415
@d max_sections 2000 /* number of identifiers, strings, section names;
  must be less than 10240 */
@y
@d max_sections 10239 /* number of identifiers, strings, section names;
  must be less than 10240 */
@z

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

@x l.589
@d max_bytes 90000 /* the number of bytes in identifiers,
  index entries, and section names; must be less than $2^{24}$ */
@d max_names 4000 /* number of identifiers, strings, section names;
  must be less than 10240 */
@y
@d max_bytes 1000000 /* the number of bytes in identifiers,
  index entries, and section names; must be less than $2^{24}$ */
@d max_names 10239 /* number of identifiers, strings, section names;
  must be less than 10240 */
@z

@x l.642
@d hash_size 353 /* should be prime */
@y
@d hash_size 8501 /* should be prime */
@z

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
message will result in a higher return value, so {\mc AREXX} scripts can be
made sensitive to these conditions.
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
  case harmless_message: return(RETURN_WARN); break;
  case error_message: return(RETURN_ERROR); break;
  case fatal_message: return(RETURN_FAIL); break;
  default: return(RETURN_OK);
  }
@z

C and CWEB are `international' languages, so non-English speaking users may
want to write program documentations in their native language instead of in
English.  With the \.{+lX} (or \.{-lX} as well) option CWEAVE includes TeX
macros `Xcwebmac.tex'.  This option works differently than all the others,
because it takes the rest of the command line argument and prepends it to
the string ``cwebmac'' in the first line of the TeX output, so you can call
CWEAVE with the option ``+ldeutsch'' to yield ``\input deutschcwebmac'' in
the first line.

The original CWEAVE indents parameter declarations in old-style function
heads.  If you don't like this, you can typeset them flush left with \.{-i}.

The original CWEAVE puts extra white space after variable declarations and
before the first statement in a function block.  If you don't like this,
you can use the \.{-o} option.  This feature was already mentioned in the
original documentation, but it was not implemented.

These changes by Andreas Scherer are based on ideas by Carsten Steger
provided in his `CWeb 2.0' port from ><> 551 and his `CWeb 2.8' port
from the electronic nets and on suggestions by Giuseppe Ghibò.  The string
argument to the `-l' option was suggested by Carsten Steger in a private
communication in 1994.  Originally this was meant to be the single
character following `l', but there would have been collisions between
``dansk'' and ``deutsch,'' ``espanol'' and ``english,'' and many others.

@x l.1212
the names of those files. Most of the 128 flags are undefined but available
for future extensions.

@d show_banner flags['b'] /* should the banner line be printed? */
@d show_progress flags['p'] /* should progress reports be printed? */
@d show_stats flags['s'] /* should statistics be printed at end of run? */
@d show_happiness flags['h'] /* should lack of errors be announced? */
@y
the names of those files. Most of the 256 flags are undefined but available
for future extensions.

@d show_banner flags['b'] /* should the banner line be printed? */
@d show_progress flags['p'] /* should progress reports be printed? */
@d show_stats flags['s'] /* should statistics be printed at end of run? */
@d show_happiness flags['h'] /* should lack of errors be announced? */
@d indent_param_decl flags['i'] /* should formal parameter declarations be indented? */
@d order_decl_stmt flags['o'] /* should declarations and statements be separated? */
@z

@x l.1226
char scn_file_name[max_file_name_length]; /* name of |scn_file| */
boolean flags[128]; /* an option for each 7-bit code */
@y
char scn_file_name[max_file_name_length]; /* name of |scn_file| */
boolean flags[256]; /* an option for each 8-bit code */
const char *use_language; /* prefix of \.{cwebmac.tex} in \TEX/ output */
@z

@x l.1233
@<Set the default options common to \.{CTANGLE} and \.{CWEAVE}@>=
show_banner=show_happiness=show_progress=1;
@y
@<Set the default options common to \.{CTANGLE} and \.{CWEAVE}@>=
show_banner=show_happiness=show_progress=true;@/
show_stats=false;@/
indent_param_decl=order_decl_stmt=true;@/
use_language="";
@z

@x l.1245
An omitted change file argument means that |"/dev/null"| should be used,
when no changes are desired.
@y
An omitted change file argument means that |"/dev/null"| or---on non-\UNIX/
systems the contents of the compile-time variable |DEV_NULL| (\TeX~Live) or
|_DEV_NULL| (Amiga)---should be used, when no changes are desired.
@z

@x l.441 of COMM-ANSI.CH
  strcpy(change_file_name,"/dev/null");
@y
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

@x l.1348 and l.437 of COMM-ANSI.CH
  for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++)
    flags[(eight_bits)*dot_pos]=flag_change;
@y
  for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++)
    if(*dot_pos=='l') {
       use_language=++dot_pos;
       break;
    }
    else flags[(eight_bits)*dot_pos]=flag_change;
@z

@x l.491 of COMM-ANSI.CH
@ The following functions are private to |"common.w"|.

@<Predecl...@>=
@y
@ The following functions are private to |"common.w"|.

@<Predecl...@>=
static boolean set_path(char *,char *);@/
@z

@x l.1418
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

#ifdef SEPARATORS
char separators[]=SEPARATORS;
#else
char separators[]="://";
#endif

@** Index.
@z
