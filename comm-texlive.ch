% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% comm-patch.ch, comm-ansi.ch, comm-extensions.ch, comm-output.ch,
% comm-i18n.ch and comm-texlive.ch that get tie'd into comm-w2c.ch that
% is used as a monolithic changefile for common.w in TeX Live.

Material in limbo.

@x l.20 and l.177 of COMM-PATCH.CH
\def\title{Common code for CTANGLE and CWEAVE (@VERSION@)}
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\title{Common code for CTANGLE and CWEAVE (\TeX~Live)}
@z

@x l.25 and l.183 of COMM-PATCH.CH
  \centerline{(@VERSION@)}
@y
  \centerline{(Version 3.64 [\TeX~Live])}
@z

@x l.20 of COMM-ANSI.CH
@i iso_types.w
@y
@s boolean int
@s uint8_t int
@s uint16_t int
@z

Section 2.

@x l.74 and l.28 of COMM-ANSI.CH
typedef bool boolean;
@y
@z

Section 4.

@x l.93 and l.19 of COMM-I18N.CH
  @<Initialize pointers@>@;
@y
  @<Initialize pointers@>@;
  @<Set up |PROGNAME| feature and initialize the search path mechanism@>@;
@z

Section 9.

@x l.181
    if ((*(k++) = c) != ' ') limit = k;
@y
    if ((*(k++) = c) != ' ' && c != '\r') limit = k;
@z

Section 10.

@x l.221 - no alt_web_file_name needed.
char alt_web_file_name[max_file_name_length]; /* alternate name to try */
@y
@z

Section 19.

@x l.394+ and l.82 of COMM-I18N.CH
if ((web_file=fopen(web_file_name,"r"))==NULL) {
  strcpy(web_file_name,alt_web_file_name);
  if ((web_file=fopen(web_file_name,"r"))==NULL)
       fatal(_("! Cannot open input file "), web_file_name);
}
@y
if ((found_filename=kpse_find_cweb(web_file_name))==NULL || @|
    (web_file=fopen(found_filename,"r"))==NULL) {
  fatal(_("! Cannot open input file "), web_file_name);
} else if (strlen(found_filename) < max_file_name_length) {
  /* Copy name for |#line| directives. */
  if (strcmp(web_file_name, found_filename))
    strcpy(web_file_name, found_filename +
      ((strncmp(found_filename,"./",2)==0) ? 2 : 0));
  free(found_filename);
} else fatal(_("! Filename too long\n"), found_filename);
@z

@x l.402+ and l.88 of COMM-I18N.CH
if ((change_file=fopen(change_file_name,"r"))==NULL)
       fatal(_("! Cannot open change file "), change_file_name);
@y
if ((found_filename=kpse_find_cweb(change_file_name))==NULL || @|
    (change_file=fopen(found_filename,"r"))==NULL) {
  fatal(_("! Cannot open change file "), change_file_name);
} else if (strlen(found_filename) < max_file_name_length) {
  /* Copy name for |#line| directives. */
  if (strcmp(change_file_name, found_filename))
    strcpy(change_file_name, found_filename +
      ((strncmp(found_filename,"./",2)==0) ? 2 : 0));
  free(found_filename);
} else fatal(_("! Filename too long\n"), found_filename);
@z

Section 22.

@x l.457 and l.74 of COMM-EXTENSIONS.CH
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
@y
@ When an \.{@@i} line is found in the |cur_file|, we must temporarily
stop reading it and start reading from the named include file.  The
\.{@@i} line should give a complete file name with or without
double quotes.
The actual file lookup is done with the help of the \Kpathsea/ library;
see section~\X90:File lookup with \Kpathsea/\X~for details. % FIXME
The remainder of the \.{@@i} line after the file name is ignored.
@z

Section 23.

@x l.475
  char temp_file_name[max_file_name_length];
  char *cur_file_name_end=cur_file_name+max_file_name_length-1;
  char *k=cur_file_name, *kk;
  int l; /* length of file name */
@y
  char *cur_file_name_end=cur_file_name+max_file_name_length-1;
  char *k=cur_file_name;
@z

@x l.489
  if ((cur_file=fopen(cur_file_name,"r"))!=NULL) {
@y
  if ((found_filename=kpse_find_cweb(cur_file_name))!=NULL && @|
      (cur_file=fopen(found_filename,"r"))!=NULL) {
    /* Copy name for |#line| directives. */
    if (strlen(found_filename) < max_file_name_length) {
      if (strcmp(cur_file_name, found_filename))
        strcpy(cur_file_name, found_filename +
          ((strncmp(found_filename,"./",2)==0) ? 2 : 0));
      free(found_filename);
    } else fatal(_("! Filename too long\n"), found_filename);
@z

Replaced by Kpathsea `kpse_find_file'.

@x l.493 and l.115 of COMM-EXTENSIONS.CH
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
@y
@z

Section 67.

@x l.1212
the names of those files. Most of the 128 flags are undefined but available
for future extensions.
@y
the names of those files. Most of the 128 flags are undefined but available
for future extensions.

We use `kpathsea' library functions to find literate sources.  When the files
you expect are not found, the thing to do is to enable `kpathsea' runtime
debugging by assigning to the |kpathsea_debug| variable a small number via the
`\.{-d}' option. The meaning of this number is shown below. To set more than
one debugging option, simply sum the corresponding numbers.
\medskip
\halign{\hskip5em\tt\hfil#&&\qquad\rm#\hfil\cr
 1&report `\.{stat}' calls\cr
 2&report lookups in all hash tables\cr
 4&report file openings and closings\cr
 8&report path information\cr
16&report directory list\cr
32&report on each file search\cr
64&report values of variables being looked up\cr}
\medskip
Debugging output is always written to |stderr|, and begins with the string
`\.{kdebug:}'.
@z

@x l.1218
@d show_happiness flags['h'] /* should lack of errors be announced? */
@y
@d show_happiness flags['h'] /* should lack of errors be announced? */
@d show_kpathsea_debug flags['d']
  /* should results of file searching be shown? */
@z

Section 68.

@x l.1234
show_banner=show_happiness=show_progress=1;
@y
@z

Section 71.

@x l.1285
@ We use all of |*argv| for the |web_file_name| if there is a |'.'| in it,
otherwise we add |".w"|. If this file can't be opened, we prepare an
|alt_web_file_name| by adding |"web"| after the dot.
The other file names come from adding other things
after the dot.  We must check that there is enough room in
|web_file_name| and the other arrays for the argument.
@y
@ We use all of |*argv| for the |web_file_name| if there is a |'.'| in it,
otherwise we add |".w"|.  The other file names come from adding other things
after the dot.  We must check that there is enough room in |web_file_name| and
the other arrays for the argument.
@z

@x l.1302 - no alt_web_file_name
  sprintf(alt_web_file_name,"%s.web",*argv);
@y
@z

Section 74.

@x l.1344 and l.305 of COMM-EXTENSIONS.CH
@<Handle flag...@>=
{
@y
@<Handle flag...@>=
{
  if (strcmp("-help",*argv)==0 || strcmp("--help",*argv)==0)
@.--help@>
    @<Display help message and |exit|@>@;
  if (strcmp("-version",*argv)==0 || strcmp("--version",*argv)==0)
@.--version@>
    @<Display version information and |exit|@>@;
  if (strcmp("-verbose",*argv)==0 || strcmp("--verbose",*argv)==0)
@.--verbose@>
  { show_banner=show_progress=show_happiness=1; continue; }
  if (strcmp("-quiet",*argv)==0 || strcmp("--quiet",*argv)==0)
@.--quiet@>
  { show_banner=show_progress=show_happiness=0; continue; }
@z

@x l.1348
  for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++)
@y
  for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++)
    if (*dot_pos=='v') {
      show_banner=show_progress=show_happiness=1;
    } else
    if (*dot_pos=='q') {
      show_banner=show_progress=show_happiness=0;
    } else
    if (*dot_pos=='d') {
      if (sscanf(*argv+2,"%u",&kpathsea_debug)!=1) @<Print usage error...@>@;
    } else
@z

Section 75.

@x l.1354+ and l.326 of COMM-EXTENSIONS.CH and l.281 of COMM-I18N.CH
{
switch (program) {
case ctangle: fatal(
_("! Usage: ctangle [options] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n")
   ,"");
@.Usage:@>
case cweave: fatal(
_("! Usage: cweave [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
   ,"");
default: fatal(
_("! Usage: ctwill [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
   ,"");
}
}
@y
cb_usage(program==ctangle ? "ctangle" : program==cweave ? "cweave" : "ctwill");
@.Usage:@>
@z

Section 77.

@x l.1375
FILE *active_file; /* currently active file for \.{CWEAVE} output */
@y
FILE *active_file; /* currently active file for \.{CWEAVE} output */
char *found_filename; /* filename found by |kpse_find_file| */
@z

Changes to former addenda.

@x l.350 of COMM-EXTENSIONS.CH
static boolean set_path(char *,char *);@/
@y
@z

@x l.358 of COMM-EXTENSIONS.CH and l.320 of COMM-I18N.CH
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
      err_print(_("! Include path too long")); return(0);
@.Include path too long@>
    } else {
      sprintf(string,"%s%c%s",environment,PATH_SEPARATOR,include_path);
      strcpy(include_path,string);
    }
  }
  return(1);
}

@y
@z

@x l.389 of COMM-EXTENSIONS.CH
@ The path search algorithm defined in section |@<Try to open...@>|
needs a few extra variables.

@d max_path_length (BUFSIZ-2)

@d PATH_SEPARATOR   separators[0]
@d DIR_SEPARATOR    separators[1]
@d DEVICE_SEPARATOR separators[2]

@<Other...@>=
char include_path[max_path_length+2];@/
char *p, *path_prefix, *next_path_prefix;

@y
@ The |scan_args| and |cb_show_banner| routines need a few extra variables.

@d PATH_SEPARATOR   separators[0]
@d DIR_SEPARATOR    separators[1]
@d DEVICE_SEPARATOR separators[2]

@d max_banner 50

@<Other...@>=
char cb_banner[max_banner];
@z

Material++

@x l.1418
@** Index.
@y
@* File lookup with \Kpathsea/.  The \.{CTANGLE} and \.{CWEAVE} programs from
the original \.{CWEB} package use the compile-time default directory or the
value of the environment variable \.{CWEBINPUTS} as an alternative place to be
searched for files, if they could not be found in the current directory.

This version uses the \Kpathsea/ mechanism for searching files.
The directories to be searched for come from three sources:
\smallskip
{\parindent5em
\item{(a)} a user-set environment variable \.{CWEBINPUTS}
    (overriden by \.{CWEBINPUTS\_cweb});
\item{(b)} a line in \Kpathsea/ configuration file \.{texmf.cnf},\hfil\break
    e.g. \.{CWEBINPUTS=.:\$TEXMF/texmf/cweb//}
    or \.{CWEBINPUTS.cweb=.:\$TEXMF/texmf/cweb//};
\item{(c)} compile-time default directories \.{.:\$TEXMF/texmf/cweb//}
    (specified in \.{texmf.in}).}

@d kpse_find_cweb(name) kpse_find_file(name,kpse_cweb_format,true)

@<Include files@>=
typedef bool boolean;
#define HAVE_BOOLEAN
#include <kpathsea/kpathsea.h> /* include every \Kpathsea/ header */
#include <w2c/config.h> /* \&{integer} */
#include <lib/lib.h> /* |versionstring| */
@#
#define CWEB
#include "help.h"

@ The simple file searching is replaced by the ``path searching'' mechanism
that the \Kpathsea/ library provides.

We set |kpse_program_name| to `\.{cweb}'.  This means if the variable
\.{CWEBINPUTS.cweb} is present in \.{texmf.cnf} (or \.{CWEBINPUTS\_cweb}
in the environment) its value will be used as the search path for
filenames.  This allows different flavors of \.{CWEB} to have
different search paths.

\&{FIXME}: Not sure this is the best way to go about this.

@<Set up |PROGNAME| feature and initialize the search path mechanism@>=
kpse_set_program_name(argv[0], "cweb");

@* System dependent changes. The most volatile stuff comes at the very end.

@ Modules for dealing with help messages and version info.

@<Display help message and |exit|@>=
cb_usagehelp(program==ctangle ? CTANGLEHELP :
  program==cweave ? CWEAVEHELP : CTWILLHELP, NULL);
@.--help@>

@ Special variants from \Kpathsea/ for i18n/t10n.

@<Predecl...@>=
void cb_show_banner (void); /* |extern| for option \.{+b} */
static void cb_usage (const_string str);@/
static void cb_usagehelp (const_string *message, const_string bug_email);@/

@ We simply filter the strings through the catalog (if available).

@c
void cb_show_banner (void)
{
  assert(cb_banner[0]!='\0');
  textdomain("cweb-tl");
@.cweb-tl.mo@>
  printf("%s%s\n", cb_banner, versionstring);
  textdomain("cweb");
@.cweb.mo@>
}

static void cb_usage (const_string str)
{
  textdomain("cweb-tl");
@.cweb-tl.mo@>
  fprintf(stderr, _("%s: Need one to three file arguments.\n"), str);
  fprintf(stderr, _("Try `%s --help' for more information.\n"), str);
@.--help@>
  textdomain("cweb");
@.cweb.mo@>
  history=fatal_message; exit(wrap_up());
}

static void cb_usagehelp (const_string *message, const_string bug_email)
{
  if (!bug_email)
    bug_email = "tex-k@@tug.org";
  textdomain("web2c-help");
@.web2c-help.mo@>
  while (*message) {
    printf("%s\n", strcmp("", *message) ? _(*message) : *message);
    ++message;
  }
  textdomain("cweb-tl");
@.cweb-tl.mo@>
  printf(_("\nEmail bug reports to %s.\n"), bug_email);
  textdomain("cweb");
@.cweb.mo@>
  history=spotless; exit(wrap_up());
}

@ The version information will not be translated.

@<Display version information and |exit|@>=
printversionandexit(cb_banner,
  program == ctwill ? "Donald E. Knuth" : "Silvio Levy and Donald E. Knuth",
  NULL, NULL);
@.--version@>

@** Index.
@z
