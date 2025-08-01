/*1:*/
#line 66 "ctangle.w"

/*5:*/
#line 53 "comm-foo.h"

#include <ctype.h>  
#include <stdbool.h>  
#include <stddef.h>  
#include <stdint.h>  
#include <stdio.h>  
#include <stdlib.h>  
#include <string.h>  

#ifndef HAVE_GETTEXT
#define HAVE_GETTEXT 0
#endif
#line 65 "comm-foo.h"

#if HAVE_GETTEXT
#include <libintl.h> 
#else
#line 69 "comm-foo.h"
#define gettext(a) a
#endif
#line 71 "comm-foo.h"

/*:5*/
#line 67 "ctangle.w"

#define banner _("This is CTANGLE (Version 4.12.2 [CWEBbin 2025.1])")
#define _(s) gettext(s)
#define and_and 04
#define lt_lt 020
#define gt_gt 021
#define plus_plus 013
#define minus_minus 01
#define minus_gt 031
#define non_eq 032
#define lt_eq 034
#define gt_eq 035
#define eq_eq 036
#define or_or 037
#define dot_dot_dot 016
#define colon_colon 06
#define period_ast 026
#define minus_gt_ast 027
#define compress(c) if(loc++<=limit) return c
#define xisalpha(c) (isalpha((int) (c) ) &&!ishigh(c) )
#define xisdigit(c) (isdigit((int) (c) ) &&!ishigh(c) )
#define xisspace(c) (isspace((int) (c) ) &&!ishigh(c) )
#define xislower(c) (islower((int) (c) ) &&!ishigh(c) )
#define xisupper(c) (isupper((int) (c) ) &&!ishigh(c) )
#define xisxdigit(c) (isxdigit((int) (c) ) &&!ishigh(c) )
#define isxalpha(c) ((c) =='_'||(c) =='$')
#define ishigh(c) ((eight_bits) (c) > 0177)
#define max_include_depth 10
#define max_file_name_length 60
#define cur_file file[include_depth]
#define cur_file_name file_name[include_depth]
#define cur_line line[include_depth]
#define web_file file[0]
#define web_file_name file_name[0]
#define length(c) (size_t) ((c+1) ->byte_start-(c) ->byte_start)
#define print_id(c) term_write((c) ->byte_start,length(c) )
#define llink link
#define rlink dummy.Rlink
#define root name_dir->rlink
#define ilk dummy.Ilk
#define spotless 0
#define harmless_message 1
#define error_message 2
#define fatal_message 3
#define mark_harmless() if(history==spotless) history= harmless_message
#define mark_error() history= error_message
#define confusion(s) fatal(_("! This can't happen: ") ,s)
#define show_banner flags['b']
#define show_progress flags['p']
#define show_happiness flags['h']
#define show_stats flags['s']
#define make_xrefs flags['x']
#define check_for_change flags['c']
#define update_terminal() fflush(stdout)
#define new_line() putchar('\n')
#define term_write(a,b) fflush(stdout) ,fwrite(a,sizeof(char) ,b,stdout)
#define buf_size 200
#define longest_name 10000
#define long_buf_size (buf_size+longest_name)
#define max_bytes 100000
#define max_names 5000
#define max_sections 2000
#define max_texts 4000
#define max_toks 270000
#define equiv equiv_or_xref
#define macro 0
#define section_flag max_texts
#define string 02
#define constant 03
#define join 0177
#define output_defs_flag (2*024000-1)
#define stack_size 50
#define cur_state stack[stack_size+1]
#define cur_byte cur_state.byte_field
#define cur_name cur_state.name_field
#define cur_repl cur_state.repl_field
#define cur_section cur_state.section_field
#define cur_end (cur_repl+1) ->tok_start
#define section_number 0201
#define identifier 0202
#define normal 0
#define num_or_id 1
#define post_slash 2
#define unbreakable 3
#define verbatim 4
#define max_files 256
#define C_printf(c,a) fprintf(C_file,c,a)
#define C_putc(c) fputc((int) (c) ,C_file)
#define translit_length 10
#define transliterate_utf_eight flags['u']
#define ignore 00
#define ord 0302
#define control_text 0303
#define translit_code 0304
#define output_defs_code 0305
#define format_code 0306
#define definition 0307
#define begin_C 0310
#define section_name 0311
#define new_section 0312
#define app_repl(c) { \
if(tok_ptr==tok_mem_end) overflow(_("token") ) ; \
else*(tok_ptr++) = (eight_bits) c; \
}
#define store_id(a) a= id_lookup(id_first,id_loc,'\0') -name_dir; \
app_repl((a/0400) +0200) ; \
app_repl(a%0400)
#define keep_digit_separators flags['k']

#line 68 "ctangle.w"

/*3:*/
#line 32 "comm-foo.h"

typedef uint8_t eight_bits;
typedef uint16_t sixteen_bits;
typedef enum{
ctangle,cweave,ctwill
}cweb;
extern cweb program;
extern int phase;

/*:3*//*6:*/
#line 108 "comm-foo.h"

extern char section_text[];
extern char*section_text_end;
extern char*id_first;
extern char*id_loc;

/*:6*//*7:*/
#line 126 "comm-foo.h"

extern char buffer[];
extern char*buffer_end;
extern char*loc;
extern char*limit;

/*:7*//*8:*/
#line 143 "comm-foo.h"

extern int include_depth;
extern FILE*file[];
extern FILE*change_file;
extern char file_name[][max_file_name_length];

extern char change_file_name[];
extern int line[];
extern int change_line;
extern int change_depth;
extern bool input_has_ended;
extern bool changing;
extern bool web_file_open;

/*:8*//*10:*/
#line 163 "comm-foo.h"

extern sixteen_bits section_count;
extern bool changed_section[];
extern bool change_pending;
extern bool print_where;

/*:10*//*11:*/
#line 178 "comm-foo.h"

typedef struct name_info{
char*byte_start;
struct name_info*link;
union{
struct name_info*Rlink;

eight_bits Ilk;
}dummy;
void*equiv_or_xref;
}name_info;
typedef name_info*name_pointer;
typedef name_pointer*hash_pointer;
extern char byte_mem[];
extern char*byte_mem_end;
extern char*byte_ptr;
extern name_info name_dir[];
extern name_pointer name_dir_end;
extern name_pointer name_ptr;
extern name_pointer hash[];
extern hash_pointer hash_end;
extern hash_pointer hash_ptr;

/*:11*//*13:*/
#line 223 "comm-foo.h"

extern int history;

/*:13*//*15:*/
#line 242 "comm-foo.h"

extern int argc;
extern char**argv;
extern char C_file_name[];
extern char tex_file_name[];
extern char idx_file_name[];
extern char scn_file_name[];
extern char check_file_name[];
extern bool flags[];
extern const char*use_language;

/*:15*//*16:*/
#line 258 "comm-foo.h"

extern FILE*C_file;
extern FILE*tex_file;
extern FILE*idx_file;
extern FILE*scn_file;
extern FILE*active_file;
extern FILE*check_file;

/*:16*/
#line 69 "ctangle.w"

/*19:*/
#line 122 "ctangle.w"

typedef struct{
eight_bits*tok_start;
sixteen_bits text_link;
}text;
typedef text*text_pointer;

/*:19*//*31:*/
#line 267 "ctangle.w"

typedef struct{
eight_bits*byte_field;
name_pointer name_field;
text_pointer repl_field;
sixteen_bits section_field;
}output_state;
typedef output_state*stack_pointer;

/*:31*/
#line 70 "ctangle.w"

/*20:*/
#line 131 "ctangle.w"

static text text_info[max_texts];
static text_pointer text_info_end= text_info+max_texts-1;
static text_pointer text_ptr;
static eight_bits tok_mem[max_toks];
static eight_bits*tok_mem_end= tok_mem+max_toks-1;
static eight_bits*tok_ptr;

/*:20*//*26:*/
#line 196 "ctangle.w"

static text_pointer last_unnamed;

/*:26*//*32:*/
#line 285 "ctangle.w"

static output_state stack[stack_size+2];
static stack_pointer stack_end= stack+stack_size;
static stack_pointer stack_ptr;

/*:32*//*38:*/
#line 367 "ctangle.w"

static int cur_val;

/*:38*//*42:*/
#line 457 "ctangle.w"

static eight_bits out_state;
static bool protect;

/*:42*//*45:*/
#line 488 "ctangle.w"

static name_pointer output_files[max_files];
static name_pointer*cur_out_file,*end_output_files,*an_output_file;
static char cur_section_name_char;
static char output_file_name[longest_name+1];

/*:45*//*53:*/
#line 584 "ctangle.w"

static bool output_defs_seen= false;

/*:53*//*57:*/
#line 694 "ctangle.w"

static char translit[0200][translit_length];

/*:57*//*62:*/
#line 770 "ctangle.w"

static eight_bits ccode[256]= {ignore};

/*:62*//*66:*/
#line 827 "ctangle.w"

static bool comment_continues= false;

/*:66*//*68:*/
#line 864 "ctangle.w"

static name_pointer cur_section_name;
static bool no_where;

/*:68*//*82:*/
#line 1182 "ctangle.w"

static text_pointer cur_text;
static eight_bits next_control;

/*:82*/
#line 71 "ctangle.w"

/*4:*/
#line 42 "comm-foo.h"

extern void common_init(void);

/*:4*//*9:*/
#line 157 "comm-foo.h"

extern bool get_line(void);
extern void check_complete(void);
extern void reset_input(void);

/*:9*//*12:*/
#line 201 "comm-foo.h"

extern name_pointer id_lookup(const char*,const char*,eight_bits);

extern name_pointer section_lookup(char*,char*,bool);
extern void print_prefix_name(name_pointer);
extern void print_section_name(name_pointer);
extern void sprint_section_name(char*,name_pointer);

extern bool names_match(name_pointer,const char*,size_t,eight_bits);

extern void init_node(name_pointer);

/*:12*//*14:*/
#line 226 "comm-foo.h"

extern int wrap_up(void);
extern void err_print(const char*);
extern void fatal(const char*,const char*);
extern void overflow(const char*);

extern void print_stats(void);

/*:14*//*30:*/
#line 242 "ctangle.w"
static void store_two_bytes(sixteen_bits);

/*:30*//*37:*/
#line 347 "ctangle.w"

static void push_level(name_pointer);
static void pop_level(bool);
static void get_output(void);

/*:37*//*44:*/
#line 478 "ctangle.w"
static void flush_buffer(void);

/*:44*//*49:*/
#line 547 "ctangle.w"

static void phase_two(void);
static void output_defs(void);
static void out_char(eight_bits);

/*:49*//*65:*/
#line 807 "ctangle.w"

static eight_bits skip_ahead(void);
static bool skip_comment(bool);

/*:65*//*70:*/
#line 915 "ctangle.w"
static eight_bits get_next(void);

/*:70*//*84:*/
#line 1208 "ctangle.w"
static void scan_repl(eight_bits);

/*:84*//*91:*/
#line 1399 "ctangle.w"
static void scan_section(void);

/*:91*//*99:*/
#line 1476 "ctangle.w"
static void phase_one(void);

/*:99*//*101:*/
#line 1509 "ctangle.w"
static void skip_limbo(void);

/*:101*/
#line 72 "ctangle.w"


/*:1*//*2:*/
#line 81 "ctangle.w"

int main(
int ac,
char**av)
{
argc= ac;argv= av;
program= ctangle;
/*21:*/
#line 139 "ctangle.w"

text_info->tok_start= tok_ptr= tok_mem;
text_ptr= text_info+1;text_ptr->tok_start= tok_mem;


/*:21*//*23:*/
#line 149 "ctangle.w"

init_node(name_dir);

/*:23*//*27:*/
#line 199 "ctangle.w"
last_unnamed= text_info;text_info->text_link= macro;

/*:27*//*46:*/
#line 498 "ctangle.w"

cur_out_file= end_output_files= output_files+max_files;

/*:46*//*58:*/
#line 697 "ctangle.w"

{int i;
for(i= 0;i<0200;i++)
snprintf(translit[i],translit_length,"X%02X",(unsigned int)(0200+i));
}

#line 121 "ctang-foo.ch"
/*:58*//*63:*/
#line 773 "ctangle.w"

ccode[' ']= ccode['\t']= ccode['\n']= ccode['\v']= ccode['\r']= ccode['\f']
= ccode['*']= new_section;
ccode['@']= (eight_bits)'@';ccode['=']= string;
ccode['d']= ccode['D']= definition;
ccode['f']= ccode['F']= ccode['s']= ccode['S']= format_code;
ccode['c']= ccode['C']= ccode['p']= ccode['P']= begin_C;
ccode['^']= ccode[':']= ccode['.']= ccode['t']= ccode['T']= 
ccode['q']= ccode['Q']= control_text;
ccode['h']= ccode['H']= output_defs_code;
ccode['l']= ccode['L']= translit_code;
ccode['&']= join;
ccode['<']= ccode['(']= section_name;
ccode['\'']= ord;

/*:63*//*78:*/
#line 1103 "ctangle.w"
section_text[0]= ' ';

/*:78*/
#line 88 "ctangle.w"

common_init();
if(show_banner)puts(banner);
phase_one();
phase_two();
return wrap_up();
}

/*:2*//*24:*/
#line 155 "ctangle.w"

bool names_match(
name_pointer p,
const char*first,
size_t l,
eight_bits t)
{(void)t;
return length(p)==l&&strncmp(first,p->byte_start,l)==0;
}

/*:24*//*25:*/
#line 168 "ctangle.w"

void
init_node(
name_pointer node)
{
node->equiv= (void*)text_info;
}

/*:25*//*29:*/
#line 232 "ctangle.w"

static void
store_two_bytes(
sixteen_bits x)
{
#line 28 "ctang-foo.ch"
if(tok_ptr+2> tok_mem_end)overflow(_("token"));
#line 238 "ctangle.w"
*tok_ptr++= x>>8;
*tok_ptr++= x&0377;
}

/*:29*//*35:*/
#line 315 "ctangle.w"

static void
push_level(
name_pointer p)
{
#line 34 "ctang-foo.ch"
if(stack_ptr==stack_end)overflow(_("stack"));
#line 321 "ctangle.w"
*stack_ptr= cur_state;
stack_ptr++;
if(p!=NULL){
cur_name= p;cur_repl= (text_pointer)p->equiv;
cur_byte= cur_repl->tok_start;cur_section= 0;
}
}


/*:35*//*36:*/
#line 334 "ctangle.w"

static void
pop_level(
bool flag)
{
if(flag&&cur_repl->text_link<section_flag){
cur_repl= cur_repl->text_link+text_info;
cur_byte= cur_repl->tok_start;return;
}
stack_ptr--;
if(stack_ptr> stack)cur_state= *stack_ptr;
}

/*:36*//*39:*/
#line 374 "ctangle.w"

static void
get_output(void)
{
sixteen_bits a;
restart:if(stack_ptr==stack)return;
if(cur_byte==cur_end){
cur_val= -((int)cur_section);
pop_level(true);
if(cur_val==0)goto restart;
out_char(section_number);return;
}
a= *cur_byte++;
if(out_state==verbatim&&a!=string&&a!=constant&&a!='\n')
C_putc(a);
else if(a<0200)out_char(a);
else{
a= (a-0200)*0400+*cur_byte++;
switch(a/024000){
case 0:cur_val= (int)a;out_char(identifier);break;
case 1:if(a==output_defs_flag)output_defs();
else/*40:*/
#line 407 "ctangle.w"

{
a-= 024000;
if((a+name_dir)->equiv!=(void*)text_info)push_level(a+name_dir);
else if(a!=0){
#line 40 "ctang-foo.ch"
printf("%s",_("\n! Not present: <"));
#line 413 "ctangle.w"
print_section_name(a+name_dir);err_print(">");

}
goto restart;
}

/*:40*/
#line 395 "ctangle.w"

break;
default:cur_val= (int)a-050000;
if(cur_val> 0)cur_section= (sixteen_bits)cur_val;
out_char(section_number);
}
}
}

/*:39*//*43:*/
#line 465 "ctangle.w"

static void
flush_buffer(void)
{
C_putc('\n');
if(cur_line%100==0&&show_progress){
putchar('.');
if(cur_line%500==0)printf("%d",cur_line);
update_terminal();
}
cur_line++;
}

/*:43*//*48:*/
#line 517 "ctangle.w"

static void
phase_two(void){
phase= 2;
web_file_open= false;
cur_line= 1;
/*33:*/
#line 296 "ctangle.w"

stack_ptr= stack+1;cur_name= name_dir;
cur_repl= text_info->text_link+text_info;
cur_byte= cur_repl->tok_start;cur_section= 0;

/*:33*/
#line 523 "ctangle.w"

/*52:*/
#line 580 "ctangle.w"

if(!output_defs_seen)
output_defs();

/*:52*/
#line 524 "ctangle.w"

if(text_info->text_link==macro&&cur_out_file==end_output_files){
#line 52 "ctang-foo.ch"
printf("%s",_("\n! No program text was specified."));mark_harmless();
#line 527 "ctangle.w"

}
else{
if(show_progress){
printf(cur_out_file==end_output_files?
#line 59 "ctang-foo.ch"
_("\nWriting the output file (%s):"):
_("\nWriting the output files: (%s)"),C_file_name);
#line 534 "ctangle.w"

update_terminal();
}
if(text_info->text_link!=macro)
/*51:*/
#line 570 "ctangle.w"

{
while(stack_ptr> stack)get_output();
flush_buffer();
}

/*:51*/
#line 538 "ctangle.w"

/*50:*/
#line 84 "ctang-foo.ch"

if(check_for_change){
fclose(C_file);C_file= NULL;
/*106:*/
#line 377 "ctang-foo.ch"

if((C_file= fopen(C_file_name,"r"))!=NULL){
/*107:*/
#line 384 "ctang-foo.ch"

bool comparison= false;

if((check_file= fopen(check_file_name,"r"))==NULL)
fatal(_("! Cannot open output file "),check_file_name);


/*108:*/
#line 398 "ctang-foo.ch"

do{
char x[BUFSIZ],y[BUFSIZ];
int x_size= fread(x,sizeof(char),BUFSIZ,C_file);
int y_size= fread(y,sizeof(char),BUFSIZ,check_file);
comparison= (x_size==y_size)&&!memcmp(x,y,x_size);
}while(comparison&&!feof(C_file)&&!feof(check_file));

/*:108*/
#line 391 "ctang-foo.ch"


fclose(C_file);C_file= NULL;
fclose(check_file);check_file= NULL;

/*:107*/
#line 379 "ctang-foo.ch"

/*109:*/
#line 409 "ctang-foo.ch"

if(comparison)
remove(check_file_name);
else{
remove(C_file_name);
rename(check_file_name,C_file_name);
}

/*:109*/
#line 380 "ctang-foo.ch"

}else
rename(check_file_name,C_file_name);

/*:106*/
#line 87 "ctang-foo.ch"

}
for(an_output_file= end_output_files;an_output_file> cur_out_file;){
an_output_file--;
sprint_section_name(output_file_name,*an_output_file);
if(check_for_change)/*105:*/
#line 368 "ctang-foo.ch"
{
if((C_file= fopen(output_file_name,"a"))==NULL)
fatal(_("! Cannot open output file "),output_file_name);

else fclose(C_file);
if((C_file= fopen(check_file_name,"wb"))==NULL)
fatal(_("! Cannot open output file "),check_file_name);
}

/*:105*/
#line 92 "ctang-foo.ch"

else{
fclose(C_file);
if((C_file= fopen(output_file_name,"wb"))==NULL)
fatal(_("! Cannot open output file "),output_file_name);

}
if(show_progress){printf("\n(%s)",output_file_name);update_terminal();}
cur_line= 1;
/*34:*/
#line 303 "ctangle.w"

stack_ptr= stack+1;cur_name= *an_output_file;
cur_repl= (text_pointer)cur_name->equiv;
cur_byte= cur_repl->tok_start;

/*:34*/
#line 101 "ctang-foo.ch"

/*51:*/
#line 570 "ctangle.w"

{
while(stack_ptr> stack)get_output();
flush_buffer();
}

/*:51*/
#line 102 "ctang-foo.ch"

if(check_for_change){
fclose(C_file);C_file= NULL;
/*110:*/
#line 422 "ctang-foo.ch"

if(0==strcmp("/dev/stdout",output_file_name))
/*112:*/
#line 449 "ctang-foo.ch"
{
/*115:*/
#line 480 "ctang-foo.ch"

char in_buf[BUFSIZ+1];
int in_size;
bool comparison= true;
if((check_file= fopen(check_file_name,"r"))==NULL)
fatal(_("! Cannot open output file "),check_file_name);


/*:115*/
#line 450 "ctang-foo.ch"

do{
in_size= fread(in_buf,sizeof(char),BUFSIZ,check_file);
in_buf[in_size]= '\0';
fprintf(stdout,"%s",in_buf);
}while(!feof(check_file));
fclose(check_file);check_file= NULL;
/*111:*/
#line 439 "ctang-foo.ch"

if(comparison)
remove(check_file_name);
else{
remove(output_file_name);
rename(check_file_name,output_file_name);
}

/*:111*/
#line 457 "ctang-foo.ch"

}

/*:112*/
#line 424 "ctang-foo.ch"

else if(0==strcmp("/dev/stderr",output_file_name))
/*113:*/
#line 462 "ctang-foo.ch"
{
/*115:*/
#line 480 "ctang-foo.ch"

char in_buf[BUFSIZ+1];
int in_size;
bool comparison= true;
if((check_file= fopen(check_file_name,"r"))==NULL)
fatal(_("! Cannot open output file "),check_file_name);


/*:115*/
#line 463 "ctang-foo.ch"

do{
in_size= fread(in_buf,sizeof(char),BUFSIZ,check_file);
in_buf[in_size]= '\0';
fprintf(stderr,"%s",in_buf);
}while(!feof(check_file));
fclose(check_file);check_file= NULL;
/*111:*/
#line 439 "ctang-foo.ch"

if(comparison)
remove(check_file_name);
else{
remove(output_file_name);
rename(check_file_name,output_file_name);
}

/*:111*/
#line 470 "ctang-foo.ch"

}

/*:113*/
#line 426 "ctang-foo.ch"

else if(0==strcmp("/dev/null",output_file_name))
/*114:*/
#line 475 "ctang-foo.ch"
{
bool comparison= true;
/*111:*/
#line 439 "ctang-foo.ch"

if(comparison)
remove(check_file_name);
else{
remove(output_file_name);
rename(check_file_name,output_file_name);
}

/*:111*/
#line 477 "ctang-foo.ch"

}

/*:114*/
#line 428 "ctang-foo.ch"

else{
if((C_file= fopen(output_file_name,"r"))!=NULL){
/*107:*/
#line 384 "ctang-foo.ch"

bool comparison= false;

if((check_file= fopen(check_file_name,"r"))==NULL)
fatal(_("! Cannot open output file "),check_file_name);


/*108:*/
#line 398 "ctang-foo.ch"

do{
char x[BUFSIZ],y[BUFSIZ];
int x_size= fread(x,sizeof(char),BUFSIZ,C_file);
int y_size= fread(y,sizeof(char),BUFSIZ,check_file);
comparison= (x_size==y_size)&&!memcmp(x,y,x_size);
}while(comparison&&!feof(C_file)&&!feof(check_file));

/*:108*/
#line 391 "ctang-foo.ch"


fclose(C_file);C_file= NULL;
fclose(check_file);check_file= NULL;

/*:107*/
#line 431 "ctang-foo.ch"

/*111:*/
#line 439 "ctang-foo.ch"

if(comparison)
remove(check_file_name);
else{
remove(output_file_name);
rename(check_file_name,output_file_name);
}

/*:111*/
#line 432 "ctang-foo.ch"

}else
rename(check_file_name,output_file_name);
}

/*:110*/
#line 105 "ctang-foo.ch"

}
}
if(check_for_change)
strcpy(check_file_name,"");
#line 569 "ctangle.w"

/*:50*/
#line 539 "ctangle.w"

if(show_happiness){
if(show_progress)new_line();
#line 66 "ctang-foo.ch"
printf("%s",_("Done."));
#line 543 "ctangle.w"
}
}
}

/*:48*//*54:*/
#line 590 "ctangle.w"

static void
output_defs(void)
{
sixteen_bits a;eight_bits*macro_end;
push_level(NULL);
for(cur_text= text_info+1;cur_text<text_ptr;cur_text++)
if(cur_text->text_link==macro){
cur_byte= cur_text->tok_start;
macro_end= (cur_text+1)->tok_start;
C_printf("%s","#define ");
out_state= normal;
protect= true;
do macro_end--;while(isspace(*macro_end)&&plus_plus!=*macro_end);

while(cur_byte<=macro_end){
a= *cur_byte++;
if(out_state==verbatim&&a!=string&&a!=constant&&a!='\n')
C_putc(a);

else if(a<0200)out_char(a);
else{
a= (a-0200)*0400+*cur_byte++;
if(a<024000){
cur_val= (int)a;out_char(identifier);
}
#line 115 "ctang-foo.ch"
else if(a<050000)confusion(_("macro defs have strange char"));
#line 617 "ctangle.w"
else{
cur_val= (int)a-050000;cur_section= (sixteen_bits)cur_val;
out_char(section_number);
}

}
}
protect= false;
flush_buffer();
}
pop_level(false);
}

/*:54*//*55:*/
#line 635 "ctangle.w"

static void
out_char(
eight_bits cur_char)
{
char*j;
restart:
switch(cur_char){
case'\n':if(protect&&out_state!=verbatim)C_putc(' ');
if(protect||out_state==verbatim)C_putc('\\');
flush_buffer();if(out_state!=verbatim)out_state= normal;break;
/*59:*/
#line 147 "ctang-foo.ch"

#line 704 "ctangle.w"
case identifier:
if(out_state==num_or_id)C_putc(' ');
for(j= (cur_val+name_dir)->byte_start;
j<(cur_val+name_dir+1)->byte_start;j++)
#line 154 "ctang-foo.ch"
if(ishigh(*j)){

if(transliterate_utf_eight){
if((eight_bits)(*j)>=0360)j+= 3;
else if((eight_bits)(*j)>=0340)j+= 2;
else if((eight_bits)(*j)>=0300)j+= 1;
}
C_printf("%s",translit[(eight_bits)(*j)-0200]);
}
#line 710 "ctangle.w"
else C_putc(*j);
out_state= num_or_id;break;

/*:59*/
#line 646 "ctangle.w"

/*60:*/
#line 713 "ctangle.w"

case section_number:
if(cur_val> 0)C_printf("/*%d:*/",cur_val);
else if(cur_val<0)C_printf("/*:%d*/",-cur_val);
else if(protect){
cur_byte+= 4;
cur_char= (eight_bits)'\n';
goto restart;
}else{
sixteen_bits a;
a= *cur_byte++*0400;
a+= *cur_byte++;
C_printf("\n#line %d \"",(int)a);

cur_val= (int)(*cur_byte++-0200)*0400;
cur_val+= *cur_byte++;
for(j= (cur_val+name_dir)->byte_start;
j<(cur_val+name_dir+1)->byte_start;j++){
if(*j=='\\'||*j=='"')C_putc('\\');
C_putc(*j);
}
C_putc('"');C_putc('\n');
}
break;

/*:60*/
#line 647 "ctangle.w"

/*56:*/
#line 665 "ctangle.w"

case plus_plus:C_putc('+');C_putc('+');out_state= normal;break;
case minus_minus:C_putc('-');C_putc('-');out_state= normal;break;
case minus_gt:C_putc('-');C_putc('>');out_state= normal;break;
case gt_gt:C_putc('>');C_putc('>');out_state= normal;break;
case eq_eq:C_putc('=');C_putc('=');out_state= normal;break;
case lt_lt:C_putc('<');C_putc('<');out_state= normal;break;
case gt_eq:C_putc('>');C_putc('=');out_state= normal;break;
case lt_eq:C_putc('<');C_putc('=');out_state= normal;break;
case non_eq:C_putc('!');C_putc('=');out_state= normal;break;
case and_and:C_putc('&');C_putc('&');out_state= normal;break;
case or_or:C_putc('|');C_putc('|');out_state= normal;break;
case dot_dot_dot:C_putc('.');C_putc('.');C_putc('.');out_state= normal;
break;
case colon_colon:C_putc(':');C_putc(':');out_state= normal;break;
case period_ast:C_putc('.');C_putc('*');out_state= normal;break;
case minus_gt_ast:C_putc('-');C_putc('>');C_putc('*');out_state= normal;
break;

/*:56*/
#line 648 "ctangle.w"

case'=':case'>':C_putc(cur_char);C_putc(' ');
out_state= normal;break;
case join:out_state= unbreakable;break;
case constant:if(out_state==verbatim){
out_state= num_or_id;break;
}
if(out_state==num_or_id)C_putc(' ');out_state= verbatim;break;
case string:if(out_state==verbatim)out_state= normal;
else out_state= verbatim;break;
case'/':C_putc('/');out_state= post_slash;break;
case'*':if(out_state==post_slash)C_putc(' ');
/* fall through */
default:C_putc(cur_char);out_state= normal;break;
}
}

/*:55*//*64:*/
#line 791 "ctangle.w"

static eight_bits
skip_ahead(void)
{
eight_bits c;
while(true){
if(loc> limit&&(get_line()==false))return new_section;
*(limit+1)= '@';
while(*loc!='@')loc++;
if(loc<=limit){
loc++;c= ccode[(eight_bits)*loc];loc++;
if(c!=ignore||*(loc-1)=='>')return c;
}
}
}

/*:64*//*67:*/
#line 830 "ctangle.w"

static bool skip_comment(
bool is_long_comment)
{
char c;
while(true){
if(loc> limit){
if(is_long_comment){
if(get_line())return comment_continues= true;
else{
#line 168 "ctang-foo.ch"
err_print(_("! Input ended in mid-comment"));
#line 841 "ctangle.w"

return comment_continues= false;
}
}
else return comment_continues= false;
}
c= *(loc++);
if(is_long_comment&&c=='*'&&*loc=='/'){
loc++;return comment_continues= false;
}
if(c=='@'){
if(ccode[(eight_bits)*loc]==new_section){
#line 174 "ctang-foo.ch"
err_print(_("! Section name ended in mid-comment"));loc--;
#line 854 "ctangle.w"

return comment_continues= false;
}
else loc++;
}
}
}

/*:67*//*69:*/
#line 871 "ctangle.w"

static eight_bits
get_next(void)
{
static bool preprocessing= false;
eight_bits c;
while(true){
if(loc> limit){
if(preprocessing&&*(limit-1)!='\\')preprocessing= false;
if(get_line()==false)return new_section;
else if(print_where&&!no_where){
sixteen_bits a;
print_where= false;
/*85:*/
#line 1218 "ctangle.w"

{
store_two_bytes(0150000);
if(changing&&include_depth==change_depth){
id_first= change_file_name;
store_two_bytes((sixteen_bits)change_line);
}else{
id_first= cur_file_name;
store_two_bytes((sixteen_bits)cur_line);
}
id_loc= id_first+strlen(id_first);
store_id(a);
}

/*:85*/
#line 884 "ctangle.w"

}
else return(eight_bits)'\n';
}
c= (eight_bits)*loc;
if(comment_continues||(c=='/'&&(*(loc+1)=='*'||*(loc+1)=='/'))){
if(skip_comment(comment_continues||*(loc+1)=='*'))return'\n';

else continue;
}
loc++;
if(xisdigit(c)||c=='.')/*73:*/
#line 956 "ctangle.w"
{
bool hex_flag= false;
id_first= loc-1;
if(*id_first=='.'&&!xisdigit(*loc))goto mistake;
if(*id_first=='0'){
if(*loc=='x'||*loc=='X'){
hex_flag= true;
loc++;while(xisxdigit(*loc)||*loc=='\'')loc++;
}
else if(*loc=='b'||*loc=='B'){
loc++;while(*loc=='0'||*loc=='1'||*loc=='\'')loc++;goto found;
}
}
while(xisdigit(*loc)||*loc=='\'')loc++;
if(*loc=='.'){
loc++;
while((hex_flag&&xisxdigit(*loc))||xisdigit(*loc)||*loc=='\'')loc++;
}
if(*loc=='e'||*loc=='E'){
if(*++loc=='+'||*loc=='-')loc++;
while(xisdigit(*loc)||*loc=='\'')loc++;
}
else if(hex_flag&&(*loc=='p'||*loc=='P')){
if(*++loc=='+'||*loc=='-')loc++;
while(xisxdigit(*loc)||*loc=='\'')loc++;
}
found:while(*loc=='u'||*loc=='U'||*loc=='l'||*loc=='L'
||*loc=='f'||*loc=='F')loc++;
id_loc= loc;
return constant;
}

/*:73*/
#line 895 "ctangle.w"

else if(c=='\''||c=='"'
||((c=='L'||c=='u'||c=='U')&&(*loc=='\''||*loc=='"'))
||((c=='u'&&*loc=='8')&&(*(loc+1)=='\''||*(loc+1)=='"')))
/*74:*/
#line 993 "ctangle.w"
{
char delim= (char)c;
id_first= section_text+1;
id_loc= section_text;*++id_loc= delim;
if(delim=='L'||delim=='u'||delim=='U'){
if(delim=='u'&&*loc=='8')*++id_loc= *loc++;
delim= *loc++;*++id_loc= delim;
}
while(true){
if(loc>=limit){
if(*(limit-1)!='\\'){
#line 180 "ctang-foo.ch"
err_print(_("! String didn't end"));loc= limit;break;
#line 1005 "ctangle.w"

}
if(get_line()==false){
#line 186 "ctang-foo.ch"
err_print(_("! Input ended in middle of string"));loc= buffer;break;
#line 1009 "ctangle.w"

}
else if(++id_loc<=section_text_end)*id_loc= '\n';

}
if((c= (eight_bits)*loc++)==delim){
if(++id_loc<=section_text_end)*id_loc= (char)c;
break;
}
if(c=='\\'){
if(loc>=limit)continue;
if(++id_loc<=section_text_end)*id_loc= '\\';
c= (eight_bits)*loc++;
}
if(++id_loc<=section_text_end)*id_loc= (char)c;
}
if(id_loc>=section_text_end){
#line 192 "ctang-foo.ch"
printf("%s",_("\n! String too long: "));
#line 1027 "ctangle.w"

term_write(section_text+1,25);
err_print("...");
}
id_loc++;
return string;
}

/*:74*/
#line 899 "ctangle.w"

else if(isalpha((int)c)||isxalpha(c)||ishigh(c))
/*72:*/
#line 947 "ctangle.w"
{
id_first= --loc;
do
++loc;
while(isalpha((int)*loc)||isdigit((int)*loc)
||isxalpha(*loc)||ishigh(*loc));
id_loc= loc;return identifier;
}

/*:72*/
#line 901 "ctangle.w"

else if(c=='@')/*75:*/
#line 1038 "ctangle.w"

switch(c= ccode[(eight_bits)*loc++]){
case ignore:continue;
#line 198 "ctang-foo.ch"
case translit_code:err_print(_("! Use @l in limbo only"));continue;
#line 1042 "ctangle.w"

case control_text:while((c= skip_ahead())=='@');

if(*(loc-1)!='>')
#line 204 "ctang-foo.ch"
err_print(_("! Double @ should be used in control text"));
#line 1047 "ctangle.w"

continue;
case section_name:
cur_section_name_char= *(loc-1);
/*77:*/
#line 1083 "ctangle.w"
{
char*k= section_text;
/*79:*/
#line 1105 "ctangle.w"

while(true){
if(loc> limit&&get_line()==false){
#line 222 "ctang-foo.ch"
err_print(_("! Input ended in section name"));
#line 1109 "ctangle.w"

loc= buffer+1;break;
}
c= (eight_bits)*loc;
/*80:*/
#line 1128 "ctangle.w"

if(c=='@'){
c= (eight_bits)*(loc+1);
if(c=='>'){
loc+= 2;break;
}
if(ccode[(eight_bits)c]==new_section){
#line 234 "ctang-foo.ch"
err_print(_("! Section name didn't end"));break;
#line 1136 "ctangle.w"

}
if(ccode[(eight_bits)c]==section_name){
#line 240 "ctang-foo.ch"
err_print(_("! Nesting of section names not allowed"));break;
#line 1140 "ctangle.w"

}
*(++k)= '@';loc++;
}

/*:80*/
#line 1113 "ctangle.w"

loc++;if(k<section_text_end)k++;
if(xisspace(c)){
c= (eight_bits)' ';if(*(k-1)==' ')k--;
}
*k= (char)c;
}
if(k>=section_text_end){
#line 228 "ctang-foo.ch"
printf("%s",_("\n! Section name too long: "));
#line 1122 "ctangle.w"

term_write(section_text+1,25);
printf("...");mark_harmless();
}
if(*k==' '&&k> section_text)k--;

/*:79*/
#line 1085 "ctangle.w"

if(k-section_text> 3&&strncmp(k-2,"...",3)==0)
cur_section_name= section_lookup(section_text+1,k-3,true);

else cur_section_name= section_lookup(section_text+1,k,false);

if(cur_section_name_char=='(')
/*47:*/
#line 502 "ctangle.w"

{
for(an_output_file= cur_out_file;
an_output_file<end_output_files;an_output_file++)
if(*an_output_file==cur_section_name)break;
if(an_output_file==end_output_files){
if(cur_out_file> output_files)
*--cur_out_file= cur_section_name;
#line 46 "ctang-foo.ch"
else overflow(_("output files"));
#line 511 "ctangle.w"
}
}

/*:47*/
#line 1093 "ctangle.w"

return section_name;
}

/*:77*/
#line 1051 "ctangle.w"

case string:/*81:*/
#line 1150 "ctangle.w"

id_first= loc++;*(limit+1)= '@';*(limit+2)= '>';
while(*loc!='@'||*(loc+1)!='>')loc++;
#line 246 "ctang-foo.ch"
if(loc>=limit)err_print(_("! Verbatim string didn't end"));
#line 1154 "ctangle.w"

id_loc= loc;loc+= 2;
return string;

/*:81*/
#line 1052 "ctangle.w"

case ord:/*76:*/
#line 1063 "ctangle.w"

id_first= loc;
if(*loc=='\\')
if(*++loc=='\'')loc++;
while(*loc!='\''){
if(*loc=='@'){
if(*(loc+1)!='@')
#line 210 "ctang-foo.ch"
err_print(_("! Double @ should be used in ASCII constant"));
#line 1071 "ctangle.w"

else loc++;
}
loc++;
if(loc> limit){
#line 216 "ctang-foo.ch"
err_print(_("! String didn't end"));loc= limit-1;break;
#line 1077 "ctangle.w"

}
}
loc++;
return ord;

/*:76*/
#line 1053 "ctangle.w"

default:return c;
}

/*:75*/
#line 902 "ctangle.w"

else if(xisspace(c)){
if(!preprocessing||loc> limit)continue;

else return(eight_bits)' ';

}
else if(c=='#'&&loc==buffer+1)preprocessing= true;
mistake:/*71:*/
#line 924 "ctangle.w"

switch(c){
case'+':if(*loc=='+')compress(plus_plus);break;
case'-':if(*loc=='-'){compress(minus_minus);}
else if(*loc=='>'){
if(*(loc+1)=='*'){loc++;compress(minus_gt_ast);}
else compress(minus_gt);
}break;
case'.':if(*loc=='*'){compress(period_ast);}
else if(*loc=='.'&&*(loc+1)=='.'){
loc++;compress(dot_dot_dot);
}break;
case':':if(*loc==':')compress(colon_colon);break;
case'=':if(*loc=='=')compress(eq_eq);break;
case'>':if(*loc=='='){compress(gt_eq);}
else if(*loc=='>')compress(gt_gt);break;
case'<':if(*loc=='='){compress(lt_eq);}
else if(*loc=='<')compress(lt_lt);break;
case'&':if(*loc=='&')compress(and_and);break;
case'|':if(*loc=='|')compress(or_or);break;
case'!':if(*loc=='=')compress(non_eq);break;
}

/*:71*/
#line 910 "ctangle.w"

return c;
}
}

/*:69*//*83:*/
#line 1186 "ctangle.w"

static void
scan_repl(
eight_bits t)
{
sixteen_bits a;
if(t==section_name)/*85:*/
#line 1218 "ctangle.w"

{
store_two_bytes(0150000);
if(changing&&include_depth==change_depth){
id_first= change_file_name;
store_two_bytes((sixteen_bits)change_line);
}else{
id_first= cur_file_name;
store_two_bytes((sixteen_bits)cur_line);
}
id_loc= id_first+strlen(id_first);
store_id(a);
}

/*:85*/
#line 1192 "ctangle.w"

while(true)switch(a= get_next()){
/*86:*/
#line 1232 "ctangle.w"

case identifier:store_id(a);
if(*buffer=='#'&&(
(id_loc-id_first==5&&strncmp("endif",id_first,5)==0)||
(id_loc-id_first==4&&strncmp("else",id_first,4)==0)||
(id_loc-id_first==4&&strncmp("elif",id_first,4)==0)))

print_where= true;
break;
case section_name:if(t!=section_name)goto done;
else{
/*87:*/
#line 1273 "ctangle.w"
{
char*try_loc= loc;
while(*try_loc==' '&&try_loc<limit)try_loc++;
if(*try_loc=='+'&&try_loc<limit)try_loc++;
while(*try_loc==' '&&try_loc<limit)try_loc++;
#line 282 "ctang-foo.ch"
if(*try_loc=='=')err_print(_("! Missing `@ ' before a named section"));
#line 1279 "ctangle.w"



}

/*:87*/
#line 1243 "ctangle.w"

a= cur_section_name-name_dir;
app_repl((a/0400)+0250);
app_repl(a%0400);
/*85:*/
#line 1218 "ctangle.w"

{
store_two_bytes(0150000);
if(changing&&include_depth==change_depth){
id_first= change_file_name;
store_two_bytes((sixteen_bits)change_line);
}else{
id_first= cur_file_name;
store_two_bytes((sixteen_bits)cur_line);
}
id_loc= id_first+strlen(id_first);
store_id(a);
}

/*:85*/
#line 1247 "ctangle.w"

}
break;
#line 270 "ctang-foo.ch"
case output_defs_code:if(t!=section_name)err_print(_("! Misplaced @h"));
#line 1251 "ctangle.w"

else{
output_defs_seen= true;
a= output_defs_flag;
app_repl((a/0400)+0200);
app_repl(a%0400);
/*85:*/
#line 1218 "ctangle.w"

{
store_two_bytes(0150000);
if(changing&&include_depth==change_depth){
id_first= change_file_name;
store_two_bytes((sixteen_bits)change_line);
}else{
id_first= cur_file_name;
store_two_bytes((sixteen_bits)cur_line);
}
id_loc= id_first+strlen(id_first);
store_id(a);
}

/*:85*/
#line 1257 "ctangle.w"

}
break;
case constant:case string:
/*88:*/
#line 1290 "ctangle.w"

app_repl(a);
while(id_first<id_loc){
if(*id_first=='@'){
if(*(id_first+1)=='@')id_first++;
#line 288 "ctang-foo.ch"
else err_print(_("! Double @ should be used in string"));
#line 1296 "ctangle.w"

}
else if(a==constant&&*id_first=='\''&&!keep_digit_separators)
id_first++;
app_repl(*id_first++);
}
app_repl(a);

/*:88*/
#line 1261 "ctangle.w"

break;
case ord:
/*89:*/
#line 1308 "ctangle.w"
{
int c= (int)((eight_bits)*id_first);
if(c=='\\'){
c= (int)((eight_bits)*++id_first);
if(c>='0'&&c<='7'){
c-= '0';
if(*(id_first+1)>='0'&&*(id_first+1)<='7'){
c= 8*c+*(++id_first)-'0';
if(*(id_first+1)>='0'&&*(id_first+1)<='7'&&c<32)
c= 8*c+*(++id_first)-'0';
}
}
else switch(c){
case't':c= '\t';break;
case'n':c= '\n';break;
case'b':c= '\b';break;
case'f':c= '\f';break;
case'v':c= '\v';break;
case'r':c= '\r';break;
case'a':c= '\7';break;
case'?':c= '?';break;
case'x':
if(xisdigit(*(id_first+1)))c= (int)(*(++id_first)-'0');
else if(xisxdigit(*(id_first+1))){
++id_first;
c= toupper((int)*id_first)-'A'+10;
}
if(xisdigit(*(id_first+1)))c= 16*c+(int)(*(++id_first)-'0');
else if(xisxdigit(*(id_first+1))){
++id_first;
c= 16*c+toupper((int)*id_first)-(int)'A'+10;
}
break;
case'\\':c= '\\';break;
case'\'':c= '\'';break;
case'\"':c= '\"';break;
#line 294 "ctang-foo.ch"
default:err_print(_("! Unrecognized escape sequence"));
#line 1345 "ctangle.w"

}
}

app_repl(constant);
if(c>=100)app_repl((int)'0'+c/100);
if(c>=10)app_repl((int)'0'+(c/10)%10);
app_repl((int)'0'+c%10);
app_repl(constant);
}

/*:89*/
#line 1264 "ctangle.w"

break;
case definition:case format_code:case begin_C:if(t!=section_name)goto done;
else{
#line 276 "ctang-foo.ch"
err_print(_("! @d, @f and @c are ignored in C text"));continue;
#line 1269 "ctangle.w"

}
case new_section:goto done;

/*:86*/
#line 1197 "ctangle.w"

case')':app_repl(a);
if(t==macro)app_repl(' ');
break;
default:app_repl(a);
}
done:next_control= (eight_bits)a;
#line 264 "ctang-foo.ch"
if(text_ptr> text_info_end)overflow(_("text"));
#line 1205 "ctangle.w"
cur_text= text_ptr;(++text_ptr)->tok_start= tok_ptr;
}

/*:83*//*90:*/
#line 1366 "ctangle.w"

static void
scan_section(void)
{
name_pointer p;
text_pointer q;
sixteen_bits a;
section_count++;no_where= true;
if(*(loc-1)=='*'&&show_progress){
printf("*%d",(int)section_count);update_terminal();
}
next_control= ignore;
while(true){
/*92:*/
#line 1407 "ctangle.w"

while(next_control<definition)

if((next_control= skip_ahead())==section_name){
loc-= 2;next_control= get_next();
}

/*:92*/
#line 1380 "ctangle.w"

if(next_control==definition){
/*93:*/
#line 1414 "ctangle.w"

while((next_control= get_next())=='\n');
if(next_control!=identifier){
#line 300 "ctang-foo.ch"
err_print(_("! Definition flushed, must start with identifier"));
#line 1418 "ctangle.w"

continue;
}
store_id(a);
if(*loc!='('){
app_repl(string);app_repl(' ');app_repl(string);
}
scan_repl(macro);
cur_text->text_link= macro;

/*:93*/
#line 1382 "ctangle.w"

continue;
}
if(next_control==begin_C){
p= name_dir;break;
}
if(next_control==section_name){
p= cur_section_name;
/*94:*/
#line 1436 "ctangle.w"

while((next_control= get_next())=='+');
if(next_control!='='&&next_control!=eq_eq)
continue;

/*:94*/
#line 1390 "ctangle.w"

break;
}
return;
}
no_where= print_where= false;
/*95:*/
#line 1441 "ctangle.w"

/*96:*/
#line 1446 "ctangle.w"

store_two_bytes((sixteen_bits)(0150000+section_count));


/*:96*/
#line 1442 "ctangle.w"

scan_repl(section_name);
/*97:*/
#line 1450 "ctangle.w"

if(p==name_dir||p==NULL){
last_unnamed->text_link= cur_text-text_info;last_unnamed= cur_text;
}
else if(p->equiv==(void*)text_info)p->equiv= (void*)cur_text;

else{
q= (text_pointer)p->equiv;
while(q->text_link<section_flag)
q= q->text_link+text_info;
q->text_link= cur_text-text_info;
}
cur_text->text_link= section_flag;


/*:97*/
#line 1444 "ctangle.w"


/*:95*/
#line 1396 "ctangle.w"

}

/*:90*//*98:*/
#line 1465 "ctangle.w"

static void
phase_one(void){
phase= 1;
section_count= 0;
reset_input();
skip_limbo();
while(!input_has_ended)scan_section();
check_complete();
}

/*:98*//*100:*/
#line 1481 "ctangle.w"

static void
skip_limbo(void)
{
while(true){
if(loc> limit&&get_line()==false)return;
*(limit+1)= '@';
while(*loc!='@')loc++;
if(loc++<=limit){
char c= *loc++;
switch(ccode[(eight_bits)c]){
case new_section:return;
case translit_code:/*102:*/
#line 1511 "ctangle.w"

while(xisspace(*loc)&&loc<limit)loc++;
loc+= 3;
if(loc> limit||!xisxdigit(*(loc-3))||!xisxdigit(*(loc-2))
||(*(loc-3)>='0'&&*(loc-3)<='7')||!xisspace(*(loc-1)))
#line 320 "ctang-foo.ch"
err_print(_("! Improper hex number following @l"));
#line 1517 "ctangle.w"

else{
unsigned int i;
char*beg;
sscanf(loc-3,"%x",&i);
while(xisspace(*loc)&&loc<limit)loc++;
beg= loc;
while(loc<limit&&(xisalpha(*loc)||xisdigit(*loc)||isxalpha(*loc)))loc++;
if(loc-beg>=translit_length)
#line 326 "ctang-foo.ch"
err_print(_("! Replacement string in @l too long"));
#line 1527 "ctangle.w"

else{
strncpy(translit[i-0200],beg,(size_t)(loc-beg));
translit[i-0200][loc-beg]= '\0';
}
}

/*:102*/
#line 1493 "ctangle.w"
break;
case format_code:case'@':break;
case control_text:if(c=='q'||c=='Q'){
while((c= (char)skip_ahead())=='@');
if(*(loc-1)!='>')
#line 306 "ctang-foo.ch"
err_print(_("! Double @ should be used in control text"));
#line 1499 "ctangle.w"

break;
#line 313 "ctang-foo.ch"
}/* otherwise fall through */
default:err_print(_("! Double @ should be used in limbo"));
#line 1503 "ctangle.w"

}
}
}
}

/*:100*//*103:*/
#line 1537 "ctangle.w"

void
print_stats(void){
#line 339 "ctang-foo.ch"
puts(_("\nMemory usage statistics:"));
printf(_("%td names (out of %ld)\n"),
(ptrdiff_t)(name_ptr-name_dir),(long)max_names);
printf(_("%td replacement texts (out of %ld)\n"),
(ptrdiff_t)(text_ptr-text_info),(long)max_texts);
printf(_("%td bytes (out of %ld)\n"),
(ptrdiff_t)(byte_ptr-byte_mem),(long)max_bytes);
printf(_("%td tokens (out of %ld)\n"),
#line 1548 "ctangle.w"
(ptrdiff_t)(tok_ptr-tok_mem),(long)max_toks);
}

#line 352 "ctang-foo.ch"
/*:103*/
