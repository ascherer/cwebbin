Changes for CWEAVE.W by Andreas Scherer, November 1, 2018.

This set of chagnes modifies the output behaviour of the CWEB system.
Instead of writing directly to the C or TeX file as described in the
manual, the current run is documented in a temporary output file which is
copied to the expected file in the last moment.  In case of an user abort,
previous results are not destroyed.

This change file requires CWEAV-PATCH.CH, CWEAV-ANSI.CH, and
CWEAV-EXTENSIONS.CH to be applied as well.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

@x l.4300
if (no_xref) {
  finish_line();
  out_str("\\end");
@.\\end@>
  finish_line();
}
@y
if (no_xref) {
  finish_line();
  out_str("\\end");
@.\\end@>
  active_file=tex_file;
}
@z

@x l.4310 Use binary mode for output files
  if ((idx_file=fopen(idx_file_name,"w"))==NULL)
@y
  if ((idx_file=fopen(idx_file_name,"wb"))==NULL)
@z

@x l.4314
    @<Tell about changed sections@>; finish_line(); finish_line();
@y
    @<Tell about changed sections@>@; finish_line(); finish_line();
@z

@x l.4319
  @<Do the first pass of sorting@>;
  @<Sort and output the index@>;
@y
  @<Do the first pass of sorting@>@;
  @<Sort and output the index@>@;
@z

@x l.4325 Use binary mode for output files
  if ((scn_file=fopen(scn_file_name,"w"))==NULL)
@y
  if ((scn_file=fopen(scn_file_name,"wb"))==NULL)
@z

@x l.4329
  @<Output all the section names@>;
@y
  @<Output all the section names@>@;
@z

@x l.4334
@.\\end@>
  finish_line();
  fclose(active_file);
}
@y
@.\\end@>
}
finish_line(); fclose(active_file); active_file=NULL;
@<Update the result when it has changed@>@;
@z

@x l.4614
@ @<Output all the section names@>=section_print(root)
@y
@ @<Output all the section names@>=section_print(root);
@z

@x l.4644
@** Index.
@y
@* Output file update.  Most \CEE/ projects are controlled by a
\.{Makefile} which automatically takes care of the temporal dependecies
between the different source modules.  It is suitable that \.{CWEB} doesn't
create new output for all existing files, when there are only changes to
some of them.  Thus the \.{make} process will only recompile those modules
where necessary. The idea and basic implementation of this mechanism can
be found in the program \.{NUWEB} by Preston Briggs, to whom credit is due.

@<Update the result...@>=
if((tex_file=fopen(tex_file_name,"r"))!=NULL) {
  char x[BUFSIZ],y[BUFSIZ];
  int x_size,y_size,comparison;

  if((check_file=fopen(check_file_name,"r"))==NULL)
    fatal("! Cannot open output file ",check_file_name);

  @<Compare the temporary output to the previous output@>@;

  fclose(tex_file); tex_file=NULL;
  fclose(check_file); check_file=NULL;

  @<Take appropriate action depending on the comparison@>@;
} else
  rename(check_file_name,tex_file_name); /* This was the first run */

strcpy(check_file_name,""); /* We want to get rid of the temporary file */

@ We hope that this runs fast on most systems.

@<Compare the temp...@>=
do {
  x_size = fread(x,1,BUFSIZ,tex_file);
  y_size = fread(y,1,BUFSIZ,check_file);
  comparison = (x_size == y_size); /* Do not merge these statements! */
  if(comparison) comparison = !memcmp(x,y,x_size);
} while(comparison && !feof(tex_file) && !feof(check_file));

@ Note the superfluous call to |remove| before |rename|.  We're using it to
get around a bug in some implementations of |rename|.

@<Take appropriate action...@>=
if(comparison)
  remove(check_file_name); /* The output remains untouched */
else {
  remove(tex_file_name);
  rename(check_file_name,tex_file_name);
}

@** Index.
@z
