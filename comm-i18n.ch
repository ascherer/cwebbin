Changes for COMMON.W by Andreas Scherer, January  2021.

This set of changes translates all string values written by the CWEB module
COMMON.W in case of errors or information requests with the help of 'gettext'
and the 'libintl' library.

This change file requires COMM-PATCH.CH, COMM-EXTENSIONS.CH, and COMM-OUTPUT.CH
to be applied as well.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

Section 20.

@x l.105
  @<Set the default options common to \.{CTANGLE} and \.{CWEAVE}@>@;
@y
  @<Set locale and bind language catalogs@>@;
  @<Set the default options common to \.{CTANGLE} and \.{CWEAVE}@>@;
@z

Section 25.

@x l.181
      ungetc(c,fp); loc=buffer; err_print("! Input line too long");
@y
      ungetc(c,fp); loc=buffer; err_print(_("! Input line too long"));
@z

Section 29.

@x l.267
    err_print("! Missing @@x in change file");
@y
    err_print(_("! Missing @@x in change file"));
@z

Section 30.

@x l.278
    err_print("! Change file ended after @@x");
@y
    err_print(_("! Change file ended after @@x"));
@z

Serction 32.

@x l.326
      err_print("! Change file ended before @@y");
@y
      err_print(_("! Change file ended before @@y"));
@z

@x l.340
        err_print("! CWEB file ended during a change");
@y
        err_print(_("! CWEB file ended during a change"));
@z

Section 33.

@x l.352
  loc=buffer+2; err_print("! Where is the matching @@y?");
@y
  loc=buffer+2; err_print(_("! Where is the matching @@y?"));
@z

@x l.359
    err_print("of the preceding lines failed to match");
@y
    err_print(_("of the preceding lines failed to match"));
@z

Section 35.

@x l.389
       fatal("! Cannot open input file ", web_file_name);
@y
       fatal(_("! Cannot open input file "), web_file_name);
@z

@x l.395
       fatal("! Cannot open change file ", change_file_name);
@y
       fatal(_("! Cannot open change file "), change_file_name);
@z

Section 37.

@x l.433
      err_print("! Include file name not given");
@y
      err_print(_("! Include file name not given"));
@z

@x l.438
      err_print("! Too many nested includes");
@y
      err_print(_("! Too many nested includes"));
@z

Section 38.

@x l.460
        err_print("! Include file name too long"); goto restart;}
@y
        err_print(_("! Include file name too long")); goto restart;}
@z

Section 39.

@x l.508
  include_depth--; err_print("! Cannot open include file"); goto restart;
@y
  include_depth--; err_print(_("! Cannot open include file")); goto restart;
@z

Section 41.

@x l.531
    err_print("! Change file ended without @@z");
@y
    err_print(_("! Change file ended without @@z"));
@z

@x l.547
        err_print("! Where is the matching @@z?");
@y
        err_print(_("! Where is the matching @@z?"));
@z

Section 42.

@x l.567
    err_print("! Change file entry did not match");
@y
    err_print(_("! Change file entry did not match"));
@z

Section 53.

@x l.668
  if (byte_ptr+l>byte_mem_end) overflow("byte memory");
  if (name_ptr>=name_dir_end) overflow("name");
@y
  if (byte_ptr+l>byte_mem_end) overflow(_("byte memory"));
  if (name_ptr>=name_dir_end) overflow(_("name"));
@z

Section 61.

@x l.815
  if (s+name_len>byte_mem_end) overflow("byte memory");
  if (name_ptr+1>=name_dir_end) overflow("name");
@y
  if (s+name_len>byte_mem_end) overflow(_("byte memory"));
  if (name_ptr+1>=name_dir_end) overflow(_("name"));
@z

Section 62.

@x l.843
  if (name_ptr>=name_dir_end) overflow("name");
@y
  if (name_ptr>=name_dir_end) overflow(_("name"));
@z

@x l.848
  if (s+name_len>byte_mem_end) overflow("byte memory");
@y
  if (s+name_len>byte_mem_end) overflow(_("byte memory"));
@z

Section 64.

@x l.893
      fputs("\n! Ambiguous prefix: matches <",stdout);
@y
      fputs(_("\n! Ambiguous prefix: matches <"),stdout);
@z

@x l.896
      fputs(">\n and <",stdout);
@y
      fputs(_(">\n and <"),stdout);
@z

Section 66.

@x l.922
      fputs("\n! New name is a prefix of <",stdout);
@y
      fputs(_("\n! New name is a prefix of <"),stdout);
@z

@x l.934
      fputs("\n! New name extends <",stdout);
@y
      fputs(_("\n! New name extends <"),stdout);
@z

@x l.940
    fputs("\n! Section name incompatible with <",stdout);
@y
    fputs(_("\n! Section name incompatible with <"),stdout);
@z

@x l.943
    fputs(">,\n which abbreviates <",stdout);
@y
    fputs(_(">,\n which abbreviates <"),stdout);
@z

Section 73.

@x l.1052
  printf(". (l. %d of change file)\n", change_line);
else if (include_depth==0) printf(". (l. %d)\n", cur_line);
  else printf(". (l. %d of include file %s)\n", cur_line, cur_file_name);
@y
  printf(_(". (l. %d of change file)\n"), change_line);
else if (include_depth==0) printf(_(". (l. %d)\n"), cur_line);
  else printf(_(". (l. %d of include file %s)\n"), cur_line, cur_file_name);
@z

Section 76.

@x l.1093
case spotless: if (show_happiness) puts("(No errors were found.)"); break;
case harmless_message:
  puts("(Did you see the warning message above?)"); break;
case error_message:
  puts("(Pardon me, but I think I spotted something wrong.)"); break;
case fatal_message: puts("(That was a fatal error, my friend.)");
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

Section 79.

@x l.1126
  printf("\n! Sorry, %s capacity exceeded",t); fatal("","");
@y
  printf(_("\n! Sorry, %s capacity exceeded"),t); fatal("","");
@z

Section 89.

@x l.1276 and l.269 of COMM-EXTENSIONS.CH
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

Section 90.

@x l.1286
@ @<Complain about arg...@>= fatal("! Filename too long\n", *argv);
@y
@ @<Complain about arg...@>= fatal(_("! Filename too long\n"), *argv);
@z

Section 92.

@x l.1303 and l.76 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", C_file_name);
@y
    fatal(_("! Cannot open output file "), C_file_name);
@z

@x l.86 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", check_file_name);
@y
    fatal(_("! Cannot open output file "), check_file_name);
@z

@x l.1308 and l.91 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", tex_file_name);
@y
    fatal(_("! Cannot open output file "), tex_file_name);
@z

@x l.100 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", check_file_name);
@y
    fatal(_("! Cannot open output file "), check_file_name);
@z

@x l.320 of COMM-EXTENSIONS.CH
      err_print("! Include path too long"); return(0);
@y
      err_print(_("! Include path too long")); return(0);
@z

More new material.

@x l.1312
@** Index.
@y
@* Internationalization.

@<Include files@>=
#if HAVE_GETTEXT
#include <locale.h> /* |@!LC_MESSAGES|, |@!LC_CTYPE| */
#else
#define setlocale(A,B) ""
#define bindtextdomain(A,B) ""
#define textdomain(A) ""
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
