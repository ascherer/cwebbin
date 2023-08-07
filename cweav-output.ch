Changes for CWEAVE.W by Andreas Scherer, October 2021.

This set of changes modifies the output behaviour of the CWEB system.
Instead of writing directly to the C or TeX file as described in the
manual, the current run is documented in a temporary output file which is
copied to the expected file in the last moment.  In case of an user abort,
previous results are not destroyed.

This change file requires CWEAV-PATCH.CH and CWEAV-EXTENSIONS.CH to be
applied as well.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

Section 247.

@x l.4515
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
}
@z

@x l.4549
@.\\end@>
  finish_line();
  fclose(active_file);
}
@y
@.\\end@>
}
finish_line(); fclose(active_file); active_file=tex_file=NULL;
if (check_for_change) @<Update the result when it has changed@>@;
@z

Additional material.

@x l.4873
@** Index.
@y
@* Output file update. Most \CEE/ projects are controlled by a \.{Makefile}
that automatically takes care of the temporal dependecies between the different
source modules. It may be convenient that \.{CWEB} doesn't create new output
for all existing files, when there are only changes to some of them. Thus the
\.{make} process will only recompile those modules where necessary. You can
activate this feature with the `\.{+c}' command-line option. The idea and basic
implementation of this mechanism can be found in the program \.{NUWEB} by
Preston Briggs, to whom credit is due.

@<Update the result...@>= {
if((tex_file=fopen(tex_file_name,"r"))!=NULL) {
  boolean comparison=false;

  if((check_file=fopen(check_file_name,"r"))==NULL)
    fatal("! Cannot open output file ",check_file_name);
@.Cannot open output file@>

  @<Compare the temporary output...@>@;

  fclose(tex_file); tex_file=NULL;
  fclose(check_file); check_file=NULL;

  @<Take appropriate action depending on the comparison@>@;
} else
  rename(check_file_name,tex_file_name); /* This was the first run */

strcpy(check_file_name,""); /* We want to get rid of the temporary file */
}

@ We hope that this runs fast on most systems.

@<Compare the temporary output to the previous output@>=
do {
  char x[BUFSIZ],y[BUFSIZ];
  int x_size = fread(x,sizeof(char),BUFSIZ,tex_file);
  int y_size = fread(y,sizeof(char),BUFSIZ,check_file);
  comparison = (x_size == y_size) && !memcmp(x,y,x_size);
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
