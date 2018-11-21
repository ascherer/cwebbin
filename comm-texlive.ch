% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

FIXME: Apply a more generic @VERSION@ scheme.

@x l.20 and l.175 of COMM-PATCH.CH
\def\title{Common code for CTANGLE and CWEAVE (Version 3.64 [CWEBbin 2018])}
\def\topofcontents{\null\vfill
  \centerline{\titlefont Common code for {\ttitlefont CTANGLE} and
    {\ttitlefont CWEAVE}}
  \vskip 15pt
  \centerline{(Version 3.64 [CWEBbin 2018])}
  \vfill}
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}}
\def\title{Common code for CTANGLE and CWEAVE (Version 3.64k)}
\def\topofcontents{\null\vfill
  \centerline{\titlefont Common code for {\ttitlefont CTANGLE} and
    {\ttitlefont CWEAVE}}
  \vskip 15pt
  \centerline{(Version 3.64k)}
  \vfill}
@z

@x l.74 and l.25 of COMM-ANSI.CH
typedef bool boolean;
@y
@z

Section 4.

@x l.93
  @<Initialize pointers@>;
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

@x l.394+ and l.57 of COMM-I18N.CH
if ((web_file=fopen(web_file_name,"r"))==NULL) {
  strcpy(web_file_name,alt_web_file_name);
  if ((web_file=fopen(web_file_name,"r"))==NULL)
       fatal(_("! Cannot open input file "), web_file_name);
}
@y
if ((found_filename=kpse_find_cweb(web_file_name))==NULL ||
    (web_file=fopen(found_filename,"r"))==NULL) {
  fatal(_("! Cannot open input file "), web_file_name);
} else if (strlen(found_filename) < max_file_name_length) {
  strcpy(web_file_name, found_filename);
  free(found_filename);
}
@z

@x l.402+ and l.63 of COMM-I18N.CH
if ((change_file=fopen(change_file_name,"r"))==NULL)
       fatal(_("! Cannot open change file "), change_file_name);
@y
if ((found_filename=kpse_find_cweb(change_file_name))==NULL ||
    (change_file=fopen(found_filename,"r"))==NULL) {
  fatal(_("! Cannot open change file "), change_file_name);
} else if (strlen(found_filename) < max_file_name_length) {
  strcpy(change_file_name, found_filename);
  free(found_filename);
}
@z

Section 23.

Revert change from COMM-EXTENSIONS.CH: @include file search is done with
KPathSea, and COMM-TEXLIVE.CH doesn't change the description.  We restore
the original wording from COMMON.W.  FIXME!

@x l.457
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
If the environment variable \.{CWEBINPUTS} is set, or if the compiler flag
of the same name was defined at compile time,
\.{CWEB} will look for include files in the directory thus named, if
it cannot find them in the current directory.
(Colon-separated paths are not supported.)
The remainder of the \.{@@i} line after the file name is ignored.
@z

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
  if ((found_filename=kpse_find_cweb(cur_file_name))!=NULL &&
      (cur_file=fopen(found_filename,"r"))!=NULL) {
    /* Copy name for |#line| directives. */
    if (strlen(found_filename) < max_file_name_length) {
      strcpy(cur_file_name, found_filename);
      free(found_filename);
    }
@z

Replaced by Kpathsea `kpse_find_file'

@x l.493 and l.82 of COMM-EXTENSIONS.CH
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

@x l.1212 and l.191 of COMM-EXTENSIONS.CH
the names of those files. Most of the 256 flags are undefined but available
for future extensions.
@y
the names of those files. Most of the 256 flags are undefined but available
for future extensions.

We use `kpathsea' library functions to find literate sources and
NLS configuration files. When the files you expect are not
being found, the thing to do is to enable `kpathsea' runtime
debugging by assigning to |kpathsea_debug| variable a small number
via `\.{-d}' option. The meaning of number is shown below. To set
more than one debugging options sum the corresponding numbers.
$$\halign{\hskip5em\tt\hfil#&&\qquad\tt#\cr
 1&report `\.{stat}' calls\cr
 2&report lookups in all hash tables\cr
 4&report file openings and closings\cr
 8&report path information\cr
16&report directory list\cr
32&report on each file search\cr
64&report values of variables being looked up\cr}$$
Debugging output is always written to |stderr|, and begins with the string
`\.{kdebug:}'.
@z

@x l.1218
@d show_happiness flags['h'] /* should lack of errors be announced? */
@y
@d show_kpathsea_debug flags['d']
  /* should results of file searching be shown? */
@d show_happiness flags['h'] /* should lack of errors be announced? */
@z

@x l.1233+ and l.216 of COMM-EXTENSIONS.CH
show_banner=show_happiness=show_progress=indent_param_decl=order_decl_stmt=1;
@y
indent_param_decl=order_decl_stmt=1;
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

@x l.1344
@ @<Handle flag...@>=
{
@y
@ @<Handle flag...@>=
{
  if (strcmp("-help",*argv)==0 || strcmp("--help",*argv)==0)
    @<Display help message and exit@>@;
  if (strcmp("-version",*argv)==0 || strcmp("--version",*argv)==0)
    @<Display version information and exit@>@;
@z

@x l.1347
  else flag_change=1;
@y
  else flag_change=1;
  if (*(*argv+1)=='d')
    if (sscanf(*argv+2,"%u",&kpathsea_debug)!=1) @<Print usage error...@>@;
@z

Section 75.

@x l.1354+ and l.222 of COMM-I18N.CH
if (program==ctangle)
  fatal(
_("! Usage: ctangle [options] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n")
   ,"");
@.Usage:@>
else fatal(
_("! Usage: cweave [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
   ,"");
@y
cb_usage(program==ctangle ? "ctangle" : "cweave");
@.Usage:@>
@z

Section 77.

@x l.1375
FILE *active_file; /* currently active file for \.{CWEAVE} output */
@y
FILE *active_file; /* currently active file for \.{CWEAVE} output */
char *found_filename; /* filename found by |kpse_find_file| */
@z

@x l.1418
@** Index.
@y
@* System dependent changes.

@ Modules for dealing with help messages and version info.

@<Display help message and exit@>=
cb_usagehelp(program==ctangle ? CTANGLEHELP : CWEAVEHELP, NULL);
@.--help@>

@ Special variants from \Kpathsea/ for i18n/t10n.

@<Predecl...@>=
static void cb_usage (const_string str);@/
static void cb_usagehelp (const_string *message, const_string bug_email);@/

@ We simply filter the strings through the catalog (if available).

@c
static void cb_usage (const_string str)
{
  fprintf(stderr, _("%s: Need one to three file arguments.\n"), str);
  fprintf(stderr, _("Try `%s --help' for more information.\n"), str);
  history=fatal_message; exit(wrap_up());
}

static void cb_usagehelp (const_string *message, const_string bug_email)
{
  if (!bug_email)
    bug_email = "tex-k@@tug.org";
  while (*message) {
    printf("%s\n", strcmp("", *message) ? _(*message) : *message);
    ++message;
  }
  printf(_("\nEmail bug reports to %s.\n"), bug_email);
  history=spotless; exit(wrap_up());
}

@ Will have to change these if the version numbers change (ouch).

@d ctangle_banner "CTANGLE (CWEBBIN, TeX Live 2019/dev) 3.64"
@d cweave_banner "CWEAVE (CWEBBIN, TeX Live 2019/dev) 3.64"

@<Display version information and exit@>={
  puts(program==ctangle ? ctangle_banner : cweave_banner);
@.--version@>
  puts("Copyright 2019 Silvio Levy and Donald E. Knuth");
  history=spotless; exit(wrap_up());
}

@* File lookup with kpathsea.

@<Include files@>=
typedef bool boolean;
#define HAVE_BOOLEAN
@#
#define CWEB
#include "cpascal.h"
#include <kpathsea/kpathsea.h> /* include every \Kpathsea/ header */
#include "help.h"

@ The \.{ctangle} and \.{cweave} programs from the original \.{CWEB}
package use the compile-time default directory or the value of the
environment variable \.{CWEBINPUTS} as an alternative place to be
searched for files, if they could not be found in the current
directory.

This version uses the \Kpathsea/ mechanism for searching files.
The directories to be searched for come from three sources:

 (a)~a user-set environment variable \.{CWEBINPUTS}
    (overriden by \.{CWEBINPUTS\_cweb});\par
 (b)~a line in \Kpathsea/ configuration file \.{texmf.cnf},\hfil\break
    e.g. \.{CWEBINPUTS=.:\$TEXMF/texmf/cweb//}
    or \.{CWEBINPUTS.cweb=.:\$TEXMF/texmf/cweb//};\hangindent=2\parindent\par
 (c)~compile-time default directories \.{.:\$TEXMF/texmf/cweb//}
    (specified in \.{texmf.in}).

@d kpse_find_cweb(name) kpse_find_file(name,kpse_cweb_format,true)

@ The simple file searching is replaced by `path searching' mechanism
that \Kpathsea/ library provides.

We set |kpse_program_name| to `\.{cweb}'.  This means if the variable
\.{CWEBINPUTS.cweb} is present in \.{texmf.cnf} (or \.{CWEBINPUTS\_cweb}
in the environment) its value will be used as the search path for
filenames.  This allows different flavors of \.{CWEB} to have
different search paths.

FIXME: Not sure this is the best way to go about this.

@<Set up |PROGNAME| feature and initialize the search path mechanism@>=
kpse_set_program_name(argv[0], "cweb");

@** Index.
@z
