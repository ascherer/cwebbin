@x l.104 - add src_locs
  make_xrefs=force_lines=make_pb=1; /* controlled by command-line options */
@y
  make_xrefs=force_lines=make_pb=1; /* controlled by command-line options */
  src_locs=0; /* also controlled by a command-line option */
@z
 
Section 80.

@x l.1370
tex_printf("cwebma");
@y
tex_printf("cwebma");
if (src_locs) {
  *out_ptr='e'; tex_printf("c\n\\srcloctru");
}
@z
 
Section 208

@x l.3997
@ Sections beginning with the \.{CWEB} control sequence `\.{@@\ }' start in the
output with the \TEX/ control sequence `\.{\\M}', followed by the section
number. Similarly, `\.{@@*}' sections lead to the control sequence `\.{\\N}'.
In this case there's an additional parameter, representing one plus the
specified depth, immediately after the \.{\\N}.
If the section has changed, we put \.{\\*} just after the section number.
@y
@ Sections beginning with the \.{CWEB} control sequence `\.{@@\ }' start in the
output with the \TEX/ control sequence `\.{\\M}', followed by the section
number. Similarly, `\.{@@*}' sections lead to the control sequence `\.{\\N}'.
In this case there's an additional parameter, representing one plus the
specified depth, immediately after the \.{\\N}.
If the section has changed, we put \.{\\*} just after the section number.
(The \TEX/ control sequences that start sections will interpret any initial
text that's surrounded with square brackets as instruction to
emit a source special, supported by some DVI previewers.)
@d src_locs flags['r'] /* whether source specials be output */
@d out_src_loc() if (src_locs) { char s[20+1+max_file_name_length];
  sprintf(s,"[%d %s]",cur_line,basename(cur_file_name));out_str(s); }
@z

@x l.4005
if (*(loc-1)!='*') out_str("\\M");
@.\\M@>
else {
@y
if (*(loc-1)!='*') {
  out_str("\\M");
  out_src_loc();
@.\\M@>
} else {
@z

@x l.4019
  out_str("\\N");
@y
  out_str("\\N");
  out_src_loc();
@z

@x l.4025
out_str("{");out_section(section_count); out_str("}");
@y
out_str("{");out_section(section_count); out_str("}");

@ @<Include...@>=
#include <libgen.h> /* definition of basename */
@z
