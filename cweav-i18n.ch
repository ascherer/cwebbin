Changes for CWEAVE.W by Andreas Scherer, November 1, 2018.

This set of changes translates all string values written by the CWEB module
CWEAVE.W in case of errors or information requests with the help of 'gettext'
and the 'libintl' library.

This change file requires CWEAV-PATCH.CH, CWEAVE-ANSI.CH,
CWEAV-EXTENSIONS.CH, and CWEAV-OUTPUT.CH to be applied as well.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

@x l.64+ and 200 of CWEAV-PATCH.CH
@d banner "This is CWEAVE (Version 3.64 [CWEBbin 2018])\n"
@y
@d banner _("This is CWEAVE (Version 3.64 [CWEBbin 2018])\n")
@z

@x l.104
  program=cweave;
@y
  program=cweave;
  setlocale(LC_ALL, "");
  bindtextdomain("cweb", "/usr/share/locale/");
  textdomain("cweb");
@z

@x l.267
@d append_xref(c) if (xref_ptr==xmem_end) overflow("cross-reference");
@y
@d append_xref(c) if (xref_ptr==xmem_end) overflow(_("cross-reference"));
@z

@x l.859
        err_print("! String didn't end"); loc=limit; break;
@y
        err_print(_("! String didn't end")); loc=limit; break;
@z

@x l.863
        err_print("! Input ended in middle of string"); loc=buffer; break;
@y
        err_print(_("! Input ended in middle of string")); loc=buffer; break;
@z

@x l.878
    printf("\n! String too long: ");
@y
    fputs(_("\n! String too long: "),stdout);
@z

@x l.893
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z

@x l.932
    err_print("! Input ended in section name");
@y
    err_print(_("! Input ended in section name"));
@z

@x l.945
  printf("\n! Section name too long: ");
@y
  fputs(_("\n! Section name too long: "),stdout);
@z

@x l.959
    err_print("! Section name didn't end"); break;
@y
    err_print(_("! Section name didn't end")); break;
@z

@x l.963
    err_print("! Control codes are forbidden in section name"); break;
@y
    err_print(_("! Control codes are forbidden in section name")); break;
@z

@x l.983
    err_print("! Control text didn't end"); loc=limit;
@y
    err_print(_("! Control text didn't end")); loc=limit;
@z

@x l.989
      err_print("! Control codes are forbidden in control text");
@y
      err_print(_("! Control codes are forbidden in control text"));
@z

@x l.1002
  if (loc>=limit) err_print("! Verbatim string didn't end");
@y
  if (loc>=limit) err_print(_("! Verbatim string didn't end"));
@z

@x l.1042
  if (++section_count==max_sections) overflow("section number");
@y
  if (++section_count==max_sections) overflow(_("section number"));
@z

@x l.1134
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z

@x l.1222
    err_print("! Missing left identifier of @@s");
@y
    err_print(_("! Missing left identifier of @@s"));
@z

@x l.1227
      err_print("! Missing right identifier of @@s");
@y
      err_print(_("! Missing right identifier of @@s"));
@z

@x l.1280
      printf("\n! Never defined: <"); print_section_name(p); putchar('>'); mark_harmless;
@y
      fputs(_("\n! Never defined: <"),stdout);
      print_section_name(p); putchar('>'); mark_harmless;
@z

@x l.1285
      printf("\n! Never used: <"); print_section_name(p); putchar('>'); mark_harmless;
@y
      fputs(_("\n! Never used: <"),stdout);
      print_section_name(p); putchar('>'); mark_harmless;
@z

@x l.1428
  printf("\n! Line had to be broken (output l. %d):\n",out_line);
@y
  printf(_("\n! Line had to be broken (output l. %d):\n"),out_line);
@z

@x l.1504
        default: err_print("! Double @@ should be used in limbo");
@y
        default: err_print(_("! Double @@ should be used in limbo"));
@z

@x l.1546
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow("token"); *(tok_ptr++)=c;}
@y
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow(_("token")); *(tok_ptr++)=c;}
@z

@x l.1561
          err_print("! Input ended in mid-comment");
@y
          err_print(_("! Input ended in mid-comment"));
@z

@x l.1567
        if (bal>1) err_print("! Missing } in comment");
@y
        if (bal>1) err_print(_("! Missing } in comment"));
@z

@x l.1583
      else {err_print("! Extra } in comment");
@y
      else {err_print(_("! Extra } in comment"));
@z

@x l.1595
  if (bal>1) err_print("! Missing } in comment");
@y
  if (bal>1) err_print(_("! Missing } in comment"));
@z

@x l.1603
    err_print("! Illegal use of @@ in comment");
@y
    err_print(_("! Illegal use of @@ in comment"));
@z

@x l.3065
    overflow("token");
@y
    overflow(_("token"));
@z

@x l.3069
    overflow("text");
@y
    overflow(_("text"));
@z

@x l.3149
    if (tok_ptr+6>tok_mem_end) overflow("token");
@y
    if (tok_ptr+6>tok_mem_end) overflow(_("token"));
@z

@x l.3156
  printf("\nIrreducible scrap sequence in section %d:",section_count);
@y
  printf(_("\nIrreducible scrap sequence in section %d:"),section_count);
@z

@x l.3166
  printf("\nTracing after l. %d:\n",cur_line); mark_harmless;
@y
  printf(_("\nTracing after l. %d:\n"),cur_line); mark_harmless;
@z

@x l.3294
  overflow("scrap/token/text");
@y
  overflow(_("scrap/token/text"));
@z

@x l.3379
        else err_print("! Double @@ should be used in strings");
@y
        else err_print(_("! Double @@ should be used in strings"));
@z

@x l.3457
  if (next_control!='|') err_print("! Missing '|' after C text");
@y
  if (next_control!='|') err_print(_("! Missing '|' after C text"));
@z

@x l.3590
  if (stack_ptr==stack_end) overflow("stack");
@y
  if (stack_ptr==stack_end) overflow(_("stack"));
@z

@x l.3905
  printf("\n! Illegal control code in section name: <");
@y
  fputs(_("\n! Illegal control code in section name: <"),stdout);
@z

@x l.3920
    printf("\n! C text in section name didn't end: <");
@y
    fputs(_("\n! C text in section name didn't end: <"),stdout);
@z

@x l.3932
      if (j>buffer+long_buf_size-3) overflow("buffer");
@y
      if (j>buffer+long_buf_size-3) overflow(_("buffer"));
@z

@x l.3940
  if (j>buffer+long_buf_size-4) overflow("buffer");
@y
  if (j>buffer+long_buf_size-4) overflow(_("buffer"));
@z

@x l.3957
reset_input(); if (show_progress) printf("\nWriting the output file...");
@y
reset_input(); if (show_progress) fputs(_("\nWriting the output file..."),stdout);
@z

@x l.4040
        err_print("! TeX string should be in C text only"); break;
@y
        err_print(_("! TeX string should be in C text only")); break;
@z

@x l.4046
        err_print("! You can't do that in TeX text"); break;
@y
        err_print(_("! You can't do that in TeX text")); break;
@z

@x l.4118
    err_print("! Improper macro definition");
@y
    err_print(_("! Improper macro definition"));
@z

@x l.4127
      default: err_print("! Improper macro definition"); break;
@y
      default: err_print(_("! Improper macro definition")); break;
@z

@x l.4153
  if (scrap_ptr!=scrap_info+2) err_print("! Improper format definition");
@y
  if (scrap_ptr!=scrap_info+2) err_print(_("! Improper format definition"));
@z

@x l.4188
  err_print("! You need an = sign after the section name");
@y
  err_print(_("! You need an = sign after the section name"));
@z

@x l.4210
  err_print("! You can't do that in C text");
@y
  err_print(_("! You can't do that in C text"));
@z

@x l.4307
  phase=3; if (show_progress) printf("\nWriting the index...");
@y
  phase=3; if (show_progress) fputs(_("\nWriting the index..."),stdout);
@z

@x l.4311
    fatal("! Cannot open index file ",idx_file_name);
@y
    fatal(_("! Cannot open index file "),idx_file_name);
@z

@x l.4326
    fatal("! Cannot open section file ",scn_file_name);
@y
    fatal(_("! Cannot open section file "),scn_file_name);
@z

@x l.4338
if (show_happiness) printf("\nDone.");
@y
if (show_happiness) fputs(_("\nDone."),stdout);
@z

@x l.4486
    if (sort_ptr>=scrap_info_end) overflow("sorting");
@y
    if (sort_ptr>=scrap_info_end) overflow(_("sorting"));
@z

@x l.4622
  printf("\nMemory usage statistics:\n");
@.Memory usage statistics:@>
  printf("%ld names (out of %ld)\n",
            (long)(name_ptr-name_dir),(long)max_names);
  printf("%ld cross-references (out of %ld)\n",
            (long)(xref_ptr-xmem),(long)max_refs);
  printf("%ld bytes (out of %ld)\n",
            (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf("Parsing:\n");
  printf("%ld scraps (out of %ld)\n",
            (long)(max_scr_ptr-scrap_info),(long)max_scraps);
  printf("%ld texts (out of %ld)\n",
            (long)(max_text_ptr-tok_start),(long)max_texts);
  printf("%ld tokens (out of %ld)\n",
            (long)(max_tok_ptr-tok_mem),(long)max_toks);
  printf("%ld levels (out of %ld)\n",
            (long)(max_stack_ptr-stack),(long)stack_size);
  printf("Sorting:\n");
  printf("%ld levels (out of %ld)\n",
            (long)(max_sort_ptr-scrap_info),(long)max_scraps);
}
@y
  fputs(_("\nMemory usage statistics:\n"),stdout);
@.Memory usage statistics:@>
  printf(_("%ld names (out of %ld)\n"),
            (long)(name_ptr-name_dir),(long)max_names);
  printf(_("%ld cross-references (out of %ld)\n"),
            (long)(xref_ptr-xmem),(long)max_refs);
  printf(_("%ld bytes (out of %ld)\n"),
            (long)(byte_ptr-byte_mem),(long)max_bytes);
  fputs(_("Parsing:\n"),stdout);
  printf(_("%ld scraps (out of %ld)\n"),
            (long)(max_scr_ptr-scrap_info),(long)max_scraps);
  printf(_("%ld texts (out of %ld)\n"),
            (long)(max_text_ptr-tok_start),(long)max_texts);
  printf(_("%ld tokens (out of %ld)\n"),
            (long)(max_tok_ptr-tok_mem),(long)max_toks);
  printf(_("%ld levels (out of %ld)\n"),
            (long)(max_stack_ptr-stack),(long)stack_size);
  fputs(_("Sorting:\n"),stdout);
  printf(_("%ld levels (out of %ld)\n"),
            (long)(max_sort_ptr-scrap_info),(long)max_scraps);
}
@z

@x l.4644+ and l.97 of CWEAV-OUTPUT.CH
    fatal("! Cannot open output file ",check_file_name);
@y
    fatal(_("! Cannot open output file "),check_file_name);
@z
