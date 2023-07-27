Limbo.

@x
\def\title{Common code for CTANGLE and CWEAVE (Version 4.9 [CWEBbin 2023])}
@y
\def\title{COMMON (Version 4.9 [CWEBbin 2023])}
\def\contentspagenumber{0}
@z

Section 4.

@x
internationalization.
@y
internationalization.
@-a@>
@-s@>
@-HAVE_GETTEXT@>
@z

Section 5.

@x
@ Code related to the character set:
@y
@ Code related to the character set:
@-c@>
@z

Section 6.

@x
@ Code related to input routines:
@y
@ Code related to input routines:
@-c@>
@z

Section 10.

@x
@ Code related to identifier and section name storage:
@y
@ Code related to identifier and section name storage:
@-c@>
@z

Section 11.

@x
extern void init_node(name_pointer);@/
@y
extern void init_node(name_pointer);@/
@-init_node@>
@-names_match@>
@$init_node {CWEAVE.W}32 \&{void} (\,)@>
@$names_match {CWEAVE.W}32 \&{boolean} (\,)@>
@z

Section 15.

@x
@ Code related to output:
@y
@ Code related to output:
@-a@>
@-b@>
@z

Section 32.

@x
current line is nonempty.
@y
current line is nonempty.
@-b@>
@z

Section 48.

@x
id_lookup( /* looks up a string in the identifier table */
@y
id_lookup( /* looks up a string in the identifier table */
@-h@>
@-id_lookup@>
@$id_lookup {COMMON}48 \&{name\_pointer} (\,)@>
@z

Section 52.

@x
@d first_chunk(p) ((p)->byte_start+2)
@y
@-m@>
@d first_chunk(p) ((p)->byte_start+2)
@z

Section 56.

@x
static int web_strcmp( /* fuller comparison than |strcmp| */
@y
static int web_strcmp( /* fuller comparison than |strcmp| */
@-web_strcmp@>
@$web_strcmp {COMMON}56 \&{static} \&{int} ${}(\,){}$@>
@z

Section 57.

@x
add_section_name( /* install a new node in the tree */
@y
add_section_name( /* install a new node in the tree */
@-add_section_name@>
@$add_section_name {COMMON}57 \&{static} \&{name\_pointer} ${}(\,){}$@>
@z

Section 59.

@x
section_lookup( /* find or install section name in tree */
@y
section_lookup( /* find or install section name in tree */
@-section_lookup@>
@$section_lookup {COMMON}59 \&{name\_pointer} (\,)@>
@z

Section 66.

@x
err_print( /* prints `\..' and location of error message */
@y
err_print( /* prints `\..' and location of error message */
@-err_print@>
@$err_print {COMMON}66 \&{void} (\,)@>
@z

Section 75.

@x
systems the contents of the compile-time variable |DEV_NULL| (\TeX~Live) or
@y
systems the contents of the compile-time variable |DEV_NULL| (\TeX~Live) or
@-DEV_NULL@>
@-_DEV_NULL@>
@z

Section 87.

@x
for include files along the path |CWEBINPUTS|.  By setting the environment
@y
for include files along the path |CWEBINPUTS|.  By setting the environment
@-CWEBINPUTS@>
@z

Section 88.

@x
@ @c
@y
@ @-CWEBINPUTS@>@c
@z

Section 89.

@x
needs a few extra variables.
@y
needs a few extra variables.
@-SEPARATORS@>
@z

Section 91.

@x
@.cweb.mo@>
@y
@.cweb.mo@>
@-A@>
@-B@>
@z

Section 93.

@x
#if HAVE_GETTEXT
@y
#if HAVE_GETTEXT
@-HAVE_GETTEXT@>
@-a@>
@-b@>
@z

@x
@** Index.
@y
@z
