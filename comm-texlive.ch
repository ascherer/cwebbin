% Original Kpathsea changes for CWEB by Wlodek Bzyl and Olaf Weber
% This file is in the Public Domain.

% Most of the original changes were merged with the set of change files
% of the CWEBbin project.  This stripped change file is last in line of
% comm-patch.ch, comm-extensions.ch, comm-output.ch, comm-i18n.ch, and
% comm-texlive.ch that get tie'd into comm-w2c.ch that is used as a
% monolithic changefile for common.w in TeX Live.

Material in limbo.

@x l.25 and l.193 of COMM-PATCH.CH
\def\title{Common code for CTANGLE and CWEAVE (@VERSION@)}
@y
\def\Kpathsea/{{\mc KPATHSEA\spacefactor1000}} \ifacro\sanitizecommand\Kpathsea{KPATHSEA}\fi
\def\title{Common code for CTANGLE and CWEAVE (4.9 [\TeX~Live])}
@z

@x l.30 and l.199 of COMM-PATCH.CH
  \centerline{(@VERSION@)}
@y
  \centerline{(Version 4.9 [\TeX~Live])}
@z

@x l.32
\def\botofcontents{\vfill
@y
\def\covernote{\vbox{%
@z

@x l.45
}
@y
}}\datecontentspage
@z

@x l.72 and l.215 of COMM-PATCH.CH
@i comm-foo.h
@y
@i comm-w2c.h
@z

Section 20.

@x l.99
  @<Initialize pointers@>@;
@y
  @<Initialize pointers@>@;
  @<Set up \.{PROGNAME} feature and initialize the search path mechanism@>@;
@z

Section 23.

@x l.165
    if ((*(k++) = c) != ' ') limit = k;
@y
    if ((*(k++) = c) != ' ' && c != '\r') limit = k;
@z

Section 25.

@x l.197 - no alt_web_file_name needed.
static char alt_web_file_name[max_file_name_length]; /* alternate name to try */
@y
char *found_filename; /* filename found by |kpse_find_file| */
@z

Section 36.

@x l.393 and l.56 of COMM-EXTENSIONS.CH
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
@y
@ When an \.{@@i} line is found in the |cur_file|, we must temporarily
stop reading it and start reading from the named include file.  The
\.{@@i} line should give a complete file name with or without
double quotes.
The actual file lookup is done with the help of the \Kpathsea/ library;
see section~\X93:File lookup with \Kpathsea/\X~for details. % FIXME
The remainder of the \.{@@i} line after the file name is ignored.
@^system dependencies@>
@z

@x l.408
  char temp_file_name[max_file_name_length];
  char *cur_file_name_end=cur_file_name+max_file_name_length-1;
  char *kk, *k=cur_file_name;
  size_t l; /* length of file name */
@y
  char *cur_file_name_end=cur_file_name+max_file_name_length-1;
  char *k=cur_file_name;
@z

Replaced by Kpathsea `kpse_find_file'.

@x l.422
  if ((cur_file=fopen(cur_file_name,"r"))!=NULL) {
@y
  if ((found_filename=kpse_find_cweb(cur_file_name))!=NULL @|
      && (cur_file=fopen(found_filename,"r"))!=NULL) {
    /* Copy name for \#\&{line} directives. */
    if (strlen(found_filename) < max_file_name_length) {
      if (strcmp(cur_file_name, found_filename))
        strcpy(cur_file_name, found_filename +
          ((strncmp(found_filename,"./",2)==0) ? 2 : 0));
      free(found_filename);
    } else fatal(_("! Filename too long\n"), found_filename);
@z

@x l.426 and l.95 of COMM-EXTENSIONS.CH
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
@y
@z

Section 41.

@x l.543 and l.128 of COMM-I18N.CH
if ((web_file=fopen(web_file_name,"r"))==NULL) {
  strcpy(web_file_name,alt_web_file_name);
  if ((web_file=fopen(web_file_name,"r"))==NULL)
       fatal(_("! Cannot open input file "), web_file_name);
}
@y
if ((found_filename=kpse_find_cweb(web_file_name))==NULL @|
    || (web_file=fopen(found_filename,"r"))==NULL)
  fatal(_("! Cannot open input file "), web_file_name);
else if (strlen(found_filename) < max_file_name_length) {
  /* Copy name for \#\&{line} directives. */
  if (strcmp(web_file_name, found_filename))
    strcpy(web_file_name, found_filename +
      ((strncmp(found_filename,"./",2)==0) ? 2 : 0));
  free(found_filename);
} else fatal(_("! Filename too long\n"), found_filename);
@z

@x l.542 and l.134 of COMM-I18N.CH
if ((change_file=fopen(change_file_name,"r"))==NULL)
       fatal(_("! Cannot open change file "), change_file_name);
@y
if ((found_filename=kpse_find_cweb(change_file_name))==NULL @|
    || (change_file=fopen(found_filename,"r"))==NULL)
  fatal(_("! Cannot open change file "), change_file_name);
else if (strlen(found_filename) < max_file_name_length) {
  /* Copy name for \#\&{line} directives. */
  if (strcmp(change_file_name, found_filename))
    strcpy(change_file_name, found_filename +
      ((strncmp(found_filename,"./",2)==0) ? 2 : 0));
  free(found_filename);
} else fatal(_("! Filename too long\n"), found_filename);
@z

Section 46.

@x l.619
@d hash_size 353 /* should be prime */
@y
@d hash_size 8501 /* should be prime */
@z

Section 73.

@x l.1120
or flags to be turned on (beginning with |"+"|).
@y
or flags to be turned on (beginning with |"+"|).
\TeX~Live's \.{CWEB} executables accept several ``long options'' as well;
see section |@<Handle flag arg...@>| for details.
@z

Section 74.  CWEB in TeX Live runs quietly by default.

@x l.1140
show_banner=show_happiness=show_progress=make_xrefs=true;
@y
make_xrefs=true;
@z

Section 75.

@x l.1144
file.  It may have an extension, or it may omit the extension to get |".w"| or
|".web"| added.  The \TEX/ output file name is formed by replacing the \.{CWEB}
@y
file.  It may have an extension, or it may omit the extension to get |".w"|
added.  The \TEX/ output file name is formed by replacing the \.{CWEB}
@z

Section 77.

@x l.1188
@ We use all of |*argv| for the |web_file_name| if there is a |'.'| in it,
otherwise we add |".w"|. If this file can't be opened, we prepare an
|alt_web_file_name| by adding |"web"| after the dot.
@y
@ We use all of |*argv| for the |web_file_name| if there is a |'.'| in it,
otherwise we add |".w"|.
@z

@x l.1205 - no alt_web_file_name
  sprintf(alt_web_file_name,"%s.web",*argv);
@y
@z

Section 80.

@x l.1246 and l.199 of COMM-EXTENSIONS.CH
for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++)
  if(*dot_pos=='l') {
     use_language=++dot_pos;
     break;
  } else flags[(eight_bits)*dot_pos]=flag_change;
@y
{
  if (strcmp("-help",*argv)==0 || strcmp("--help",*argv)==0)
@.--help@>
    @<Display help message and |exit|@>@;
  if (strcmp("-version",*argv)==0 || strcmp("--version",*argv)==0)
@.--version@>
    @<Display version information and |exit|@>@;
  if (strcmp("-verbose",*argv)==0 || strcmp("--verbose",*argv)==0)
@.--verbose@>
    strcpy(*argv,"-v");
  if (strcmp("-quiet",*argv)==0 || strcmp("--quiet",*argv)==0)
@.--quiet@>
      strcpy(*argv,"-q");
  for(dot_pos=*argv+1;*dot_pos>'\0';dot_pos++) {
    switch (*dot_pos) {
    case 'v': show_banner=show_progress=show_happiness=true; continue;
    case 'q': show_banner=show_progress=show_happiness=false; continue;
    case 'd':
      if (sscanf(++dot_pos,"%u",&kpathsea_debug)!=1) @<Print usage error...@>@;
      while (isdigit(*dot_pos)) dot_pos++; /* skip numeric part */
      dot_pos--; /* reset to final digit */
      continue;
    case 'l': use_language=++dot_pos; break; /* from |switch| */
    default: flags[(eight_bits)*dot_pos]=flag_change; continue;
    }
    break; /* from |for| loop */
  }
}
@z

Section 81.

@x l.1249 and l.221 of COMM-EXTENSIONS.CH and l.272 of COMM-I18N.CH
@ @<Print usage error message and quit@>=
switch (program) {
case ctangle: fatal(
_("! Usage: ctangle [options] "@|
"webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n")
   ,""); break;
@.Usage:@>
case cweave: fatal(
_("! Usage: cweave [options] "@|
"webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
   ,""); break;
default: fatal(
_("! Usage: ctwill [options] "@|
"webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
   ,"");
}
@y
@ @<Print usage error message and quit@>=
cb_usage(program==ctangle ? "ctangle" : program==cweave ? "cweave" : "ctwill");
@.Usage:@>
@z

Changes to former addenda.

@x l.269 of COMM-EXTENSIONS.CH and l.314 of COMM-I18N.CH
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
      err_print(_("! Include path too long")); return(false);
@.Include path too long@>
    } else {
      char string[max_path_length+2];
      sprintf(string,"%s%c%s",environment,PATH_SEPARATOR,include_path);
      strcpy(include_path,string);
    }
  }
  return(true);
}
@y
@z

@x l.303 of COMM-EXTENSIONS.CH
@ The path search algorithm defined in section |@<Try to open...@>|
needs a few extra variables.

@d max_path_length (BUFSIZ-2)

@d PATH_SEPARATOR   separators[0]
@d DIR_SEPARATOR    separators[1]
@d DEVICE_SEPARATOR separators[2]

@<Global var...@>=
char include_path[max_path_length+2];@/
char *p, *path_prefix, *next_path_prefix;

@y
@* User communication.  The |scan_args| and |cb_show_banner| routines and the
|bindtextdomain| argument string need a few extra variables.

@d max_banner 50

@d PATH_SEPARATOR   separators[0]
@d DIR_SEPARATOR    separators[1]
@d DEVICE_SEPARATOR separators[2]

@<Global var...@>=
char cb_banner[max_banner];@/
string texmf_locale;@/
@z

Material++

@x l.346 of COMM-I18N.CH
@* Internationalization.  If a translation catalog for your personal
\.{LANGUAGE} is installed at the appropriate place, \.{CTANGLE} and \.{CWEAVE}
will talk to you in your favorite language.  Catalog \.{cweb} contains all
strings from ``plain \.{CWEB}.''
@.cweb.mo@>

If such a translation file is not available, you may want to improve this
system by checking out the sources and translating the strings in file
\.{cweb.pot}, and submitting the resulting \.{*.po} file(s) to the maintainer
at \.{https://github.com/ascherer/cwebbin}.
@y
@* Internationalization.  If translation catalogs for your personal
\.{LANGUAGE} are installed at the appropriate place, \.{CTANGLE} and \.{CWEAVE}
will talk to you in your favorite language.  Catalog \.{cweb} contains all
strings from ``plain \.{CWEB},'' catalog \.{cweb-tl} contains a few extra
strings specific to the \TeX~Live interface, and catalog \.{web2c-help}
contains the ``\.{--help}'' texts for \.{CTANGLE} and \.{CWEAVE}.
@.cweb.mo@>
@.cweb-tl.mo@>
@.web2c-help.mo@>
@.--help@>

If such translation files are not available, you may want to improve this
system by checking out the sources and translating the strings in files
\.{cweb.pot}, \.{cweb-tl.pot}, and \.{web2c-help.pot}, and submitting the
resulting \.{*.po} files to the maintainers at \.{tex-k@@tug.org}.

\medskip \noindent \&{Note to maintainers:} \.{CWEB} in \TeX~Live generally
does \\{not} set |HAVE_GETTEXT| at build-time, so \.{i18n} is ``off'' by
default.  If you want to create \.{CWEB} executables with NLS support, you
have to recompile the \TeX~Live sources with a positive value for
|HAVE_GETTEXT| in \.{comm-w2c.h}.  Also you have to ``compile'' the NLS
catalogs provided for \.{CWEB} in the source tree with \.{msgfmt} and store the
resulting \.{.mo} files at an appropriate place in the file system.

Plans for \TeX~Live are to store NLS catalogs inside the ``\TeX\ Directory
Structure'' (TDS) and look them up with the help of the configuration variable
``|TEXMFLOCALEDIR|,'' which should contain a single absolute path definition.
Below we use the \Kpathsea/ function |kpse_var_expand| to evaluate this
variable from various origins and redirect the ``GNU~gettext utilities''
to a possibly different location than the canonical \.{/usr/share/locale}.

There are several ways to set |TEXMFLOCALEDIR|:
\smallskip
{\parindent5em
\item{(a)} a user-set environment variable \.{TEXMFLOCALEDIR}\hfil\break
    (overridden by \.{TEXMFLOCALEDIR\_cweb});
\item{(b)} a line in \Kpathsea/ configuration file \.{texmf.cnf},\hfil\break
    e.g., \.{TEXMFLOCALEDIR=\$TEXMFMAIN/locale}\hfil\break
    or \.{TEXMFLOCALEDIR.cweb=\$TEXMFMAIN/locale}.\par}
@z

@x l.368 of COMM-I18N.CH
bindtextdomain("cweb", "/usr/share/locale/");
@y
texmf_locale = kpse_var_expand ("${TEXMFLOCALEDIR}");

bindtextdomain("cweb",
  bindtextdomain("cweb-tl",
    bindtextdomain("web2c-help", @|
      strcmp(texmf_locale, "") ?
        texmf_locale : "/usr/share/locale")));

free(texmf_locale);
@z

@x l.1286
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
    (overridden by \.{CWEBINPUTS\_cweb});
\item{(b)} a line in \Kpathsea/ configuration file \.{texmf.cnf},\hfil\break
    e.g., \.{CWEBINPUTS=\$TEXMFDOTDIR:\$TEXMF/texmf/cweb//}\hfil\break
    or \.{CWEBINPUTS.cweb=\$TEXMFDOTDIR:\$TEXMF/texmf/cweb//};
\item{(c)} compile-time default directories (specified in
    \.{texmf.in}),\hfil\break
    i.e., \.{\$TEXMFDOTDIR:\$TEXMF/texmf/cweb//}.\par}
@.CWEBINPUTS@>

@s const_string int
@s string int

@d kpse_find_cweb(name) kpse_find_file(name,kpse_cweb_format,true)

@<Include files@>=
#include <kpathsea/kpathsea.h> /* include every \Kpathsea/ header;
  |@!kpathsea_debug|, |@!const_string|, |@!string| */
#include <w2c/config.h> /* \&{integer} */
#include <lib/lib.h> /* |@!versionstring| */

@ We set |kpse_program_name| to `\.{cweb}'.  This means if the variable
\.{CWEBINPUTS.cweb} is present in \.{texmf.cnf} (or \.{CWEBINPUTS\_cweb}
in the environment) its value will be used as the search path for filenames.
This allows different flavors of \.{CWEB} to have different search paths.
@.CWEBINPUTS@>

@<Set up \.{PROGNAME} feature and initialize the search path mechanism@>=
kpse_set_program_name(argv[0], "cweb");

@ When the files you expect are not found, the thing to do is to enable
\Kpathsea/ runtime debugging by assigning to the |kpathsea_debug| variable a
small number via the `\.{-d}' option. The meaning of this number is shown
below. To set more than one debugging option, simply sum the corresponding
numbers.
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

@* System dependent changes. The most volatile stuff comes at the very end.

Modules for dealing with help messages and version info.

@<Include files@>=@^system dependencies@>
#define CWEB
#include "help.h" /* |@!CTANGLEHELP|, |@!CWEAVEHELP|, |@!CTWILLHELP| */

@ @<Display help message and |exit|@>=
cb_usagehelp(program==ctangle ? CTANGLEHELP :
  program==cweave ? CWEAVEHELP : CTWILLHELP);
@.--help@>

@ Special variants from Web2c's `\.{lib/usage.c}', adapted for
\.{i18n}/\.{t10n}.  We simply filter the strings through the catalogs
(if available).

@<Predecl...@>=
static void cb_usage (const_string str);@/
static void cb_usagehelp (const_string *message);@/

@ @c
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

static void cb_usagehelp (const_string *message)
{
  textdomain("web2c-help");
@.web2c-help.mo@>
  while (*message) {
    /* empty string \.{""} has special meaning for |gettext| */
    printf("%s\n", strcmp("", *message) ? _(*message) : *message);
    ++message;
  }
  textdomain("cweb-tl");
@.cweb-tl.mo@>
  printf(_("\nPackage home page: %s.\n"), "https://ctan.org/pkg/cweb");
  textdomain("cweb");
@.cweb.mo@>
  history=spotless; exit(wrap_up());
}

@ The version information will not be translated, it uses a generic text
template in English.

@<Display version information and |exit|@>=
printversionandexit(cb_banner,
  program == ctwill ? "Donald E. Knuth" : "Silvio Levy and Donald E. Knuth",
  NULL, "Contemporary development on https://github.com/ascherer/cweb.\n");
@.--version@>

@ But the ``banner'' is, at least the first part.

@c
void cb_show_banner (void)
{
  textdomain("cweb-tl");
@.cweb-tl.mo@>
  printf("%s%s\n", _(cb_banner), versionstring);
  textdomain("cweb");
@.cweb.mo@>
}

@** Index.
@z
