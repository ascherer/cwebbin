Changes for COMMON.W by Andreas Scherer, January 1, 2019.

This set of changes translates all string values written by the CWEB module
COMMON.W in case of errors or information requests with the help of 'gettext'
and the 'libintl' library.

This change file requires COMM-PATCH.CH, COMM-ANSI.CH, COMM-EXTENSIONS.CH,
and COMM-OUTPUT.CH to be applied as well.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

Section 4.

@x l.93
  @<Initialize pointers@>;
  @<Set the default options common to \.{CTANGLE} and \.{CWEAVE}@>;
  @<Scan arguments and open output files@>;
@y
  @<Initialize pointers@>@;
  @<Set locale and bind language catalogs@>@;
  @<Set the default options common to \.{CTANGLE} and \.{CWEAVE}@>@;
  @<Scan arguments and open output files@>@;
@z

Section 9.

@x l.184
      ungetc(c,fp); loc=buffer; err_print("! Input line too long");
@y
      ungetc(c,fp); loc=buffer; err_print(_("! Input line too long"));
@z

Section 13.

@x l.275
    err_print("! Missing @@x in change file");
@y
    err_print(_("! Missing @@x in change file"));
@z

Section 14.

@x l.286
    err_print("! Change file ended after @@x");
@y
    err_print(_("! Change file ended after @@x"));
@z

Serction 16.

@x l.334
      err_print("! Change file ended before @@y");
@y
      err_print(_("! Change file ended before @@y"));
@z

@x l.348
        err_print("! CWEB file ended during a change");
@y
        err_print(_("! CWEB file ended during a change"));
@z

Section 17.

@x l.360
  loc=buffer+2; err_print("! Where is the matching @@y?");
@y
  loc=buffer+2; err_print(_("! Where is the matching @@y?"));
@z

@x l.367
    err_print("of the preceding lines failed to match");
@y
    err_print(_("of the preceding lines failed to match"));
@z

Section 19.

@x l.397
       fatal("! Cannot open input file ", web_file_name);
@y
       fatal(_("! Cannot open input file "), web_file_name);
@z

@x l.403
       fatal("! Cannot open change file ", change_file_name);
@y
       fatal(_("! Cannot open change file "), change_file_name);
@z

Section 21.

@x l.442
      err_print("! Include file name not given");
@y
      err_print(_("! Include file name not given"));
@z

@x l.447
      err_print("! Too many nested includes");
@y
      err_print(_("! Too many nested includes"));
@z

Section 22.

@x l.469
        err_print("! Include file name too long"); goto restart;}
@y
        err_print(_("! Include file name too long")); goto restart;}
@z

Section 23.

@x l.517
  include_depth--; err_print("! Cannot open include file"); goto restart;
@y
  include_depth--; err_print(_("! Cannot open include file")); goto restart;
@z

Section 25.

@x l.540
    err_print("! Change file ended without @@z");
@y
    err_print(_("! Change file ended without @@z"));
@z

@x l.556
        err_print("! Where is the matching @@z?");
@y
        err_print(_("! Where is the matching @@z?"));
@z

Section 26.

@x l.576
    err_print("! Change file entry did not match");
@y
    err_print(_("! Change file entry did not match"));
@z

Section 39.

@x l.707
  if (byte_ptr+l>byte_mem_end) overflow("byte memory");
  if (name_ptr>=name_dir_end) overflow("name");
@y
  if (byte_ptr+l>byte_mem_end) overflow(_("byte memory"));
  if (name_ptr>=name_dir_end) overflow(_("name"));
@z

Section 47.

@x l.867
  if (s+name_len>byte_mem_end) overflow("byte memory");
  if (name_ptr+1>=name_dir_end) overflow("name");
@y
  if (s+name_len>byte_mem_end) overflow(_("byte memory"));
  if (name_ptr+1>=name_dir_end) overflow(_("name"));
@z

Section 48.

@x l.895
  if (name_ptr>=name_dir_end) overflow("name");
@y
  if (name_ptr>=name_dir_end) overflow(_("name"));
@z

@x l.900
  if (s+name_len>byte_mem_end) overflow("byte memory");
@y
  if (s+name_len>byte_mem_end) overflow(_("byte memory"));
@z

Section 50.

@x l.945
      printf("\n! Ambiguous prefix: matches <");
@y
      fputs(_("\n! Ambiguous prefix: matches <"),stdout);
@z

@x l.948
      printf(">\n and <");
@y
      fputs(_(">\n and <"),stdout);
@z

Section 52.

@x l.974
      printf("\n! New name is a prefix of <");
@y
      fputs(_("\n! New name is a prefix of <"),stdout);
@z

@x l.986
      printf("\n! New name extends <");
@y
      fputs(_("\n! New name extends <"),stdout);
@z

@x l.992
    printf("\n! Section name incompatible with <");
@y
    fputs(_("\n! Section name incompatible with <"),stdout);
@z

@x l.995
    printf(">,\n which abbreviates <");
@y
    fputs(_(">,\n which abbreviates <"),stdout);
@z

Section 59.

@x l.1117
  printf(". (l. %d of change file)\n", change_line);
else if (include_depth==0) printf(". (l. %d)\n", cur_line);
  else printf(". (l. %d of include file %s)\n", cur_line, cur_file_name);
@y
  printf(_(". (l. %d of change file)\n"), change_line);
else if (include_depth==0) printf(_(". (l. %d)\n"), cur_line);
  else printf(_(". (l. %d of include file %s)\n"), cur_line, cur_file_name);
@z

Section 62.

@x l.1162
case spotless: if (show_happiness) printf("(No errors were found.)\n"); break;
case harmless_message:
  printf("(Did you see the warning message above?)\n"); break;
case error_message:
  printf("(Pardon me, but I think I spotted something wrong.)\n"); break;
case fatal_message: printf("(That was a fatal error, my friend.)\n");
@y
case spotless:
  if (show_happiness) puts(_("(No errors were found.)")); break;
case harmless_message:
  puts(_("(Did you see the warning message above?)")); break;
case error_message:
  puts(_("(Pardon me, but I think I spotted something wrong.)")); break;
case fatal_message:
  puts(_("(That was a fatal error, my friend.)"));
@z

Section 65.

@x l.1194
  printf("\n! Sorry, %s capacity exceeded",t); fatal("","");
@y
  printf(_("\n! Sorry, %s capacity exceeded"),t); fatal("","");
@z

Section 66.

@x l.1203
@d confusion(s) fatal("! This can't happen: ",s)
@y
@d confusion(s) fatal(_("! This can't happen: "),s)
@z

Section 75.

@x l.1354 and l.326 of COMM-EXTENSIONS.CH
switch (program) {
case ctangle: fatal(
"! Usage: ctangle [options] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n"
   ,"");
@.Usage:@>
case cweave: fatal(
"! Usage: cweave [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n"
   ,"");
default: fatal(
"! Usage: ctwill [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n"
   ,"");
}
@y
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
@z

Section 76.

@x l.1364
@ @<Complain about arg...@>= fatal("! Filename too long\n", *argv);
@y
@ @<Complain about arg...@>= fatal(_("! Filename too long\n"), *argv);
@z

Section 77.

@x l.1377+ and l.76 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", C_file_name);
@y
    fatal(_("! Cannot open output file "), C_file_name);
@z

@x l.86 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", check_file_name);
@y
    fatal(_("! Cannot open output file "), check_file_name);
@z

@x l.1377+ and l.77 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", tex_file_name);
@y
    fatal(_("! Cannot open output file "), tex_file_name);
@z

@x l.100 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", check_file_name);
@y
    fatal(_("! Cannot open output file "), check_file_name);
@z

@x l.1418 and l.379 of COMM-EXTENSIONS.CH
      err_print("! Include path too long"); return(0);
@y
      err_print(_("! Include path too long")); return(0);
@z

More new material.

@x l.1418
@** Index.
@y
@* Internationalization.  You may have noticed that almost all \.{"strings"}
in the \.{CWEB} sources are placed in the context of the `|_|'~macro.
This is just a shortcut for the `|@!gettext|' function from the ``GNU~gettext
utilities.'' For systems that do not have this library installed, we wrap
things for neutral behavior without internationalization.

@d _(STRING) gettext(STRING)

@<Include files@>=
#ifndef HAVE_GETTEXT
#define HAVE_GETTEXT 0
#endif
@#
#if HAVE_GETTEXT
#include <locale.h>
#include <libintl.h>
#else
#define setlocale(A,B) ""
#define bindtextdomain(A,B) ""
#define textdomain(A) ""
#define gettext(A) A
#endif

@ If a translation catalog for your personal \.{LANGUAGE} is installed at the
appropriate place, \.{CTANGLE} and \.{CWEAVE} will talk to you in your favorite
language.  Catalog \.{cweb} contains all strings from ``plain \.{CWEB}.''
@.cweb.mo@>

If such a translation file is not available, you may want to improve this
system by checking out the sources and translating the strings in file
\.{cweb.pot}, and submitting the resulting \.{*.po} file(s) to the maintainer
at \.{https://github.com/ascherer/cwebbin}.

@<Set locale...@>=
setlocale(LC_MESSAGES, setlocale(LC_CTYPE, ""));
bindtextdomain("cweb", "/usr/share/locale/");
textdomain("cweb"); /* the majority of |"strings"| come from ``plain \.{CWEB}'' */
@.cweb.mo@>

@** Index.
@z
