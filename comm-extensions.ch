Changes for COMMON.W by Andreas Scherer, July 2021.

This set of changes introduces several extensions to the standard behaviour
of the CWEB system.  Several new command line options are provided here, as
well as an extended path search mechanism for lookup of `@i'input files.
See CWEBMAN-EXTENSIONS.CH for details about these new features.
It also incorporates the basis for CTWILL, CWEAVE's evil twin.

This change file requires COMM-PATCH.CH to be applied first.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

Section 1.  Add CTWILL.

@x l.51
to both \.{CTANGLE} and \.{CWEAVE}, which roughly concerns the following
@y
to \.{CTANGLE}, \.{CWEAVE}, and \.{CTWILL},
which roughly concerns the following
@z

@x l.57
sometimes use \.{CWEB} to refer to either of the two component
@y
sometimes use \.{CWEB} to refer to any of the three component
@z

Section 18.  Add CTWILL.

@x l.77
|program|.
@y
|program|. And \.{CTWILL} adds some extra twists.
@z

@x l.80
boolean program; /* \.{CWEAVE} or \.{CTANGLE}? */
@y
cweb program; /* \.{CTANGLE} or \.{CWEAVE} or \.{CTWILL}? */
@z

Section 36.

@x l.393
@ When an \.{@@i} line is found in the |cur_file|, we must temporarily
stop reading it and start reading from the named include file.  The
\.{@@i} line should give a complete file name with or without
double quotes.
If the environment variable |CWEBINPUTS| is set, or if the compiler flag
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
environment variable |CWEBINPUTS|. Multiple search paths can be specified by
delimiting them with \.{PATH\_SEPARATOR}s.  The given file is searched for in
the current directory first.  You also may include device names; these must
have a \.{DEVICE\_SEPARATOR} as their rightmost character.
@^system dependencies@>
@z

@x l.426
  if ((kk=getenv("CWEBINPUTS"))!=NULL) {
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
    if (k+l+2>=cur_file_name_end) too_long();
@.Include file name ...@>
    for (; k>=cur_file_name; k--) *(k+l+1)=*k;
    strcpy(cur_file_name,temp_file_name);
    cur_file_name[l]='/'; /* \UNIX/ pathname separator */
@^system dependencies@>
    if ((cur_file=fopen(cur_file_name,"r"))!=NULL) {
      cur_line=0; print_where=true;
      goto restart; /* success */
    }
  }
@y
  if(false==set_path(include_path,getenv("CWEBINPUTS"))) {
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
@^system dependencies@>
    }
    if(k+l+2>=cur_file_name_end) too_long(); /* emergency break */
    strcpy(kk,cur_file_name);
    if((cur_file = fopen(temp_file_name,"r"))!=NULL) {
      cur_line=0; print_where=true; goto restart; /* success */
    }
    if((next_path_prefix = strchr(path_prefix,PATH_SEPARATOR))!=NULL)
      path_prefix = next_path_prefix+1;
    else break; /* no more paths to search; no file found */
  }
@z

Section 51.

@x l.677
  if (program==cweave) p->ilk=t, init_node(p);
@y
  if (program!=ctangle) p->ilk=t, init_node(p);
@z

Section 68.

@x l.1057
Some implementations may wish to pass the |history| value to the
operating system so that it can be used to govern whether or not other
programs are started. Here, for instance, we pass the operating system
a status of |EXIT_SUCCESS| if and only if only harmless messages were printed.
@^system dependencies@>
@y
On multi-tasking systems like the {\mc AMIGA} it is very convenient to
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

@x l.1069
  if (history > harmless_message) return EXIT_FAILURE;
  else return EXIT_SUCCESS;
@y
  switch(history) {
  case spotless: return RETURN_OK;
  case harmless_message: return RETURN_WARN;
  case error_message: return RETURN_ERROR;
  case fatal_message: default: return RETURN_FAIL;
  }
@z

Section 75.

@x l.1149
An omitted change file argument means that |"/dev/null"| should be used,
when no changes are desired.
@y
An omitted change file argument means that |"/dev/null"| or---on non-\UNIX/
systems the contents of the compile-time variable |DEV_NULL| (\TeX~Live) or
|_DEV_NULL| (Amiga)---should be used, when no changes are desired.
@z

@x l.1165
  strcpy(change_file_name,"/dev/null");
@y
  strcpy(change_file_name,"/dev/null");
#if defined DEV_NULL
  strncpy(change_file_name,DEV_NULL,max_file_name_length-2);
  change_file_name[max_file_name_length-2]='\0';
#elif defined _DEV_NULL
  strncpy(change_file_name,_DEV_NULL,max_file_name_length-2);
  change_file_name[max_file_name_length-2]='\0';
#endif
@^system dependencies@>
@z

@x l.1171
        if (*s=='.') dot_pos=s++;
        else if (*s=='/') dot_pos=NULL,name_pos=++s;
        else s++;
@y
        if (*s=='.') dot_pos=s++;
        else if (*s==DIR_SEPARATOR || *s==DEVICE_SEPARATOR || *s=='/')
          dot_pos=NULL,name_pos=++s;
        else s++;
@^system dependencies@>
@z

Section 80.

@x l.1246
for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++)
  flags[(eight_bits)*dot_pos]=flag_change;
@y
for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++)
  if(*dot_pos=='l') {
     use_language=++dot_pos;
     break;
  } else flags[(eight_bits)*dot_pos]=flag_change;
@z

Section 81.

@x l.1249
@ @<Print usage error message and quit@>=
{
if (program==ctangle)
  fatal(
"! Usage: ctangle [options] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n"
   ,"");
@.Usage:@>
else fatal(
"! Usage: cweave [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n"
   ,"");
}
@y
@ @<Print usage error message and quit@>=
switch (program) {
case ctangle: fatal(
"! Usage: ctangle [options] "@|
"webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n"
   ,""); break;
@.Usage:@>
case cweave: fatal(
"! Usage: cweave [options] "@|
"webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n"
   ,""); break;
default: fatal(
"! Usage: ctwill [options] "@|
"webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n"
   ,"");
}
@z

Add even more material ...

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

Section 85.

@x l.1286
@* Index.
@y
@* Language setting.  This global variable is set by the argument of the
`\.{+l}' (or `\.{-l}') command-line option.

@<Global var...@>=
const char *use_language=""; /* prefix of \.{cwebmac.tex} in \TEX/ output */

@* Path searching.  By default, \.{CTANGLE} and \.{CWEAVE} are looking
for include files along the path |CWEBINPUTS|.  By setting the environment
variable of the same name to a different search path you can suit your
personal needs.  If this variable is empty, some decent defaults are used
internally.  The following procedure takes care that these internal entries
are appended to any setting of the environmnt variable, so you don't have
to repeat the defaults.
@^system dependencies@>

@<Predecl...@>=
static boolean set_path(char *,char *);@/

@ @c
static boolean set_path(char *include_path,char *environment)
{
@#
#ifdef CWEBINPUTS
  strncpy(include_path,CWEBINPUTS,max_path_length);
  include_path[max_path_length]='\0';
#endif

  if(environment) {
    if(strlen(environment)+strlen(include_path) >= max_path_length) {
      err_print("! Include path too long"); return(false);
@.Include path too long@>
    } else {
      char string[max_path_length+2];
      sprintf(string,"%s%c%s",environment,PATH_SEPARATOR,include_path);
      strcpy(include_path,string);
    }
  }
  return(true);
}

@ The path search algorithm defined in section |@<Try to open...@>|
needs a few extra variables.

@d max_path_length (BUFSIZ-2)

@d PATH_SEPARATOR   separators[0]
@d DIR_SEPARATOR    separators[1]
@d DEVICE_SEPARATOR separators[2]

@<Global var...@>=
char include_path[max_path_length+2];@/
char *p, *path_prefix, *next_path_prefix;

#ifndef SEPARATORS
#define SEPARATORS "://"@^system dependencies@>
#endif
char separators[]=SEPARATORS;

@* Index.
@z
