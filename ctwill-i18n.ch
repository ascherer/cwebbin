@d banner "This is CTWILL (Version 3.64 [CWEBbin 2018])"
  } else err_print("! Title should be enclosed in braces or doublequotes");
  if (last>limit) err_print("! Title name didn't end");
  if (title_code_ptr==&title_code[max_titles]) overflow("titles");
        err_print("! String didn't end"); loc=limit; break;
        err_print("! Input ended in middle of string"); loc=buffer; break;
    printf("\n! String too long: ");
    case translit_code: err_print("! Use @@l in limbo only"); continue;
    err_print("! Input ended in section name");
  printf("\n! Section name too long: ");
    err_print("! Section name didn't end"); break;
    err_print("! Control codes are forbidden in section name"); break;
    err_print("! Control text didn't end"); loc=limit;
      err_print("! Control codes are forbidden in control text");
    err_print("! Identifier in meaning should be followed by space");
      err_print("! Location in meaning should be followed by space");
        overflow("temp meanings");
  if (loc>=limit) err_print("! Verbatim string didn't end");
  if (++section_count==max_sections) overflow("section number");
    case translit_code: err_print("! Use @@l in limbo only"); continue;
    err_print("! Missing left identifier of @@s");
      err_print("! Missing right identifier of @@s");
      printf("\n! Never defined: <"); print_section_name(p); putchar('>'); mark_harmless;
      printf("\n! Never used: <"); print_section_name(p); putchar('>'); mark_harmless;
  printf("\n! Line had to be broken (output l. %d):\n",out_line);
        default: err_print("! Double @@ should be used in limbo");
@d app_tok(c) {if (tok_ptr+2>tok_mem_end) overflow("token"); *(tok_ptr++)=c;}
          err_print("! Input ended in mid-comment");
        if (bal>1) err_print("! Missing } in comment");
      else {err_print("! Extra } in comment");
  if (bal>1) err_print("! Missing } in comment");
    err_print("! Illegal use of @@ in comment");
    } else if (*j>=inner_tok_flag) confusion("inner");
    if (**q<tok_flag) confusion("find type");
    strcpy(ministring_buf,"label");
    overflow("token");
    overflow("text");
  printf("\nIrreducible scrap sequence in section %d:",section_count);
  printf("\nTracing after l. %d:\n",cur_line); mark_harmless;
  overflow("scrap/token/text");
        else err_print("! Double @@ should be used in strings");
  if (next_control!='|') err_print("! Missing '|' after C text");
  if (stack_ptr==stack_end) overflow("stack");
  printf("\n! Illegal control code in section name: <");
    printf("\n! C text in section name didn't end: <");
      if (j>buffer+long_buf_size-3) overflow("buffer");
reset_input(); if (show_progress) printf("\nWriting the output file...");
  if (include_depth) err_print("! Only @@$ is allowed in aux and bux files");
  fatal("! Cannot open aux output file ",aux_file_name);
        err_print("! TeX string should be in C text only"); break;
        err_print("! You can't do that in TeX text"); break;
    err_print("! Improper macro definition");
    else out_str("macro");
  if (scrap_ptr!=scrap_info+2) err_print("! Improper format definition");
  err_print("! You need an = sign after the section name");
  err_print("! You can't do that in C text");
  phase=3; if (show_progress) printf("\nWriting the index...");
    fatal("! Cannot open index file ",idx_file_name);
    fatal("! Cannot open section file ",scn_file_name);
  printf("Done.");
    if (sort_ptr>=scrap_info_end) overflow("sorting");
  printf("\nMemory usage statistics:\n");
  printf("%ld names (out of %ld)\n",
  printf("%ld cross-references (out of %ld)\n",
  printf("%ld bytes (out of %ld)\n",
  printf("%ld temp meanings (out of %ld)\n",
  printf("%ld titles (out of %ld)\n",
  printf("Parsing:\n");
  printf("%ld scraps (out of %ld)\n",
  printf("%ld texts (out of %ld)\n",
  printf("%ld tokens (out of %ld)\n",
  printf("%ld levels (out of %ld)\n",
  printf("Sorting:\n");
  printf("%ld levels (out of %ld)\n",
    fatal("! Cannot open output file ",check_file_name);
