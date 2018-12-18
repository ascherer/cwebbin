Changes for CTANGLE.W by Andreas Scherer, May 9, 1995.

This set of changes provides dynamic memory allocation for the internal
fields of the CWEB system.  There is no external memory configuration file
as for TeX (yet), but there's already the advantage that the CWEB programs
can be compiled in the `NEAR' data section and be made `resident'.

This change file requires CTANG-PATCH.CH, CTANG-ANSI.CH,
CTANG-EXTENSIONS.CH to be applied as well.

For a complete history of the changes made to CTANGLE.W see CTANG-PATCH.CH.

@x l.95
  @<Set initial values@>;
  common_init();
@y
  common_init();
  @<Set initial values@>;
@z

@x l.157
text text_info[max_texts];
text_pointer text_info_end=text_info+max_texts-1;
@y
text_pointer text_info;
text_pointer text_info_end;
@z

@x l.160
eight_bits tok_mem[max_toks];
eight_bits *tok_mem_end=tok_mem+max_toks-1;
@y
eight_bits *tok_mem;
eight_bits *tok_mem_end;
@z

@x l.165
text_info->tok_start=tok_ptr=tok_mem;
@y
alloc_object(section_text,longest_name+1,char);
section_text_end = section_text + longest_name;
alloc_object(text_info,max_texts,text);
text_info_end = text_info + max_texts - 1;
alloc_object(tok_mem,max_toks,eight_bits);
tok_mem_end = tok_mem + max_toks - 1;
text_info->tok_start=tok_ptr=tok_mem;
alloc_object(stack,stack_size+1,output_state);
stack_end = stack + stack_size;
@z

@x l.312
output_state stack[stack_size+1]; /* info for non-current levels */
stack_pointer stack_ptr; /* first unused location in the output state stack */
stack_pointer stack_end=stack+stack_size; /* end of |stack| */
@y
stack_pointer stack; /* info for non-current levels */
stack_pointer stack_end; /* end of |stack| */
stack_pointer stack_ptr; /* first unused location in the output state stack */
@z

@x l.500
name_pointer output_files[max_files];
name_pointer *cur_out_file, *end_output_files, *an_output_file;
char cur_section_name_char; /* is it |'<'| or |'('| */
char output_file_name[longest_name]; /* name of the file */

@ We make |end_output_files| point just beyond the end of
|output_files|. The stack pointer
|cur_out_file| starts out there. Every time we see a new file, we
decrement |cur_out_file| and then write it in.
@<Set initial...@>=
cur_out_file=end_output_files=output_files+max_files;
@y
name_pointer *output_files;
name_pointer *cur_out_file, *end_output_files, *an_output_file;
char cur_section_name_char; /* is it |'<'| or |'('| */
char *output_file_name; /* name of the file */

@ We make |end_output_files| point just beyond the end of
|output_files|. The stack pointer
|cur_out_file| starts out there. Every time we see a new file, we
decrement |cur_out_file| and then write it in.

@<Set initial...@>=
alloc_object(output_files,max_files,name_pointer);
alloc_object(output_file_name,longest_name,char);
cur_out_file=end_output_files=output_files+max_files;
@z

@x l.707
char translit[128][translit_length];

@ @<Set init...@>=
{
  int i;
  for (i=0;i<128;i++) sprintf(translit[i],"X%02X",(unsigned)(128+i));
}
@y
char **translit;

@ @<Set init...@>=
{
  int i;
  alloc_object(translit,128,char *);
  for(i=0; i<128; i++)
    alloc_object(translit[i],translit_length,char);
  for (i=0;i<128;i++)
    sprintf(translit[i],"X%02X",(unsigned)(128+i));
}
@z

@x l.783
eight_bits ccode[256]; /* meaning of a char following \.{@@} */

@ @<Set ini...@>= {
  int c; /* must be |int| so the |for| loop will end */
@y
eight_bits *ccode; /* meaning of a char following \.{@@} */

@ @<Set ini...@>= {
  int c; /* must be |int| so the |for| loop will end */
  alloc_object(ccode,256,eight_bits);
@z

@x l.1546
@** Index.
@y
@* Version information.  The {\mc AMIGA} operating system provides the
`\.{version}' command and good programs answer with some informations about
their creation date and their current version.  This might be useful for
other operating systems as well.

@<Glob...@>=
const char Version[] = "$VER: CTangle 3.64 [CWEBbin 2018] ("@|
  __DATE__@= @>", "@= @>__TIME__@= @>")\n";

@** Index.
@z
