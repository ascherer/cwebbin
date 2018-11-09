Changes for COMMON.W by Andreas Scherer, November 9, 2018.

This set of changes translates all string values written by the CWEB module
COMMON.W in case of errors or information requests with the help of 'gettext'
and the 'libintl' library.

This change file requires COMM-PATCH.CH, COMM-ANSI.CH, COMM-EXTENSIONS.CH,
and COMM-OUTPUT.CH to be applied as well.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

@x l.184
      ungetc(c,fp); loc=buffer; err_print("! Input line too long");
@y
      ungetc(c,fp); loc=buffer; err_print(_("! Input line too long"));
@z

@x l.275
    err_print("! Missing @@x in change file");
@y
    err_print(_("! Missing @@x in change file"));
@z

@x l.286
    err_print("! Change file ended after @@x");
@y
    err_print(_("! Change file ended after @@x"));
@z

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

@x l.469
        err_print("! Include file name too long"); goto restart;}
@y
        err_print(_("! Include file name too long")); goto restart;}
@z

@x l.517
  include_depth--; err_print("! Cannot open include file"); goto restart;
@y
  include_depth--; err_print(_("! Cannot open include file")); goto restart;
@z

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

@x l.576
    err_print("! Change file entry did not match");
@y
    err_print(_("! Change file entry did not match"));
@z

@x l.707
  if (byte_ptr+l>byte_mem_end) overflow("byte memory");
  if (name_ptr>=name_dir_end) overflow("name");
@y
  if (byte_ptr+l>byte_mem_end) overflow(_("byte memory"));
  if (name_ptr>=name_dir_end) overflow(_("name"));
@z

@x l.867
  if (s+name_len>byte_mem_end) overflow("byte memory");
  if (name_ptr+1>=name_dir_end) overflow("name");
@y
  if (s+name_len>byte_mem_end) overflow(_("byte memory"));
  if (name_ptr+1>=name_dir_end) overflow(_("name"));
@z

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

@x l.1117
  printf(". (l. %d of change file)\n", change_line);
else if (include_depth==0) printf(". (l. %d)\n", cur_line);
  else printf(". (l. %d of include file %s)\n", cur_line, cur_file_name);
@y
  printf(_(". (l. %d of change file)\n"), change_line);
else if (include_depth==0) printf(_(". (l. %d)\n"), cur_line);
  else printf(_(". (l. %d of include file %s)\n"), cur_line, cur_file_name);
@z

@x l.1162
case spotless: if (show_happiness) printf("(No errors were found.)\n"); break;
case harmless_message:
  printf("(Did you see the warning message above?)\n"); break;
case error_message:
  printf("(Pardon me, but I think I spotted something wrong.)\n"); break;
case fatal_message: printf("(That was a fatal error, my friend.)\n");
@y
case spotless:
  if (show_happiness) fputs(_("(No errors were found.)\n"),stdout); break;
case harmless_message:
  fputs(_("(Did you see the warning message above?)\n"),stdout); break;
case error_message:
  fputs(_("(Pardon me, but I think I spotted something wrong.)\n"),stdout); break;
case fatal_message:
  fputs(_("(That was a fatal error, my friend.)\n"),stdout);
@z

@x l.1194
  printf("\n! Sorry, %s capacity exceeded",t); fatal("","");
@y
  printf(_("\n! Sorry, %s capacity exceeded"),t); fatal("","");
@z

@x l.1203
@d confusion(s) fatal("! This can't happen: ",s)
@y
@d confusion(s) fatal(_("! This can't happen: "),s)
@z

@x l.1354
if (program==ctangle)
  fatal(
"! Usage: ctangle [options] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n"
   ,"");
@.Usage:@>
else fatal(
"! Usage: cweave [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n"
   ,"");
@y
if (program==ctangle)
  fatal(
_("! Usage: ctangle [options] webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n")
   ,"");
@.Usage:@>
else fatal(
_("! Usage: cweave [options] webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
   ,"");
@z

@x l.1364
@ @<Complain about arg...@>= fatal("! Filename too long\n", *argv);
@y
@ @<Complain about arg...@>= fatal(_("! Filename too long\n"), *argv);
@z

@x l.1377+ and l.58 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", check_file_name);
@y
    fatal(_("! Cannot open output file "), check_file_name);
@z

@x l.1377+ and l.69 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", check_file_name);
@y
    fatal(_("! Cannot open output file "), check_file_name);
@z

@x l.1418 and l.293 of COMM-EXTENSIONS.CH
      err_print("! Include path too long"); return(0);
@y
      err_print(_("! Include path too long")); return(0);
@z

@x l.1418
@** Index.
@y
@** Internationalization.

@d _(STRING) gettext(STRING)

@<Include files@>=
#include <libintl.h>
#include <locale.h>

@** Index.
@z
