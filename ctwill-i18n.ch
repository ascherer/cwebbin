@d banner "This is CTWILL (Version 3.64 [CWEBbin 2018])"
  } else err_print("! Title should be enclosed in braces or doublequotes");
  if (last>limit) err_print("! Title name didn't end");
  if (title_code_ptr==&title_code[max_titles]) overflow("titles");
    err_print("! Identifier in meaning should be followed by space");
      err_print("! Location in meaning should be followed by space");
        overflow("temp meanings");
    } else if (*j>=inner_tok_flag) confusion("inner");
    if (**q<tok_flag) confusion("find type");
  if (include_depth) err_print("! Only @@$ is allowed in aux and bux files");
  fatal("! Cannot open aux output file ",aux_file_name);
  printf("%ld temp meanings (out of %ld)\n",
