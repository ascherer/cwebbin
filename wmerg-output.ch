Changes for WMERGE.W by Andreas Scherer, October 30, 2018.

This set of changes modifies the output behaviour of the CWEB system.
Instead of writing directly to the file as described in the manual, the
current run is documented in a temporary output file which is copied to the
expected file in the last moment.  In case of an user abort, previous
results are not destroyed.

This change file somewhat requires WMERG-PATCH.CH and WMERG-ANSI.CH
to be applied as well.

For a complete history of the changes made to WMERGE.W see WMERG-PATCH.CH.

@x l.34
  return wrap_up();
@y
  if(out_file!=stdout) {
    fclose(out_file); out_file=NULL;
    @<Update the result when it has changed@>@;
  }
  return wrap_up();
@z

@x l.557
  @<Print the job |history|@>;
@y
  @<Remove the temporary file if not already done@>@;
  @<Print the job |history|@>;
@z

@x l.587
char out_file_name[max_file_name_length]; /* name of |out_file| */
@y
char check_file_name[max_file_name_length]; /* name of |check_file| */
char out_file_name[max_file_name_length]; /* name of |out_file| */
@z

@x l.701
FILE *out_file; /* where output goes */
@y
FILE *check_file; /* where the temporary output goes */
FILE *out_file; /* where output goes */
@z

@x l.705
if (out_file_name[0]=='\0') out_file=stdout;
else if ((out_file=fopen(out_file_name,"w"))==NULL)
    fatal("! Cannot open output file ", out_file_name);
@y
strcpy(check_file_name,out_file_name);
if(check_file_name[0]!='\0') {
  char *dot_pos=strrchr(check_file_name,'.');
  if(dot_pos==NULL) strcat(check_file_name,".mtp");
  else strcpy(dot_pos,".mtp");
}
if (out_file_name[0]=='\0') out_file=stdout;
else if ((out_file=fopen(check_file_name,"w"))==NULL)
    fatal("! Cannot open output file ", check_file_name);
@z

@x l.717
@* Index.
@y
@* Output file update.  Most \CEE/ projects are controlled by a
\.{makefile} which automatically takes care of the temporal dependencies
between the different source modules.  It is suitable that \.{CWEB} doesn't
create new output for all existing files, when there are only changes to
some of them.  Thus the \.{make} process will only recompile those modules
where necessary.  The idea and basic implementation of this mechanism can
be found in the program \.{NUWEB} by Preston Briggs, to whom credit is due.

@<Update the result...@>=
if((out_file=fopen(out_file_name,"r"))!=NULL) {
  char x[BUFSIZ],y[BUFSIZ];
  int x_size,y_size,comparison;

  if((check_file=fopen(check_file_name,"r"))==NULL)
    fatal("! Cannot open output file",check_file_name);

  @<Compare the temporary output to the previous output@>@;

  fclose(out_file); out_file=NULL;
  fclose(check_file); check_file=NULL;

  @<Take appropriate action depending on the comparison@>@;
} else
  rename(check_file_name,out_file_name); /* This was the first run */

strcpy(check_file_name,""); /* We want to get rid of the temporary file */

@ We hope that this runs fast on most systems.

@<Compare the temp...@>=
do {
  x_size = fread(x,1,BUFSIZ,out_file);
  y_size = fread(y,1,BUFSIZ,check_file);
  comparison = (x_size == y_size); /* Do not merge these statements! */
  if(comparison) comparison = !memcmp(x,y,x_size);
} while(comparison && !feof(out_file) && !feof(check_file));

@ Note the superfluous call to |remove| before |rename|.  We're using it to
get around a bug in some implementations of |rename|.

@<Take appropriate action...@>=
if(comparison)
  remove(check_file_name); /* The output remains untouched */
else {
  remove(out_file_name);
  rename(check_file_name,out_file_name);
}

@ @<Remove the temporary file...@>=
  if(out_file)
    fclose(out_file);
  if(check_file)
    fclose(check_file);
  if(strlen(check_file_name))
    remove(check_file_name);

@* Index.
@z
