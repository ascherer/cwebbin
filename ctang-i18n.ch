Changes for CTANGLE.W by Andreas Scherer.

This set of changes translates all string values written by the CWEB module
CTANGLE.W in case of errors or information requests with the help of 'gettext'
and the 'libintl' library.

This change file requires CTANG-PATCH.CH and CTANG-OUTPUT.CH to be applied
as well.

For a complete history of the changes made to CTANGLE.W see CTANG-PATCH.CH.

Section 1.

@x l.64 and l.199 of CTANG-PATCH.CH
@d banner "This is CTANGLE (@VERSION@)"
@y
@d banner _("This is CTANGLE (@VERSION@)")
@z

Section 29.

@x l.237
  if (tok_ptr+2>tok_mem_end) overflow("token");
@y
  if (tok_ptr+2>tok_mem_end) overflow(_("token"));
@z

Section 34.

@x l.312
  if (stack_ptr==stack_end) overflow("stack");
@y
  if (stack_ptr==stack_end) overflow(_("stack"));
@z

Section 40.

@x l.404
    printf("%s","\n! Not present: <");
@y
    printf("%s",_("\n! Not present: <"));
@z

Section 47.

@x l.502
    else overflow("output files");
@y
    else overflow(_("output files"));
@z

Section 48.

@x l.518
    printf("%s","\n! No program text was specified."); mark_harmless();
@y
    printf("%s",_("\n! No program text was specified.")); mark_harmless();
@z

@x l.524
        "\nWriting the output file (%s):" : @|
        "\nWriting the output files: (%s)",C_file_name);
@y
       _("\nWriting the output file (%s):") : @|
       _("\nWriting the output files: (%s)"),C_file_name);
@z

@x l.536
      printf("%s","Done.");
@y
      printf("%s",_("Done."));
@z

Section 50.

@x l.553 and l.46 of CTANG-OUTPUT.CH
      fatal("! Cannot open output file ",output_file_name);
@y
      fatal(_("! Cannot open output file "),output_file_name);
@z

Section 54.

@x l.609
          else if (a<050000) confusion("macro defs have strange char");
@y
          else if (a<050000) confusion(_("macro defs have strange char"));
@z

Section 67.

@x l.836
          err_print("! Input ended in mid-comment");
@y
          err_print(_("! Input ended in mid-comment"));
@z

@x l.849
        err_print("! Section name ended in mid-comment"); loc--;
@y
        err_print(_("! Section name ended in mid-comment")); loc--;
@z

Section 74.

@x l.999
        err_print("! String didn't end"); loc=limit; break;
@y
        err_print(_("! String didn't end")); loc=limit; break;
@z

@x l.1003
        err_print("! Input ended in middle of string"); loc=buffer; break;
@y
        err_print(_("! Input ended in middle of string")); loc=buffer; break;
@z

@x l.1021
    printf("%s","\n! String too long: ");
@y
    printf("%s",_("\n! String too long: "));
@z

Section 75.

@x l.1036
  case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
  case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z

@x l.1041
      err_print("! Double @@ should be used in control text");
@y
      err_print(_("! Double @@ should be used in control text"));
@z

Section 76.

@x l.1085
        err_print("! Double @@ should be used in ASCII constant");
@y
        err_print(_("! Double @@ should be used in ASCII constant"));
@z

@x l.1071
        err_print("! String didn't end"); loc=limit-1; break;
@y
        err_print(_("! String didn't end")); loc=limit-1; break;
@z

Section 79.

@x l.1103
    err_print("! Input ended in section name");
@y
    err_print(_("! Input ended in section name"));
@z

@x l.1116
  printf("%s","\n! Section name too long: ");
@y
  printf("%s",_("\n! Section name too long: "));
@z

Section 80.

@x l.1130
    err_print("! Section name didn't end"); break;
@y
    err_print(_("! Section name didn't end")); break;
@z

@x l.1134
    err_print("! Nesting of section names not allowed"); break;
@y
    err_print(_("! Nesting of section names not allowed")); break;
@z

Section 81.

@x l.1148
if (loc>=limit) err_print("! Verbatim string didn't end");
@y
if (loc>=limit) err_print(_("! Verbatim string didn't end"));
@z

Section 82.

@x l.1173
@d app_repl(c) {
  if (tok_ptr==tok_mem_end) overflow("token");
  else *(tok_ptr++)=(eight_bits)c;
}
@y
@d app_repl(c) {
  if (tok_ptr==tok_mem_end) overflow(_("token"));
  else *(tok_ptr++)=(eight_bits)c;
}
@z

Section 83.

@x l.1199
  if (text_ptr>text_info_end) overflow("text");
@y
  if (text_ptr>text_info_end) overflow(_("text"));
@z

Section 86.

@x l.1246
case output_defs_code: if (t!=section_name) err_print("! Misplaced @@h");
@y
case output_defs_code: if (t!=section_name) err_print(_("! Misplaced @@h"));
@z

@x l.1264
    err_print("! @@d, @@f and @@c are ignored in C text"); continue;
@y
    err_print(_("! @@d, @@f and @@c are ignored in C text")); continue;
@z

Section 87.

@x l.1274
  if (*try_loc=='=') err_print ("! Missing `@@ ' before a named section");
@y
  if (*try_loc=='=') err_print (_("! Missing `@@ ' before a named section"));
@z

Section 88.

@x l.1291
      else err_print("! Double @@ should be used in string");
@y
      else err_print(_("! Double @@ should be used in string"));
@z

Section 89.

@x l.1340
    default: err_print("! Unrecognized escape sequence");
@y
    default: err_print(_("! Unrecognized escape sequence"));
@z

Section 93.

@x l.1413
  err_print("! Definition flushed, must start with identifier");
@y
  err_print(_("! Definition flushed, must start with identifier"));
@z

Section 100

@x l.1494
            err_print("! Double @@ should be used in control text");
@y
            err_print(_("! Double @@ should be used in control text"));
@z

@x l.1498
          } @=/* otherwise fall through */@>@;
        default: err_print("! Double @@ should be used in limbo");
@y
          } @=/* otherwise fall through */@>@;
        default: err_print(_("! Double @@ should be used in limbo"));
@z

Section 102.

@x l.1512
    err_print("! Improper hex number following @@l");
@y
    err_print(_("! Improper hex number following @@l"));
@z

@x l.1522
      err_print("! Replacement string in @@l too long");
@y
      err_print(_("! Replacement string in @@l too long"));
@z

Section 103.

@x l.1536
  puts("\nMemory usage statistics:");
  printf("%td names (out of %ld)\n",@^system dependencies@>
          (ptrdiff_t)(name_ptr-name_dir),(long)max_names);
  printf("%td replacement texts (out of %ld)\n",
          (ptrdiff_t)(text_ptr-text_info),(long)max_texts);
  printf("%td bytes (out of %ld)\n",
          (ptrdiff_t)(byte_ptr-byte_mem),(long)max_bytes);
  printf("%td tokens (out of %ld)\n",
@y
  puts(_("\nMemory usage statistics:"));
  printf(_("%td names (out of %ld)\n"),@^system dependencies@>
          (ptrdiff_t)(name_ptr-name_dir),(long)max_names);
  printf(_("%td replacement texts (out of %ld)\n"),
          (ptrdiff_t)(text_ptr-text_info),(long)max_texts);
  printf(_("%td bytes (out of %ld)\n"),
          (ptrdiff_t)(byte_ptr-byte_mem),(long)max_bytes);
  printf(_("%td tokens (out of %ld)\n"),
@z

Addendum.

@x l.82 of CTANG-OUTPUT.CH
    fatal("! Cannot open output file ",output_file_name);
@y
    fatal(_("! Cannot open output file "),output_file_name);
@z

@x l.86 of CTANG-OUTPUT.CH
    fatal("! Cannot open output file ",check_file_name);
@y
    fatal(_("! Cannot open output file "),check_file_name);
@z

@x l.100 of CTANG-OUTPUT.CH
    fatal("! Cannot open output file ",check_file_name);
@y
    fatal(_("! Cannot open output file "),check_file_name);
@z

@x l.197 of CTANG-OUTPUT.CH
  fatal("! Cannot open output file ",check_file_name);
@y
  fatal(_("! Cannot open output file "),check_file_name);
@z
