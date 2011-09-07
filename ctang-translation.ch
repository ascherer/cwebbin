Changes for CTANGLE.W by Andreas Scherer, May 9, 1995.

This set of changes translates all string values written by the CWEB module
CTANGLE.W in case of errors or information requests.  By editing the
external header file `cweb.h' and applying this change file, you can set up
the CWEB system for a different language than English.

This change file requires CTANG-PATCH.CH, CTANG-ANSI.ch,
CTANG-EXTENSIONS.CH, CTANG-MEMORY.CH to be applied as well.

For a complete history of the changes made to CTANGLE.W see CTANG-PATCH.CH.

@x l.186 of CTANG-PATCH.CH
@d banner "This is CTANGLE (Version 3.64 [p20])\n"
@y
@d banner get_string(MSG_BANNER_CT1)
@z

@x l.262
  if (tok_ptr+2>tok_mem_end) overflow("token");
@y
  if (tok_ptr+2>tok_mem_end) overflow(get_string(MSG_OVERFLOW_CT26));
@z

@x l.338
  if (stack_ptr==stack_end) overflow("stack");
@y
  if (stack_ptr==stack_end) overflow(get_string(MSG_OVERFLOW_CT30));
@z

@x l.425
    printf("\n! Not present: <");
@y
    printf(get_string(MSG_ERROR_CT34));
@z

@x l.522
      overflow("output files");
@y
      overflow(get_string(MSG_OVERFLOW_CT40));
@z

@x l.541
    printf("\n! No program text was specified."); mark_harmless;
@y
    printf(get_string(MSG_WARNING_CT42)); mark_harmless;
@z

@x l.547
        printf("\nWriting the output file (%s):",C_file_name);
@y
        printf(get_string(MSG_PROGRESS_CT42_1),C_file_name);
@z

@x l.551
        printf("\nWriting the output files:");
@y
        printf(get_string(MSG_PROGRESS_CT42_2));
@z

@x l.561
    if(show_happiness) printf("\nDone.");
@y
    if(show_happiness) printf(get_string(MSG_PROGRESS_CT42_3));
@z

@x l.575
    if (C_file ==0) fatal("! Cannot open output file:",output_file_name);
@y
    if (C_file ==0) fatal(get_string(MSG_FATAL_CO78),output_file_name);
@z

@x l.627
          else if (a<050000) { confusion("macro defs have strange char");}
@y
          else if (a<050000) { confusion(get_string(MSG_CONFUSION_CT47));}
@z

@x l.851
          err_print("! Input ended in mid-comment");
@y
          err_print(get_string(MSG_ERROR_CT60_1));
@z

@x l.864
        err_print("! Section name ended in mid-comment"); loc--;
@y
        err_print(get_string(MSG_ERROR_CT60_2)); loc--;
@z

@x l.1011
        err_print("! String didn't end"); loc=limit; break;
@y
        err_print(get_string(MSG_ERROR_CT67_1)); loc=limit; break;
@z

@x l.1015
        err_print("! Input ended in middle of string"); loc=buffer; break;
@y
        err_print(get_string(MSG_ERROR_CT67_2)); loc=buffer; break;
@z

@x l.1033
    printf("\n! String too long: ");
@y
    printf(get_string(MSG_ERROR_CT67_3));
@z

@x l.1050
    case translit_code: err_print("! Use @@l in limbo only"); continue;
@y
    case translit_code: err_print(get_string(MSG_ERROR_CT68_1)); continue;
@z

@x l.1055
        err_print("! Double @@ should be used in control text");
@y
        err_print(get_string(MSG_ERROR_CT68_2));
@z

@x l.1081
        err_print("! Double @@ should be used in ASCII constant");
@y
        err_print(get_string(MSG_ERROR_CT69));
@z

@x l.1087
        err_print("! String didn't end"); loc=limit-1; break;
@y
        err_print(get_string(MSG_ERROR_CT67_1)); loc=limit-1; break;
@z

@x l.1118
    err_print("! Input ended in section name");
@y
    err_print(get_string(MSG_ERROR_CT72_1));
@z

@x l.1131
  printf("\n! Section name too long: ");
@y
  printf(get_string(MSG_ERROR_CT72_2));
@z

@x l.1145
    err_print("! Section name didn't end"); break;
@y
    err_print(get_string(MSG_ERROR_CT73_1)); break;
@z

@x l.1149
    err_print("! Nesting of section names not allowed"); break;
@y
    err_print(get_string(MSG_ERROR_CT73_2)); break;
@z

@x l.1163
  if (loc>=limit) err_print("! Verbatim string didn't end");
@y
  if (loc>=limit) err_print(get_string(MSG_ERROR_CT74));
@z

@x l.1189
@d app_repl(c)  {if (tok_ptr==tok_mem_end) overflow("token"); *tok_ptr++=c;}
@y
@d app_repl(c)
  {if (tok_ptr==tok_mem_end) overflow(get_string(MSG_OVERFLOW_CT26));
   *tok_ptr++=c;}
@z

@x l.1213
  if (text_ptr>text_info_end) overflow("text");
@y
  if (text_ptr>text_info_end) overflow(get_string(MSG_OVERFLOW_CT76));
@z

@x l.1254
    err_print("! @@d, @@f and @@c are ignored in C text"); continue;
@y
    err_print(get_string(MSG_ERROR_CT78)); continue;
@z

@x l.1264
  if (*try_loc=='=') err_print ("! Missing `@@ ' before a named section");
@y
  if (*try_loc=='=') err_print (get_string(MSG_ERROR_CT79));
@z

@x l.1275
      else err_print("! Double @@ should be used in string");
@y
      else err_print(get_string(MSG_ERROR_CT80));
@z

@x l.1322
    default: err_print("! Unrecognized escape sequence");
@y
    default: err_print(get_string(MSG_ERROR_CT81));
@z

@x l.1397
    err_print("! Definition flushed, must start with identifier");
@y
    err_print(get_string(MSG_ERROR_CT85));
@z

@x l.1487
            err_print("! Double @@ should be used in control text");
@y
            err_print(get_string(MSG_ERROR_CT68_2));
@z

@x l.1491
        default: err_print("! Double @@ should be used in limbo");
@y
        default: err_print(get_string(MSG_ERROR_CT93));
@z

@x l.1503
    err_print("! Improper hex number following @@l");
@y
    err_print(get_string(MSG_ERROR_CT94_1));
@z

@x l.1513
      err_print("! Replacement string in @@l too long");
@y
      err_print(get_string(MSG_ERROR_CT94_2));
@z

@x l.1527
  printf("\nMemory usage statistics:\n");
  printf("%ld names (out of %ld)\n",
          (long)(name_ptr-name_dir),(long)max_names);
  printf("%ld replacement texts (out of %ld)\n",
          (long)(text_ptr-text_info),(long)max_texts);
  printf("%ld bytes (out of %ld)\n",
          (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf("%ld tokens (out of %ld)\n",
          (long)(tok_ptr-tok_mem),(long)max_toks);
@y
  printf(get_string(MSG_STATS_CT95_1));
  printf(get_string(MSG_STATS_CT95_2),
          (long)(name_ptr-name_dir),(long)max_names);
  printf(get_string(MSG_STATS_CT95_3),
          (long)(text_ptr-text_info),(long)max_texts);
  printf(get_string(MSG_STATS_CT95_4),
          (long)(byte_ptr-byte_mem),(long)max_bytes);
  printf(get_string(MSG_STATS_CT95_5),
          (long)(tok_ptr-tok_mem),(long)max_toks);
@z
