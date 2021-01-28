Changes for COMMON.W by Andreas Scherer, January 2021.

This set of changes modifies the output behaviour of the CWEB system.
Instead of writing directly to the C or TeX file as described in the
manual, the current run is documented in a temporary output file which
is copied to the expected file in the last moment.  In case of an user
abort, previous results are not destroyed.

This change file requires COMM-PATCH.CH and COMM-EXTENSIONS.CH to be
applied as well.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

Section 74.

@x l.1074
  @<Print the job |history|@>@;
@y
  @<Print the job |history|@>@;
  @<Remove the temporary file if not already done@>@;
@z

Section 80.

@x l.1138
char scn_file_name[max_file_name_length]; /* name of |scn_file| */
@y
char scn_file_name[max_file_name_length]; /* name of |scn_file| */
char check_file_name[max_file_name_length]; /* name of |check_file| */
@z

Section 81.

@x l.1146
show_banner=show_happiness=show_progress=make_xrefs=true;@/
@y
show_banner=show_happiness=show_progress=make_xrefs=true;@/
temporary_output=true; /* Check temporary output for changes */
@z

Section 90.

@x l.1284
FILE *scn_file; /* where list of sections from \.{CWEAVE} goes */
@y
FILE *scn_file; /* where list of sections from \.{CWEAVE} goes */
FILE *check_file; /* temporary output file */
@z

Section 91.

@x l.1287
@ @<Scan arguments and open output files@>=
scan_args();
if (program==ctangle) {
  if ((C_file=fopen(C_file_name,"wb"))==NULL)
    fatal("! Cannot open output file ", C_file_name);
@.Cannot open output file@>
}
else {
  if ((tex_file=fopen(tex_file_name,"wb"))==NULL)
    fatal("! Cannot open output file ", tex_file_name);
}
@y
@ @<Scan arguments and open output files@>=
scan_args();
if (program==ctangle) {
  if ((C_file=fopen(C_file_name,"a"))==NULL)
    fatal("! Cannot open output file ", C_file_name);
@.Cannot open output file@>
  else fclose(C_file); /* Test accessability */
  strcpy(check_file_name,C_file_name);
  if(check_file_name[0]!='\0') {
    char *dot_pos=strrchr(check_file_name,'.');
    if(dot_pos==NULL) strcat(check_file_name,".ttp");
    else strcpy(dot_pos,".ttp");
  }
  if ((C_file=fopen(check_file_name,"wb"))==NULL)
    fatal("! Cannot open output file ", check_file_name);
@.Cannot open output file@>
}
else {
  if ((tex_file=fopen(tex_file_name,"a"))==NULL)
    fatal("! Cannot open output file ", tex_file_name);
  else fclose(tex_file); /* Test accessability */
  strcpy(check_file_name,tex_file_name);
  if(check_file_name[0]!='\0') {
    char *dot_pos=strrchr(check_file_name,'.');
    if(dot_pos==NULL) strcat(check_file_name,".wtp");
    else strcpy(dot_pos,".wtp");
  }
  if ((tex_file=fopen(check_file_name,"wb"))==NULL)
    fatal("! Cannot open output file ", check_file_name);
}
@z

New material after section 92.

@x l.1309
@** Index.
@y
@* Temporary file output.  Before we leave the program we have to make
sure that the output files are correctly written.

@<Remove the temporary file...@>=
if(C_file) fclose(C_file);
if(tex_file) fclose(tex_file);
if(check_file) fclose(check_file);
if(strlen(check_file_name)) /* Delete the temporary file in case of a break */
   remove(check_file_name);

@** Index.
@z
