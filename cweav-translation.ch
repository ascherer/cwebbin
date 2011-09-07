Changes for CWEAVE.W by Andreas Scherer, October 29, 2005.

This set of changes translates all string values written by the CWEB module
CWEAVE.W in case of errors or information requests.  By editing the
external header file `cweb.h' and applying this change file, you can set up
the CWEB system for a different language than English.

This change file requires CWEAV-PATCH.CH, CWEAVE-ANSI.CH,
CWEAV-EXTENSIONS.CH, CWEAV-MEMORY.CH to be applied as well.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

@x l.64
@d banner "This is CWEAVE (Version 3.64 [p21])\n"
@y
@d banner get_string(MSG_BANNER_CW1)
@z

@x l.256
@d append_xref(c) if (xref_ptr==xmem_end) overflow("cross-reference");
@y
@d append_xref(c) if (xref_ptr==xmem_end) overflow(get_string(MSG_OVERFLOW_CW21));
@z

@x l.821
        err_print("! String didn't end"); loc=limit; break;
@y
        err_print(get_string(MSG_ERROR_CT67_1)); loc=limit; break;
@z

@x l.825
        err_print("! Input ended in middle of string"); loc=buffer; break;
@y
        err_print(get_string(MSG_ERROR_CT67_2)); loc=buffer; break;
@z

@x l.840
    printf("\n! String too long: ");
@y
    printf(get_string(MSG_ERROR_CT67_3));
@z

@x l.855
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(get_string(MSG_ERROR_CT68_1)); continue;
@z

@x l.894
    err_print("! Input ended in section name");
@y
    err_print(get_string(MSG_ERROR_CT72_1));
@z

@x l.907
  printf("\n! Section name too long: ");
@y
  printf(get_string(MSG_ERROR_CT72_2));
@z

@x l.921
    err_print("! Section name didn't end"); break;
@y
    err_print(get_string(MSG_ERROR_CT73_1)); break;
@z

@x l.925
    err_print("! Control codes are forbidden in section name"); break;
@y
    err_print(get_string(MSG_ERROR_CW54)); break;
@z

@x l.945
    err_print("! Control text didn't end"); loc=limit;
@y
    err_print(get_string(MSG_ERROR_CW56_1)); loc=limit;
@z

@x l.951
      err_print("! Control codes are forbidden in control text");
@y
      err_print(get_string(MSG_ERROR_CW56_2));
@z

@x l.964
  if (loc>=limit) err_print("! Verbatim string didn't end");
@y
  if (loc>=limit) err_print(get_string(MSG_ERROR_CT74));
@z

@x l.1004
  if (++section_count==max_sections) overflow("section number");
@y
  if (++section_count==max_sections) overflow(get_string(MSG_OVERFLOW_CW61));
@z

@x l.1095
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(get_string(MSG_ERROR_CT68_1)); continue;
@z

@x l.1182
    err_print("! Missing left identifier of @@s");
@y
    err_print(get_string(MSG_ERROR_CW71_1));
@z

@x l.1187
      err_print("! Missing right identifier of @@s");
@y
      err_print(get_string(MSG_ERROR_CW71_2));
@z

@x l.1240
      printf("\n! Never defined: <"); print_section_name(p); putchar('>'); mark_harmless;
@y
      printf(get_string(MSG_WARNING_CW75_1));
      print_section_name(p); putchar('>'); mark_harmless;
@z

@x l.1245
      printf("\n! Never used: <"); print_section_name(p); putchar('>'); mark_harmless;
@y
      printf(get_string(MSG_WARNING_CW75_2));
      print_section_name(p); putchar('>'); mark_harmless;
@z

@x l.1388
  printf("\n! Line had to be broken (output l. %d):\n",out_line);
@y
  printf(get_string(MSG_WARNING_CW85),out_line);
@z

@x l.1461
        default: err_print("! Double @@ should be used in limbo");
@y
        default: err_print(get_string(MSG_ERROR_CT93));
@z

@x l.1503
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow("token"); *(tok_ptr++)=c;}
@y
@d app_tok(c) {if (tok_ptr+2>tok_mem_end)
    overflow(get_string(MSG_OVERFLOW_CT26));
  *(tok_ptr++)=c;}
@z

@x l.1518
          err_print("! Input ended in mid-comment");
@y
          err_print(get_string(MSG_ERROR_CT60_1));
@z

@x l.1524
        if (bal>1) err_print("! Missing } in comment");
@y
        if (bal>1) err_print(get_string(MSG_ERROR_CW92_1));
@z

@x l.1540
      else {err_print("! Extra } in comment");
@y
      else {err_print(get_string(MSG_ERROR_CW92_2));
@z

@x l.1552
  if (bal>1) err_print("! Missing } in comment");
@y
  if (bal>1) err_print(get_string(MSG_ERROR_CW92_1));
@z

@x l.1560
    err_print("! Illegal use of @@ in comment");
@y
    err_print(get_string(MSG_ERROR_CW94));
@z

@x l.2933
    overflow("token");
@y
    overflow(get_string(MSG_OVERFLOW_CT30));
@z

@x l.2937
    overflow("text");
@y
    overflow(get_string(MSG_OVERFLOW_CT76));
@z

@x l.3017
    if (tok_ptr+6>tok_mem_end) overflow("token");
@y
    if (tok_ptr+6>tok_mem_end) overflow(get_string(MSG_OVERFLOW_CT26));
@z

@x l.3024
  printf("\nIrreducible scrap sequence in section %d:",section_count);
@y
  printf(get_string(MSG_WARNING_CW171),section_count);
@z

@x l.3034
  printf("\nTracing after l. %d:\n",cur_line); mark_harmless;
@y
  printf(get_string(MSG_WARNING_CW172),cur_line); mark_harmless;
@z

@x l.3162
  overflow("scrap/token/text");
@y
  overflow(get_string(MSG_OVERFLOW_CW176));
@z

@x l.3246
        else err_print("! Double @@ should be used in strings");
@y
        else err_print(get_string(MSG_ERROR_CT80));
@z

@x l.3320
  if (next_control!='|') err_print("! Missing '|' after C text");
@y
  if (next_control!='|') err_print(get_string(MSG_ERROR_CW182));
@z

@x l.3443
  if (stack_ptr==stack_end) overflow("stack");
@y
  if (stack_ptr==stack_end) overflow(get_string(MSG_OVERFLOW_CT30));
@z

@x l.3757
  printf("\n! Illegal control code in section name: <");
@y
  printf(get_string(MSG_ERROR_CW201));
@z

@x l.3772
    printf("\n! C text in section name didn't end: <");
@y
    printf(get_string(MSG_ERROR_CW202));
@z

@x l.3784
      if (j>buffer+long_buf_size-3) overflow("buffer");
@y
      if (j>buffer+long_buf_size-3) overflow(get_string(MSG_OVERFLOW_CW202));
@z

@x l.3792
  if (j>buffer+long_buf_size-4) overflow("buffer");
@y
  if (j>buffer+long_buf_size-4) overflow(get_string(MSG_OVERFLOW_CW202));
@z

@x l.3809
reset_input(); if (show_progress) printf("\nWriting the output file...");
@y
reset_input(); if (show_progress) printf(get_string(MSG_PROGRESS_CW204));
@z

@x l.3892
        err_print("! TeX string should be in C text only"); break;
@y
        err_print(get_string(MSG_ERROR_CW209_1)); break;
@z

@x l.3898
        err_print("! You can't do that in TeX text"); break;
@y
        err_print(get_string(MSG_ERROR_CW209_2)); break;
@z

@x l.3970
    err_print("! Improper macro definition");
@y
    err_print(get_string(MSG_ERROR_CW213));
@z

@x l.3979
      default: err_print("! Improper macro definition"); break;
@y
      default: err_print(get_string(MSG_ERROR_CW213)); break;
@z

@x l.4005
  if (scrap_ptr!=scrap_info+2) err_print("! Improper format definition");
@y
  if (scrap_ptr!=scrap_info+2) err_print(get_string(MSG_ERROR_CW214));
@z

@x l.4040
  err_print("! You need an = sign after the section name");
@y
  err_print(get_string(MSG_ERROR_CW217));
@z

@x l.4062
  err_print("! You can't do that in C text");
@y
  err_print(get_string(MSG_ERROR_CW218));
@z

@x l.4338
    if (sort_ptr>=scrap_info_end) overflow("sorting");
@y
    if (sort_ptr>=scrap_info_end) overflow(get_string(MSG_OVERFLOW_CW237));
@z

@x l.4474
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
  printf(get_string(MSG_STATS_CT95_1));
@.Memory usage statistics:@>
  printf(get_string(MSG_STATS_CT95_2),
            (long)(name_ptr-name_dir),(long)max_names);
  printf(get_string(MSG_STATS_CW248_1),
            (long)(xref_ptr-xmem),(long)max_refs);
  printf(get_string(MSG_STATS_CT95_4),
            (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf(get_string(MSG_STATS_CW248_2));
  printf(get_string(MSG_STATS_CW248_3),
            (long)(max_scr_ptr-scrap_info),(long)max_scraps);
  printf(get_string(MSG_STATS_CW248_4),
            (long)(max_text_ptr-tok_start),(long)max_texts);
  printf(get_string(MSG_STATS_CT95_5),
            (long)(max_tok_ptr-tok_mem),(long)max_toks);
  printf(get_string(MSG_STATS_CW248_5),
            (long)(max_stack_ptr-stack),(long)stack_size);
  printf(get_string(MSG_STATS_CW248_6));
  printf(get_string(MSG_STATS_CW248_5),
            (long)(max_sort_ptr-scrap_info),(long)max_scraps);
}
@z
