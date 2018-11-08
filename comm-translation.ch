Changes for COMMON.W by Andreas Scherer, November 1, 2018.

This set of changes translates all string values written by the CWEB module
COMMON.W in case of errors or information requests.  Some system-dependent
code for the Amiga operating system is introduced to make use of the
`locale.library' mechanism for user-definable language support.  Care has
been taken to avoid conflicts with non-Amiga systems.  By editing the
external header file `cweb.h' and applying this change file, you can set up
the CWEB programs for a different language than English.

This change file requires COMM-PATCH.CH, COMM-ANSI.CH, COMM-EXTENSIONS.CH,
and COMM-OUTPUT.CH to be applied as well.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

@x l.46
@** Introduction.  This file contains code common
@y
@i amiga_types.w

@** Introduction.  This file contains code common
@z

@x l.93
  @<Initialize pointers@>;
@y
  @<Initialize pointers@>@;
#ifdef _AMIGA
  @<Use catalog translations@>@;
#endif
@z

@x l.184
      ungetc(c,fp); loc=buffer; err_print("! Input line too long");
@y
      ungetc(c,fp); loc=buffer; err_print(get_string(MSG_ERROR_CO9));
@z

@x l.275
    err_print("! Missing @@x in change file");
@y
    err_print(get_string(MSG_ERROR_CO13));
@z

@x l.286
    err_print("! Change file ended after @@x");
@y
    err_print(get_string(MSG_ERROR_CO14));
@z

@x l.334
      err_print("! Change file ended before @@y");
@y
      err_print(get_string(MSG_ERROR_CO16_1));
@z

@x l.348
        err_print("! CWEB file ended during a change");
@y
        err_print(get_string(MSG_ERROR_CO16_2));
@z

@x l.360
  loc=buffer+2; err_print("! Where is the matching @@y?");
@y
  loc=buffer+2; err_print(get_string(MSG_ERROR_CO17_1));
@z

@x l.367
    err_print("of the preceding lines failed to match");
@y
    err_print(get_string(MSG_ERROR_CO17_2));
@z

@x l.397
       fatal("! Cannot open input file ", web_file_name);
@y
       fatal(get_string(MSG_FATAL_CO19_1), web_file_name);
@z

@x l.403
       fatal("! Cannot open change file ", change_file_name);
@y
       fatal(get_string(MSG_FATAL_CO19_2), change_file_name);
@z

@x l.442
      err_print("! Include file name not given");
@y
      err_print(get_string(MSG_ERROR_CO21_1));
@z

@x l.447
      err_print("! Too many nested includes");
@y
      err_print(get_string(MSG_ERROR_CO21_2));
@z

@x l.469
        err_print("! Include file name too long"); goto restart;}
@y
        err_print(get_string(MSG_ERROR_CO22)); goto restart;}
@z

@x l.517
  include_depth--; err_print("! Cannot open include file"); goto restart;
@y
  include_depth--; err_print(get_string(MSG_ERROR_CO23)); goto restart;
@z

@x l.540
    err_print("! Change file ended without @@z");
@y
    err_print(get_string(MSG_ERROR_CO25_1));
@z

@x l.556
        err_print("! Where is the matching @@z?");
@y
        err_print(get_string(MSG_ERROR_CO25_2));
@z

@x l.576
    err_print("! Change file entry did not match");
@y
    err_print(get_string(MSG_ERROR_CO26));
@z

@x l.707
  if (byte_ptr+l>byte_mem_end) overflow("byte memory");
  if (name_ptr>=name_dir_end) overflow("name");
@y
  if (byte_ptr+l>byte_mem_end) overflow(get_string(MSG_OVERFLOW_CO39_1));
  if (name_ptr>=name_dir_end) overflow(get_string(MSG_OVERFLOW_CO39_2));
@z

@x l.867
  if (s+name_len>byte_mem_end) overflow("byte memory");
  if (name_ptr+1>=name_dir_end) overflow("name");
@y
  if (s+name_len>byte_mem_end) overflow(get_string(MSG_OVERFLOW_CO39_1));
  if (name_ptr+1>=name_dir_end) overflow(get_string(MSG_OVERFLOW_CO39_2));
@z

@x l.895
  if (name_ptr>=name_dir_end) overflow("name");
@y
  if (name_ptr>=name_dir_end) overflow(get_string(MSG_OVERFLOW_CO39_2));
@z

@x l.900
  if (s+name_len>byte_mem_end) overflow("byte memory");
@y
  if (s+name_len>byte_mem_end) overflow(get_string(MSG_OVERFLOW_CO39_1));
@z

@x l.945
      printf("\n! Ambiguous prefix: matches <");
@y
      fputs(get_string(MSG_ERROR_CO50_1),stdout);
@z

@x l.948
      printf(">\n and <");
@y
      fputs(get_string(MSG_ERROR_CO50_2),stdout);
@z

@x l.974
      printf("\n! New name is a prefix of <");
@y
      fputs(get_string(MSG_ERROR_CO52_1),stdout);
@z

@x l.986
      printf("\n! New name extends <");
@y
      fputs(get_string(MSG_ERROR_CO52_2),stdout);
@z

@x l.992
    printf("\n! Section name incompatible with <");
@y
    fputs(get_string(MSG_ERROR_CO52_3),stdout);
@z

@x l.995
    printf(">,\n which abbreviates <");
@y
    fputs(get_string(MSG_ERROR_CO52_4),stdout);
@z

@x l.1117
  printf(". (l. %d of change file)\n", change_line);
else if (include_depth==0) printf(". (l. %d)\n", cur_line);
  else printf(". (l. %d of include file %s)\n", cur_line, cur_file_name);
@y
  printf(get_string(MSG_ERROR_CO59_1), change_line);
else if (include_depth==0) printf(get_string(MSG_ERROR_CO59_2), cur_line);
  else printf(get_string(MSG_ERROR_CO59_3), cur_line, cur_file_name);
@z

@x l.1155
  @<Print the job |history|@>;
@y
  @<Print the job |history|@>@;
#ifdef _AMIGA
  @<Close the language catalog@>@;
#endif
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
  if (show_happiness) fputs(get_string(MSG_HAPPINESS_CO62),stdout); break;
case harmless_message:
  fputs(get_string(MSG_WARNING_CO62),stdout); break;
case error_message:
  fputs(get_string(MSG_ERROR_CO62),stdout); break;
case fatal_message:
  fputs(get_string(MSG_FATAL_CO62),stdout);
@z

@x l.1194
  printf("\n! Sorry, %s capacity exceeded",t); fatal("","");
@y
  printf(get_string(MSG_FATAL_CO65),t); fatal("","");
@z

@x l.1203
@d confusion(s) fatal("! This can't happen: ",s)
@y
@d confusion(s) fatal(get_string(MSG_FATAL_CO66),s)
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
if (program==ctangle) fatal(get_string(MSG_FATAL_CO75_2),"");
else fatal(get_string(MSG_FATAL_CO75_4),"");
@.Usage:@>
@z

@x l.1364
@ @<Complain about arg...@>= fatal("! Filename too long\n", *argv);
@y
@ @<Complain about arg...@>= fatal(get_string(MSG_FATAL_CO76), *argv);
@z

@x l.58 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", check_file_name);
@y
    fatal(get_string(MSG_FATAL_CO78), check_file_name);
@z

@x l.69 of COMM-OUTPUT.CH
    fatal("! Cannot open output file ", check_file_name);
@y
    fatal(get_string(MSG_FATAL_CO78), check_file_name);
@z

@x l.293 of COMM-EXTENSIONS.CH
      err_print("! Include path too long"); return(0);
@y
      err_print(get_string(MSG_ERROR_CO82)); return(0);
@z

@x l.1418
@** Index.
@y
@** Multilinguality.  The {\mc AMIGA} operating system (and maybe some
other operating systems as well), starting with version~2.1, is inherently
multilingual.  With the help of system catalogs, any decent program
interface can be made sensitive to the language the user wants to be
addressed with.  All terminal output strings were located and replaced by
references to an external array |AppStrings|.  The English defaults of
these strings can be overwritten by the entries of translated catalogs.
The following include file \.{cweb.h} contains a complete description of
all strings used in this extended \.{CWEB} system.
@^system dependencies@>

@<Include files@>=
#ifdef _AMIGA
#include <proto/exec.h>
#include <proto/locale.h>
@#
struct Library *LocaleBase=NULL; /* pointer to the locale library */
struct Catalog *catalog=NULL; /* pointer to the external catalog */
int i; /* global counter for list of strings */
#else /* non-{\mc AMIGA} systems don't know about \.{<exec/types.h>} */
typedef long int LONG; /* excerpt from \.{<exec/types.h>} */
typedef const char * STRPTR; /* ditto, but \UNIX/ says it's signed. */
#define EXEC_TYPES_H 1 /* don't include \.{<exec/types.h>} in \.{"cweb.h"} */
#endif
@#
#define STRINGARRAY 1 /* include the string array |AppStrings| for real */
#define get_string(n) AppStrings[n].as_Str /* reference string $n$ */
@#
#include "catalogs/cweb.h" /* This header file contains all translated strings */

@ Version~2.1 or higher of the {\mc AMIGA} operating system (represented as
internal version~38) will replace the complete set of terminal output strings
by an external translation in accordance to the system default language.

@<Use catalog translations@>=
if(LocaleBase=(struct Library *)OpenLibrary(
  (unsigned char *)"locale.library",38L)) {
  if(catalog=OpenCatalog(NULL,"cweb.catalog",
    OC_BuiltInLanguage,"english",TAG_DONE)) {
    for(i=MSG_ERROR_CO9; i<=MSG_STATS_CW248_6; ++i)
      AppStrings[i].as_Str=GetCatalogStr(catalog,i,AppStrings[i].as_Str);
  }
}

@ It is essential to close the pointer references to the language catalog
and to the system library before shutting down the program itself.
@^system dependencies@>

@<Close the language catalog@>=
if(LocaleBase) {
  CloseCatalog(catalog);
  CloseLibrary(LocaleBase);
}

@** Index.
@z
