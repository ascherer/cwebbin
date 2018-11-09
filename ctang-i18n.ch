Changes for CTANGLE.W by Andreas Scherer, NOVEMBER 9, 2018.

This set of changes translates all string values written by the CWEB module
CTANGLE.W in case of errors or information requests with the help of 'gettext'
and the 'libintl' library.

This change file requires CTANG-PATCH.CH, CTANG-ANSI.ch,
CTANG-EXTENSIONS.CH, CTANG-OUTPUT.CH to be applied as well.

For a complete history of the changes made to CTANGLE.W see CTANG-PATCH.CH.

@x l.62+ and l.181 of CTANG-PATCH.CH
@d banner "This is CTANGLE (Version 3.64 [CWEBbin 2018])\n"
@y
@d banner _("This is CTANGLE (Version 3.64 [CWEBbin 2018])\n")
@z

@x l.97
  program=ctangle;
@y
  program=ctangle;
  setlocale(LC_ALL, "");
  bindtextdomain("cweb", getenv("PWD"));
  textdomain("cweb");
@z

@x l.265
  if (tok_ptr+2>tok_mem_end) overflow("token");
@y
  if (tok_ptr+2>tok_mem_end) overflow(_("token"));
@z

@x l.341
  if (stack_ptr==stack_end) overflow("stack");
@y
  if (stack_ptr==stack_end) overflow(_("stack"));
@z

@x l.428
    printf("\n! Not present: <");
@y
    fputs(_("\n! Not present: <"),stdout);
@z

@x l.525
      overflow("output files");
@y
      overflow(_("output files"));
@z

@x l.544
    printf("\n! No program text was specified."); mark_harmless;
@y
    fputs(_("\n! No program text was specified."),stdout); mark_harmless;
@z

@x l.550
        printf("\nWriting the output file (%s):",C_file_name);
@y
        printf(_("\nWriting the output file (%s):"),C_file_name);
@z

@x l.554
        printf("\nWriting the output files:");
@y
        fputs(_("\nWriting the output files:"),stdout);
@z

@x l.564
    if(show_happiness) printf("\nDone.");
@y
    if(show_happiness) fputs(_("\nDone."),stdout);
@z

@x l.41 of CTANG-OUTPUT.CH
      fatal("! Cannot open output file:",check_file_name);
@y
      fatal(_("! Cannot open output file:"),check_file_name);
@z

@x l.630
          else if (a<050000) { confusion("macro defs have strange char");}
@y
          else if (a<050000) { confusion(_("macro defs have strange char"));}
@z

@x l.858
          err_print("! Input ended in mid-comment");
@y
          err_print(_("! Input ended in mid-comment"));
@z

@x l.871
        err_print("! Section name ended in mid-comment"); loc--;
@y
        err_print(_("! Section name ended in mid-comment")); loc--;
@z

@x l.1016
        err_print("! String didn't end"); loc=limit; break;
@y
        err_print(_("! String didn't end")); loc=limit; break;
@z

@x l.1020
        err_print("! Input ended in middle of string"); loc=buffer; break;
@y
        err_print(_("! Input ended in middle of string")); loc=buffer; break;
@z

@x l.1038
    printf("\n! String too long: ");
@y
    fputs(_("\n! String too long: "),stdout);
@z

@x l.1054
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z

@x l.1059
        err_print("! Double @@ should be used in control text");
@y
        err_print(_("! Double @@ should be used in control text"));
@z

@x l.1085
        err_print("! Double @@ should be used in ASCII constant");
@y
        err_print(_("! Double @@ should be used in ASCII constant"));
@z

@x l.1091
        err_print("! String didn't end"); loc=limit-1; break;
@y
        err_print(_("! String didn't end")); loc=limit-1; break;
@z

@x l.1122
    err_print("! Input ended in section name");
@y
    err_print(_("! Input ended in section name"));
@z

@x l.1135
  printf("\n! Section name too long: ");
@y
  fputs(_("\n! Section name too long: "),stdout);
@z

@x l.1149
    err_print("! Section name didn't end"); break;
@y
    err_print(_("! Section name didn't end")); break;
@z

@x l.1153
    err_print("! Nesting of section names not allowed"); break;
@y
    err_print(_("! Nesting of section names not allowed")); break;
@z

@x l.1167
  if (loc>=limit) err_print("! Verbatim string didn't end");
@y
  if (loc>=limit) err_print(_("! Verbatim string didn't end"));
@z

@x l.1193
@d app_repl(c)  {if (tok_ptr==tok_mem_end) overflow("token"); *tok_ptr++=c;}
@y
@d app_repl(c) {if (tok_ptr==tok_mem_end) overflow(_("token")); *tok_ptr++=c;}
@z

@x l.1217
  if (text_ptr>text_info_end) overflow("text");
@y
  if (text_ptr>text_info_end) overflow(_("text"));
@z

@x l.1266
    err_print("! @@d, @@f and @@c are ignored in C text"); continue;
@y
    err_print(_("! @@d, @@f and @@c are ignored in C text")); continue;
@z

@x l.1276
  if (*try_loc=='=') err_print ("! Missing `@@ ' before a named section");
@y
  if (*try_loc=='=') err_print (_("! Missing `@@ ' before a named section"));
@z

@x l.1287
      else err_print("! Double @@ should be used in string");
@y
      else err_print(_("! Double @@ should be used in string"));
@z

@x l.1334
    default: err_print("! Unrecognized escape sequence");
@y
    default: err_print(_("! Unrecognized escape sequence"));
@z

@x l.1409
    err_print("! Definition flushed, must start with identifier");
@y
    err_print(_("! Definition flushed, must start with identifier"));
@z

@x l.1499
            err_print("! Double @@ should be used in control text");
@y
            err_print(_("! Double @@ should be used in control text"));
@z

@x l.1503
        default: err_print("! Double @@ should be used in limbo");
@y
        default: err_print(_("! Double @@ should be used in limbo"));
@z

@x l.1515
    err_print("! Improper hex number following @@l");
@y
    err_print(_("! Improper hex number following @@l"));
@z

@x l.1525
      err_print("! Replacement string in @@l too long");
@y
      err_print(_("! Replacement string in @@l too long"));
@z

@x l.1539
  printf("\nMemory usage statistics:\n");
  printf("%ld names (out of %ld)\n",
          (long)(name_ptr-name_dir),(long)max_names);
  printf("%ld replacement texts (out of %ld)\n",
          (long)(text_ptr-text_info),(long)max_texts);
  printf("%ld bytes (out of %ld)\n",
          (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf("%ld tokens (out of %ld)\n",
@y
  fputs(_("\nMemory usage statistics:\n"),stdout);
  printf(_("%ld names (out of %ld)\n"),
          (long)(name_ptr-name_dir),(long)max_names);
  printf(_("%ld replacement texts (out of %ld)\n"),
          (long)(text_ptr-text_info),(long)max_texts);
  printf(_("%ld bytes (out of %ld)\n"),
          (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf(_("%ld tokens (out of %ld)\n"),
@z

@x l.80 of CTANG-OUTPUT.CH
    fatal("! Cannot open output file:",check_file_name);
@y
    fatal(_("! Cannot open output file:"),check_file_name);
@z
