Changes for CWEAVE.W by Andreas Scherer, May 13, 1995.

This set of changes provides dynamic memory allocation for the internal
fields of the CWEB system.  There is no external memory configuration file
as for TeX (yet), but there's already the advantage that the CWEB programs
can be compiled in the `NEAR' data section and be made `resident'.

This change file requires CWEAV-PATCH.CH, CWEAV-ANSI.CH,
CWEAV-EXTENSIONS.CH to be applied as well.

For a complete history of the changes made to CWEAVE.W see CWEAV-PATCH.CH.

@x l.230
xref_info xmem[max_refs]; /* contains cross-reference information */
xref_pointer xmem_end = xmem+max_refs-1;
@y
xref_pointer xmem; /* contains cross-reference information */
xref_pointer xmem_end;
@z

@x l.244
xref_ptr=xmem; name_dir->xref=(void *)xmem;
xref_switch=0; section_xref_switch=0;
@y
alloc_object(section_text,longest_name+1,char);
section_text_end = section_text + longest_name;
alloc_object(xmem,max_refs,xref_info);
xmem_end = xmem + max_refs - 1;
xref_ptr=xmem; name_dir->xref=(void *)xmem;
xref_switch=0; section_xref_switch=0;
@z

@x l.343
token tok_mem[max_toks]; /* tokens */
token_pointer tok_mem_end = tok_mem+max_toks-1; /* end of |tok_mem| */
token_pointer tok_start[max_texts]; /* directory into |tok_mem| */
token_pointer tok_ptr; /* first unused position in |tok_mem| */
text_pointer text_ptr; /* first unused position in |tok_start| */
text_pointer tok_start_end = tok_start+max_texts-1; /* end of |tok_start| */
@y
token_pointer tok_mem; /* tokens */
token_pointer tok_mem_end; /* end of |tok_mem| */
token_pointer tok_ptr; /* first unused position in |tok_mem| */
text_pointer tok_start; /* directory into |tok_mem| */
text_pointer tok_start_end; /* end of |tok_start| */
text_pointer text_ptr; /* first unused position in |tok_start| */
@z

@x l.353
tok_ptr=tok_mem+1; text_ptr=tok_start+1; tok_start[0]=tok_mem+1;
@y
alloc_object(tok_mem,max_toks,token);
tok_mem_end = tok_mem + max_toks - 1;
alloc_object(tok_start,max_texts,token_pointer);
tok_start_end = tok_start + max_texts - 1;
tok_ptr=tok_mem+1; text_ptr=tok_start+1; tok_start[0]=tok_mem+1;
@z

@x l.522
eight_bits ccode[256]; /* meaning of a char following \.{@@} */

@ @<Set ini...@>=
{int c; for (c=0; c<256; c++) ccode[c]=0;}
@y
eight_bits *ccode; /* meaning of a char following \.{@@} */

@ @<Set ini...@>=
{int c;
alloc_object(ccode,256,eight_bits);
for (c=0; c<256; c++) ccode[c]=0;}
@z

@x l.1261
char out_buf[line_length+1]; /* assembled characters */
char *out_ptr; /* just after last character in |out_buf| */
char *out_buf_end = out_buf+line_length; /* end of |out_buf| */
@y
char *out_buf; /* assembled characters */
char *out_buf_end; /* end of |out_buf| */
char *out_ptr; /* just after last character in |out_buf| */
@z

@x l.1330
out_ptr=out_buf+1; out_line=1; active_file=tex_file; *out_ptr='c';
@y
alloc_object(out_buf,line_length+1,char);
out_buf_end = out_buf + line_length;
out_ptr=out_buf+1; out_line=1; active_file=tex_file; *out_ptr='c';
@z

@x l.1670
char cat_name[256][12];
eight_bits cat_index;

@ @<Set in...@>=
@y
char **cat_name;
eight_bits cat_index;

@ @<Set in...@>=
alloc_object(cat_name,256,char *);
for(cat_index=0; cat_index<255; cat_index++)
  alloc_object(cat_name[cat_index],12,char);
@z

@x l.2025
scrap scrap_info[max_scraps]; /* memory array for scraps */
scrap_pointer scrap_info_end=scrap_info+max_scraps -1; /* end of |scrap_info| */
@y
scrap_pointer scrap_info; /* memory array for scraps */
scrap_pointer scrap_info_end; /* end of |scrap_info| */
@z

@x l.2035
scrap_base=scrap_info+1;
max_scr_ptr=scrap_ptr=scrap_info;
@y
alloc_object(scrap_info,max_scraps,scrap);
scrap_info_end = scrap_info + max_scraps - 1;
scrap_base=scrap_info+1;
max_scr_ptr=scrap_ptr=scrap_info;
@z

@x l.3426
output_state stack[stack_size]; /* info for non-current levels */
stack_pointer stack_ptr; /* first unused location in the output state stack */
stack_pointer stack_end=stack+stack_size-1; /* end of |stack| */
@y
stack_pointer stack; /* info for non-current levels */
stack_pointer stack_end; /* end of |stack| */
stack_pointer stack_ptr; /* first unused location in the output state stack */
@z

@x l.3432
max_stack_ptr=stack;
@y
alloc_object(stack,stack_size,output_state);
stack_end = stack + stack_size - 1;
max_stack_ptr=stack;
@z

@x l.4224
name_pointer bucket[256];
name_pointer next_name; /* successor of |cur_name| when sorting */
name_pointer blink[max_names]; /* links in the buckets */
@y
name_pointer *bucket;
name_pointer next_name; /* successor of |cur_name| when sorting */
name_pointer *blink; /* links in the buckets */
@z

@x l.4273
max_sort_ptr=scrap_info;
@y
alloc_object(bucket,256,name_pointer);
alloc_object(blink,max_names,name_pointer);
max_sort_ptr=scrap_info;
@z

@x l.4279
eight_bits collate[102+128]; /* collation order */
@y
eight_bits *collate; /* collation order */
@z

@x l.4292
collate[0]=0;
@y
alloc_object(collate,102+128,eight_bits);
collate[0]=0;
@z
