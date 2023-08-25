Changes for CWEAVE.W by Andreas Scherer.

This set of changes translates all string values written by the CWEB module
CWEAVE.W in case of errors or information requests with the help of 'gettext'
and the 'libintl' library.

This change file requires CWEAV-PATCH.CH, CWEAV-EXTENSIONS.CH, and
CWEAV-OUTPUT.CH to be applied as well.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

Section 1.

@x l.70 and CWEAV-PATCH.CH
@d banner "This is CWEAVE (@VERSION@)"
@y
@d banner _("This is CWEAVE (@VERSION@)")
@z

Section 25.

@x l.246
@d append_xref(c) if (xref_ptr==xmem_end) overflow("cross-reference");
@y
@d append_xref(c) if (xref_ptr==xmem_end) overflow(_("cross-reference"));
@z

Section 57.

@x l.891
        err_print("! String didn't end"); loc=limit; break;
@y
        err_print(_("! String didn't end")); loc=limit; break;
@z

@x l.895
        err_print("! Input ended in middle of string"); loc=buffer; break;
@y
        err_print(_("! Input ended in middle of string")); loc=buffer; break;
@z

@x l.914
    printf("%s","\n! String too long: ");
@y
    printf("%s",_("\n! String too long: "));
@z

Section 59.

@x l.933
  case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
  case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z

Section 62.

@x l.971
    err_print("! Input ended in section name");
@y
    err_print(_("! Input ended in section name"));
@z

@x l.984
  printf("%s","\n! Section name too long: ");
@y
  printf("%s",_("\n! Section name too long: "));
@z

Section 63.

@x l.998
    err_print("! Section name didn't end"); break;
@y
    err_print(_("! Section name didn't end")); break;
@z

@x l.1002
    err_print("! Control codes are forbidden in section name"); break;
@y
    err_print(_("! Control codes are forbidden in section name")); break;
@z

Section 64.

@x l.1019
    err_print("! Control text didn't end"); loc=limit;
@y
    err_print(_("! Control text didn't end")); loc=limit;
@z

@x l.1024
      err_print("! Control codes are forbidden in control text");
@y
      err_print(_("! Control codes are forbidden in control text"));
@z

Section 66.

@x l.1039
if (loc>=limit) err_print("! Verbatim string didn't end");
@y
if (loc>=limit) err_print(_("! Verbatim string didn't end"));
@z

Section 70.

@x l.1076
  if (++section_count==max_sections) overflow("section number");
@y
  if (++section_count==max_sections) overflow(_("section number"));
@z

Section 74.

@x l.1165
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(_("! Use @@l in limbo only")); continue;
@z

Section 79.

@x l.1252
  err_print("! Missing left identifier of @@s");
@y
  err_print(_("! Missing left identifier of @@s"));
@z

@x l.1257
    err_print("! Missing right identifier of @@s");
@y
    err_print(_("! Missing right identifier of @@s"));
@z

Section 82.

@x l.1305
      printf("%s","\n! Never defined: <");
      print_section_name(p); putchar('>'); mark_harmless();
@y
      printf("%s",_("\n! Never defined: <"));
      print_section_name(p); putchar('>'); mark_harmless();
@z

@x l.1311
      printf("%s","\n! Never used: <");
      print_section_name(p); putchar('>'); mark_harmless();
@y
      printf("%s",_("\n! Never used: <"));
      print_section_name(p); putchar('>'); mark_harmless();
@z

Section 94.

@x l.1465
  printf("\n! Line had to be broken (output l. %d):\n",out_line);
@y
  printf(_("\n! Line had to be broken (output l. %d):\n"),out_line);
@z

Section 99.

@x l.1546
        default: err_print("! Double @@ should be used in limbo");
@y
        default: err_print(_("! Double @@ should be used in limbo"));
@z

Section 101.

@x l.1588
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow("token"); *(tok_ptr++)=c;}
@y
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow(_("token")); *(tok_ptr++)=c;}
@z

@x l.1600
          err_print("! Input ended in mid-comment");
@y
          err_print(_("! Input ended in mid-comment"));
@z

@x l.1605
        if (bal>1) err_print("! Missing } in comment");
@y
        if (bal>1) err_print(_("! Missing } in comment"));
@z

@x l.1621
      else {err_print("! Extra } in comment");
@y
      else {err_print(_("! Extra } in comment"));
@z

Section 102.

@x l.1633
  if (bal>1) err_print("! Missing } in comment");
@y
  if (bal>1) err_print(_("! Missing } in comment"));
@z

Section 103.

@x l.1641
    err_print("! Illegal use of @@ in comment");
@y
    err_print(_("! Illegal use of @@ in comment"));
@z

Section 184.

@x l.3264
    overflow("token");
@y
    overflow(_("token"));
@z

@x l.3268
    overflow("text");
@y
    overflow(_("text"));
@z

Section 190.

@x l.3353
  if (tok_ptr+6>tok_mem_end) overflow("token");
@y
  if (tok_ptr+6>tok_mem_end) overflow(_("token"));
@z

Section 191.

@x l.3359
  printf("\nIrreducible scrap sequence in section %d:",(int)section_count);
@y
  printf(_("\nIrreducible scrap sequence in section %d:"),(int)section_count);
@z

Section 192.

@x l.3369
  printf("\nTracing after l. %d:\n",cur_line); mark_harmless();
@y
  printf(_("\nTracing after l. %d:\n"),cur_line); mark_harmless();
@z

Section 197.

@x l.3501
  overflow("scrap/token/text");
@y
  overflow(_("scrap/token/text"));
@z

Section 199.

@x l.3586
      else err_print("! Double @@ should be used in strings");
@y
      else err_print(_("! Double @@ should be used in strings"));
@z

Section 203.

@x l.3669
  if (next_control!='|') err_print("! Missing '|' after C text");
@y
  if (next_control!='|') err_print(_("! Missing '|' after C text"));
@z

Section 211.

@x l.3810
  if (stack_ptr==stack_end) overflow("stack");
@y
  if (stack_ptr==stack_end) overflow(_("stack"));
@z

Section 224.

@x l.4133
  printf("%s","\n! Illegal control code in section name: <");
@y
  printf("%s",_("\n! Illegal control code in section name: <"));
@z

Section 225.

@x l.4148
    printf("%s","\n! C text in section name didn't end: <");
@y
    printf("%s",_("\n! C text in section name didn't end: <"));
@z

@x l.4160
      if (j>buffer+long_buf_size-3) overflow("buffer");
@y
      if (j>buffer+long_buf_size-3) overflow(_("buffer"));
@z

Section 226.

@x l.4168
  if (j>buffer+long_buf_size-4) overflow("buffer");
@y
  if (j>buffer+long_buf_size-4) overflow(_("buffer"));
@z

Section 227.

@x l.4183
if (show_progress) printf("%s","\nWriting the output file...");
@y
if (show_progress) printf("%s",_("\nWriting the output file..."));
@z

Section 232.

@x l.4268
        err_print("! TeX string should be in C text only"); break;
@y
        err_print(_("! TeX string should be in C text only")); break;
@z

@x l.4274
        err_print("! You can't do that in TeX text"); break;
@y
        err_print(_("! You can't do that in TeX text")); break;
@z

Section 236.

@x l.4346
    err_print("! Improper macro definition");
@y
    err_print(_("! Improper macro definition"));
@z

@x l.4360
        } @=/* otherwise fall through */@>@;
      default: err_print("! Improper macro definition"); break;
@y
        } @=/* otherwise fall through */@>@;
      default: err_print(_("! Improper macro definition")); break;
@z

Section 237.

@x l.4386
  if (scrap_ptr!=scrap_info+2) err_print("! Improper format definition");
@y
  if (scrap_ptr!=scrap_info+2) err_print(_("! Improper format definition"));
@z

Section 240.

@x l.4421
  err_print("! You need an = sign after the section name");
@y
  err_print(_("! You need an = sign after the section name"));
@z

Section 241.

@x l.4443
  err_print("! You can't do that in C text");
@y
  err_print(_("! You can't do that in C text"));
@z

Section 247.

@x l.4534
  if (show_progress) printf("%s","\nWriting the index...");
@y
  if (show_progress) printf("%s",_("\nWriting the index..."));
@z

@x l.4545
    fatal("! Cannot open index file ",idx_file_name);
@y
    fatal(_("! Cannot open index file "),idx_file_name);
@z

@x l.4557
    fatal("! Cannot open section file ",scn_file_name);
@y
    fatal(_("! Cannot open section file "),scn_file_name);
@z

@x l.4572
  printf("%s","Done.");
@y
  printf("%s",_("Done."));
@z

Section 258.

@x l.4730
    if (sort_ptr>=scrap_info_end) overflow("sorting");
@y
    if (sort_ptr>=scrap_info_end) overflow(_("sorting"));
@z

Section 270.

@x l.4870
  puts("\nMemory usage statistics:");
@.Memory usage statistics:@>
  printf("%td names (out of %ld)\n",@^system dependencies@>
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
  printf(_("%td names (out of %ld)\n"),@^system dependencies@>
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

@x l.42 of CWEAV-OUTPUT.CH
    fatal("! Cannot open output file ",check_file_name);
@y
    fatal(_("! Cannot open output file "),check_file_name);
@z
