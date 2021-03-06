Changes for CWEAVE.W by Andreas Scherer.

This set of changes translates all string values written by the CWEB module
CWEAVE.W in case of errors or information requests with the help of 'gettext'
and the 'libintl' library.

This change file requires CWEAV-PATCH.CH, CWEAV-EXTENSIONS.CH, and
CWEAV-OUTPUT.CH to be applied as well.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

Section 1.

@x l.70 and 206 of CWEAV-PATCH.CH
@d banner "This is CWEAVE (@VERSION@)"
@y
@d banner _("This is CWEAVE (@VERSION@)")
@z

Section 25.

@x l.247
@d append_xref(c) if (xref_ptr==xmem_end) overflow("cross-reference");
@y
@d append_xref(c) if (xref_ptr==xmem_end) overflow(_("cross-reference"));
@z

Section 57.

@x l.899
        err_print("! String didn't end"); loc=limit; break;
@y
        err_print(_("! String didn't end")); loc=limit; break;
@z

@x l.903
        err_print("! Input ended in middle of string"); loc=buffer; break;
@y
        err_print(_("! Input ended in middle of string")); loc=buffer; break;
@z

@x l.922
    fputs("\n! String too long: ",stdout);
@y
    fputs(_("\n! String too long: "),stdout);
@z

Section 59.

@x l.941
  case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
  case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z

Section 62.

@x l.979
    err_print("! Input ended in section name");
@y
    err_print(_("! Input ended in section name"));
@z

@x l.992
  fputs("\n! Section name too long: ",stdout);
@y
  fputs(_("\n! Section name too long: "),stdout);
@z

Section 63.

@x l.1006
    err_print("! Section name didn't end"); break;
@y
    err_print(_("! Section name didn't end")); break;
@z

@x l.1010
    err_print("! Control codes are forbidden in section name"); break;
@y
    err_print(_("! Control codes are forbidden in section name")); break;
@z

Section 64.

@x l.1027
    err_print("! Control text didn't end"); loc=limit;
@y
    err_print(_("! Control text didn't end")); loc=limit;
@z

@x l.1032
      err_print("! Control codes are forbidden in control text");
@y
      err_print(_("! Control codes are forbidden in control text"));
@z

Section 66.

@x l.1047
if (loc>=limit) err_print("! Verbatim string didn't end");
@y
if (loc>=limit) err_print(_("! Verbatim string didn't end"));
@z

Section 70.

@x l.1084
  if (++section_count==max_sections) overflow("section number");
@y
  if (++section_count==max_sections) overflow(_("section number"));
@z

Section 74.

@x l.1173
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z

Section 79.

@x l.1260
  err_print("! Missing left identifier of @@s");
@y
  err_print(_("! Missing left identifier of @@s"));
@z

@x l.1265
    err_print("! Missing right identifier of @@s");
@y
    err_print(_("! Missing right identifier of @@s"));
@z

Section 82.

@x l.1313
      fputs("\n! Never defined: <",stdout);
      print_section_name(p); putchar('>'); mark_harmless;
@y
      fputs(_("\n! Never defined: <"),stdout);
      print_section_name(p); putchar('>'); mark_harmless;
@z

@x l.1319
      fputs("\n! Never used: <",stdout);
      print_section_name(p); putchar('>'); mark_harmless;
@y
      fputs(_("\n! Never used: <"),stdout);
      print_section_name(p); putchar('>'); mark_harmless;
@z

Section 94.

@x l.1471
  printf("\n! Line had to be broken (output l. %d):\n",out_line);
@y
  printf(_("\n! Line had to be broken (output l. %d):\n"),out_line);
@z

Section 99.

@x l.1554
        default: err_print("! Double @@ should be used in limbo");
@y
        default: err_print(_("! Double @@ should be used in limbo"));
@z

Section 101.

@x l.1596
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow("token"); *(tok_ptr++)=c;}
@y
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow(_("token")); *(tok_ptr++)=c;}
@z

@x l.1608
          err_print("! Input ended in mid-comment");
@y
          err_print(_("! Input ended in mid-comment"));
@z

@x l.1613
        if (bal>1) err_print("! Missing } in comment");
@y
        if (bal>1) err_print(_("! Missing } in comment"));
@z

@x l.1629
      else {err_print("! Extra } in comment");
@y
      else {err_print(_("! Extra } in comment"));
@z

Section 102.

@x l.1641
  if (bal>1) err_print("! Missing } in comment");
@y
  if (bal>1) err_print(_("! Missing } in comment"));
@z

Section 103.

@x l.1649
    err_print("! Illegal use of @@ in comment");
@y
    err_print(_("! Illegal use of @@ in comment"));
@z

Section 185.

@x l.3251
    overflow("token");
@y
    overflow(_("token"));
@z

@x l.3255
    overflow("text");
@y
    overflow(_("text"));
@z

Section 191.

@x l.3340
  if (tok_ptr+6>tok_mem_end) overflow("token");
@y
  if (tok_ptr+6>tok_mem_end) overflow(_("token"));
@z

Section 192.

@x l.3346
  printf("\nIrreducible scrap sequence in section %d:",(int)section_count);
@y
  printf(_("\nIrreducible scrap sequence in section %d:"),(int)section_count);
@z

Section 193.

@x l.3356
  printf("\nTracing after l. %d:\n",cur_line); mark_harmless;
@y
  printf(_("\nTracing after l. %d:\n"),cur_line); mark_harmless;
@z

Section 198.

@x l.3488
  overflow("scrap/token/text");
@y
  overflow(_("scrap/token/text"));
@z

Section 200.

@x l.3572
        else err_print("! Double @@ should be used in strings");
@y
        else err_print(_("! Double @@ should be used in strings"));
@z

Section 204.

@x l.3653
  if (next_control!='|') err_print("! Missing '|' after C text");
@y
  if (next_control!='|') err_print(_("! Missing '|' after C text"));
@z

Section 212.

@x l.3794
  if (stack_ptr==stack_end) overflow("stack");
@y
  if (stack_ptr==stack_end) overflow(_("stack"));
@z

Section 225.

@x l.4122
  fputs("\n! Illegal control code in section name: <",stdout);
@y
  fputs(_("\n! Illegal control code in section name: <"),stdout);
@z

Section 226.

@x l.4137
    fputs("\n! C text in section name didn't end: <",stdout);
@y
    fputs(_("\n! C text in section name didn't end: <"),stdout);
@z

@x l.4149
      if (j>buffer+long_buf_size-3) overflow("buffer");
@y
      if (j>buffer+long_buf_size-3) overflow(_("buffer"));
@z

Section 227.

@x l.4157
  if (j>buffer+long_buf_size-4) overflow("buffer");
@y
  if (j>buffer+long_buf_size-4) overflow(_("buffer"));
@z

Section 228.

@x l.4172
if (show_progress) fputs("\nWriting the output file...",stdout);
@y
if (show_progress) fputs(_("\nWriting the output file..."),stdout);
@z

Section 233.

@x l.4257
        err_print("! TeX string should be in C text only"); break;
@y
        err_print(_("! TeX string should be in C text only")); break;
@z

@x l.4263
        err_print("! You can't do that in TeX text"); break;
@y
        err_print(_("! You can't do that in TeX text")); break;
@z

Section 237.

@x l.4335
    err_print("! Improper macro definition");
@y
    err_print(_("! Improper macro definition"));
@z

@x l.4350
      default: err_print("! Improper macro definition"); break;
@y
      default: err_print(_("! Improper macro definition")); break;
@z

Section 238.

@x l.4377
  if (scrap_ptr!=scrap_info+2) err_print("! Improper format definition");
@y
  if (scrap_ptr!=scrap_info+2) err_print(_("! Improper format definition"));
@z

Section 241.

@x l.4412
  err_print("! You need an = sign after the section name");
@y
  err_print(_("! You need an = sign after the section name"));
@z

Section 242.

@x l.4434
  err_print("! You can't do that in C text");
@y
  err_print(_("! You can't do that in C text"));
@z

Section 248.

@x l.4526
  phase=3; if (show_progress) fputs("\nWriting the index...",stdout);
@y
  phase=3; if (show_progress) fputs(_("\nWriting the index..."),stdout);
@z

@x l.4530
    fatal("! Cannot open index file ",idx_file_name);
@y
    fatal(_("! Cannot open index file "),idx_file_name);
@z

@x l.4545
    fatal("! Cannot open section file ",scn_file_name);
@y
    fatal(_("! Cannot open section file "),scn_file_name);
@z

@x l.4559
  fputs("Done.",stdout);
@y
  fputs(_("Done."),stdout);
@z

Section 259.

@x l.4717
    if (sort_ptr>=scrap_info_end) overflow("sorting");
@y
    if (sort_ptr>=scrap_info_end) overflow(_("sorting"));
@z

Section 271.

@x l.4856
  puts("\nMemory usage statistics:");
@.Memory usage statistics:@>
  printf("%td names (out of %ld)\n",
            (ptrdiff_t)(name_ptr-name_dir),(long)max_names);
  printf("%td cross-references (out of %ld)\n",
            (ptrdiff_t)(xref_ptr-xmem),(long)max_refs);
  printf("%td bytes (out of %ld)\n",
            (ptrdiff_t)(byte_ptr-byte_mem),(long)max_bytes);
  puts("Parsing:");
  printf("%td scraps (out of %ld)\n",
            (ptrdiff_t)(max_scr_ptr-scrap_info),(long)max_scraps);
  printf("%td texts (out of %ld)\n",
            (ptrdiff_t)(max_text_ptr-tok_start),(long)max_texts);
  printf("%td tokens (out of %ld)\n",
            (ptrdiff_t)(max_tok_ptr-tok_mem),(long)max_toks);
  printf("%td levels (out of %ld)\n",
            (ptrdiff_t)(max_stack_ptr-stack),(long)stack_size);
  puts("Sorting:");
  printf("%td levels (out of %ld)\n",
            (ptrdiff_t)(max_sort_ptr-scrap_info),(long)max_scraps);
@y
  puts(_("\nMemory usage statistics:"));
@.Memory usage statistics:@>
  printf(_("%td names (out of %ld)\n"),
            (ptrdiff_t)(name_ptr-name_dir),(long)max_names);
  printf(_("%td cross-references (out of %ld)\n"),
            (ptrdiff_t)(xref_ptr-xmem),(long)max_refs);
  printf(_("%td bytes (out of %ld)\n"),
            (ptrdiff_t)(byte_ptr-byte_mem),(long)max_bytes);
  puts(_("Parsing:"));
  printf(_("%td scraps (out of %ld)\n"),
            (ptrdiff_t)(max_scr_ptr-scrap_info),(long)max_scraps);
  printf(_("%td texts (out of %ld)\n"),
            (ptrdiff_t)(max_text_ptr-tok_start),(long)max_texts);
  printf(_("%td tokens (out of %ld)\n"),
            (ptrdiff_t)(max_tok_ptr-tok_mem),(long)max_toks);
  printf(_("%td levels (out of %ld)\n"),
            (ptrdiff_t)(max_stack_ptr-stack),(long)stack_size);
  puts(_("Sorting:"));
  printf(_("%td levels (out of %ld)\n"),
            (ptrdiff_t)(max_sort_ptr-scrap_info),(long)max_scraps);
@z

@x l.63 of CWEAV-OUTPUT.CH
    fatal("! Cannot open output file ",check_file_name);
@y
    fatal(_("! Cannot open output file "),check_file_name);
@z
