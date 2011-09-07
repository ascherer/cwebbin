Changes for COMMON.W by Andreas Scherer, June 15, 1995.

This set of changes modifies the output behaviour of the CWEB system.
Instead of writing directly to the C or TeX file as described in the
manual, the current run is documented in a temporary output file which
is copied to the expected file in the last moment.  In case of an user
abort, previous results are not destroyed.

This change file requires COMM-PATCH.CH, COMM-ANSI.CH, COMM-EXTENSIONS.CH,
COMM-MEMORY.CH, COMM-TRANSLATION.CH to be applied as well.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

@x l.649
for (h=hash; h<=hash_end; *h++=NULL) ;
@y
for (h=hash; h<=hash_end; *h++=NULL) ;
alloc_object(check_file_name,max_file_name_length,char);
@z

@x l.129 of COMM-EXTENSIONS.CH
  switch(history) {
@y
  @<Remove the temporary file if not already done@>@;
  switch(history) {
@z

@x l.125 of COMM-MEMORY.CH
char *scn_file_name; /* name of |scn_file| */
@y
char *scn_file_name; /* name of |scn_file| */
char *check_file_name; /* name of |check_file| */
@z

@x l.1371
FILE *scn_file; /* where list of sections from \.{CWEAVE} goes */
@y
FILE *scn_file; /* where list of sections from \.{CWEAVE} goes */
FILE *check_file; /* temporary output file */
@z

@x l.285 of COMM-TRANSLATION.CH
@ @<Scan arguments and open output files@>=
scan_args();
if (program==ctangle) {
  if ((C_file=fopen(C_file_name,"w"))==NULL)
    fatal(get_string(MSG_FATAL_CO78), C_file_name);
@.Cannot open output file@>
}
else {
  if ((tex_file=fopen(tex_file_name,"w"))==NULL)
    fatal(get_string(MSG_FATAL_CO78), tex_file_name);
}
@y
@ @<Scan arguments and open output files@>=
scan_args();
if (program==ctangle) {
  strcpy(check_file_name,C_file_name);
  if(check_file_name[0]!='\0') {
    char *dot_pos=strrchr(check_file_name,'.');
    if(dot_pos==NULL) strcat(check_file_name,".ttp");
    else strcpy(dot_pos,".ttp");
    }
  if ((C_file=fopen(check_file_name,"w"))==NULL)
    fatal(get_string(MSG_FATAL_CO78), check_file_name);
@.Cannot open output file@>
}
else {
  strcpy(check_file_name,tex_file_name);
  if(check_file_name[0]!='\0') {
    char *dot_pos=strrchr(check_file_name,'.');
    if(dot_pos==NULL) strcat(check_file_name,".wtp");
    else strcpy(dot_pos,".wtp");
    }
  if ((tex_file=fopen(check_file_name,"w"))==NULL)
    fatal(get_string(MSG_FATAL_CO78), check_file_name);
}
@z

@x l.1415
@** Index.
@y
@** Temporary file output.  Before we leave the program we have to make
sure that the output files are correctly written.

@<Remove the temporary file...@>=
  if(C_file) fclose(C_file);
  if(tex_file) fclose(tex_file);
  if(check_file) fclose(check_file);
  if(check_file_name) /* Delete the temporary file in case of a break */
    remove(check_file_name);

@** Index.
@z
