/*1:*/
#line 66 "common.w"

/*3:*/
#line 53 "comm-foo.h"

#ifndef HAVE_GETTEXT
#define HAVE_GETTEXT 0
#endif

#if HAVE_GETTEXT
#include <libintl.h> 
#else
#define gettext(A) A
#endif

#include <stdio.h> 
#include <stdbool.h> 
#include <stdint.h> 
#include <string.h> 

/*:3*//*21:*/
#line 113 "common.w"

#include <ctype.h> 

/*:21*//*24:*/
#line 160 "common.w"

#include <stddef.h>  

/*:24*//*38:*/
#line 460 "common.w"

#include <stdlib.h>  

/*:38*//*97:*/
#line 616 "comm-foo.ch"

#if HAVE_GETTEXT
#include <locale.h>  
#else
#define setlocale(A,B) ""
#define bindtextdomain(A,B) ""
#define textdomain(A) ""
#endif

/*:97*/
#line 67 "common.w"

#define _(S) gettext(S)  \

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
#define minus_gt_ast 027 \

#define xisalpha(c) (isalpha((eight_bits) c) &&((eight_bits) c<0200) ) 
#define xisdigit(c) (isdigit((eight_bits) c) &&((eight_bits) c<0200) ) 
#define xisspace(c) (isspace((eight_bits) c) &&((eight_bits) c<0200) ) 
#define xislower(c) (islower((eight_bits) c) &&((eight_bits) c<0200) ) 
#define xisupper(c) (isupper((eight_bits) c) &&((eight_bits) c<0200) ) 
#define xisxdigit(c) (isxdigit((eight_bits) c) &&((eight_bits) c<0200) )  \

#define length(c) (size_t) ((c+1) ->byte_start-(c) ->byte_start) 
#define print_id(c) term_write((c) ->byte_start,length((c) ) ) 
#define llink link
#define rlink dummy.Rlink
#define root name_dir->rlink \

#define chunk_marker 0 \

#define spotless 0
#define harmless_message 1
#define error_message 2
#define fatal_message 3
#define mark_harmless {if(history==spotless) history= harmless_message;}
#define mark_error history= error_message
#define confusion(s) fatal(_("! This can't happen: ") ,s)  \
 \

#define max_file_name_length 1024
#define cur_file file[include_depth]
#define cur_file_name file_name[include_depth]
#define web_file_name file_name[0]
#define cur_line line[include_depth] \

#define show_banner flags['b']
#define show_progress flags['p']
#define show_stats flags['s']
#define show_happiness flags['h']
#define temporary_output flags['t']
#define make_xrefs flags['x'] \

#define update_terminal fflush(stdout) 
#define new_line putchar('\n') 
#define putxchar putchar
#define term_write(a,b) fflush(stdout) ,fwrite(a,sizeof(char) ,b,stdout) 
#define C_printf(c,a) fprintf(C_file,c,a) 
#define C_putc(c) putc(c,C_file)  \

#define max_bytes 1000000 \

#define max_toks 1000000
#define max_names 10239 \

#define max_texts 10239
#define hash_size 8501
#define longest_name 10000
#define stack_size 500
#define buf_size 1000
#define long_buf_size (buf_size+longest_name)  \
 \

#define max_include_depth 10 \

#define web_file file[0] \

#define lines_dont_match (change_limit-change_buffer!=limit-buffer|| \
strncmp(buffer,change_buffer,(size_t) (limit-buffer) ) )  \

#define if_section_start_make_pending(b) {*limit= '!'; \
for(loc= buffer;xisspace(*loc) ;loc++) ; \
*limit= ' '; \
if(*loc=='@'&&(xisspace(*(loc+1) ) ||*(loc+1) =='*') ) change_pending= b; \
} \

#define max_sections 10239 \
 \

#define too_long() {include_depth--; \
err_print(_("! Include file name too long") ) ;goto restart;} \

#define first_chunk(p) ((p) ->byte_start+2) 
#define prefix_length(p) (int) ((eight_bits) *((p) ->byte_start) *256+ \
(eight_bits) *((p) ->byte_start+1) ) 
#define set_prefix_length(p,m) (*((p) ->byte_start) = (m) /256, \
*((p) ->byte_start+1) = (m) %256)  \

#define less 0
#define equal 1
#define greater 2
#define prefix 3
#define extension 4 \

#define bad_extension 5 \

#define RETURN_OK 0
#define RETURN_WARN 5
#define RETURN_ERROR 10
#define RETURN_FAIL 20 \

#define flag_change (**argv!='-') 
#define max_path_length (BUFSIZ-2)  \

#define PATH_SEPARATOR separators[0]
#define DIR_SEPARATOR separators[1]
#define DEVICE_SEPARATOR separators[2] \


#line 68 "common.w"

/*2:*/
#line 35 "comm-foo.h"

typedef bool boolean;
typedef uint8_t eight_bits;
typedef uint16_t sixteen_bits;
typedef enum{
ctangle,cweave,ctwill
}cweb;
extern cweb program;
extern int phase;

/*:2*//*4:*/
#line 88 "comm-foo.h"

extern char section_text[];
extern char*section_text_end;
extern char*id_first;
extern char*id_loc;

/*:4*//*5:*/
#line 102 "comm-foo.h"

extern char buffer[];
extern char*buffer_end;
extern char*loc;
extern char*limit;

/*:5*//*6:*/
#line 128 "comm-foo.h"

typedef struct name_info{
char*byte_start;
struct name_info*link;
union{
struct name_info*Rlink;

char Ilk;
}dummy;
void*equiv_or_xref;
}name_info;
typedef name_info*name_pointer;
typedef name_pointer*hash_pointer;
extern char byte_mem[];
extern char*byte_mem_end;
extern name_info name_dir[];
extern name_pointer name_dir_end;
extern name_pointer name_ptr;
extern char*byte_ptr;
extern name_pointer hash[];
extern hash_pointer hash_end;
extern hash_pointer h;

/*:6*//*8:*/
#line 173 "comm-foo.h"

extern int history;

/*:8*//*10:*/
#line 190 "comm-foo.h"

extern int include_depth;
extern FILE*file[];
extern FILE*change_file;
extern char C_file_name[];
extern char tex_file_name[];
extern char idx_file_name[];
extern char scn_file_name[];
extern char file_name[][max_file_name_length];

extern char change_file_name[];
extern char check_file_name[];
extern int line[];
extern int change_line;
extern int change_depth;
extern boolean input_has_ended;
extern boolean changing;
extern boolean web_file_open;

/*:10*//*12:*/
#line 215 "comm-foo.h"

extern sixteen_bits section_count;
extern boolean changed_section[];
extern boolean change_pending;
extern boolean print_where;

/*:12*//*13:*/
#line 229 "comm-foo.h"

extern int argc;
extern char**argv;
extern boolean flags[];

/*:13*//*14:*/
#line 241 "comm-foo.h"

extern FILE*C_file;
extern FILE*tex_file;
extern FILE*idx_file;
extern FILE*scn_file;
extern FILE*active_file;
extern FILE*check_file;

/*:14*/
#line 69 "common.w"

/*18:*/
#line 85 "common.w"

#line 41 "comm-foo.ch"
cweb program;
#line 87 "common.w"

/*:18*//*19:*/
#line 94 "common.w"
int phase;

/*:19*//*22:*/
#line 134 "common.w"

char section_text[longest_name+1];
char*section_text_end= section_text+longest_name;
char*id_first;
char*id_loc;

/*:22*//*23:*/
#line 154 "common.w"

char buffer[long_buf_size];
char*buffer_end= buffer+buf_size-2;
char*limit= buffer;
char*loc= buffer;

/*:23*//*26:*/
#line 204 "common.w"

int include_depth;
FILE*file[max_include_depth];
FILE*change_file;
char file_name[max_include_depth][max_file_name_length];

char change_file_name[max_file_name_length];
char alt_web_file_name[max_file_name_length];
int line[max_include_depth];
int change_line;
int change_depth;
boolean input_has_ended;
boolean changing;
boolean web_file_open= 0;

/*:26*//*27:*/
#line 230 "common.w"

char change_buffer[buf_size];
char*change_limit;

/*:27*//*36:*/
#line 408 "common.w"

sixteen_bits section_count;
boolean changed_section[max_sections];
boolean change_pending;

boolean print_where= 0;

/*:36*//*43:*/
#line 578 "common.w"

char byte_mem[max_bytes];
char*byte_mem_end= byte_mem+max_bytes-1;
name_info name_dir[max_names];
name_pointer name_dir_end= name_dir+max_names-1;

/*:43*//*45:*/
#line 592 "common.w"

name_pointer name_ptr;
char*byte_ptr;

/*:45*//*48:*/
#line 614 "common.w"

name_pointer hash[hash_size];
hash_pointer hash_end= hash+hash_size-1;
hash_pointer h;

/*:48*//*69:*/
#line 1008 "common.w"

int history= spotless;

/*:69*//*80:*/
#line 1132 "common.w"

int argc;
char**argv;
char C_file_name[max_file_name_length];
char tex_file_name[max_file_name_length];
char idx_file_name[max_file_name_length];
#line 363 "comm-foo.ch"
char scn_file_name[max_file_name_length];
char check_file_name[max_file_name_length];
#line 370 "comm-foo.ch"
boolean flags[128];
const char*use_language= "";
#line 1140 "common.w"

/*:80*//*90:*/
#line 1280 "common.w"

FILE*C_file;
FILE*tex_file;
FILE*idx_file;
#line 472 "comm-foo.ch"
FILE*scn_file;
FILE*check_file;
#line 1285 "common.w"
FILE*active_file;

#line 489 "comm-foo.ch"
/*:90*//*95:*/
#line 586 "comm-foo.ch"

char include_path[max_path_length+2];
char*p,*path_prefix,*next_path_prefix;

#ifndef SEPARATORS
#define SEPARATORS "://"
#endif
char separators[]= SEPARATORS;

/*:95*/
#line 70 "common.w"

/*7:*/
#line 151 "comm-foo.h"

extern boolean names_match(name_pointer,const char*,size_t,eight_bits);
extern name_pointer id_lookup(const char*,const char*,char);

extern name_pointer prefix_lookup(char*,char*);
extern name_pointer section_lookup(char*,char*,int);
extern void init_node(name_pointer);
extern void init_p(name_pointer,eight_bits);
extern void print_prefix_name(name_pointer);
extern void print_section_name(name_pointer);
extern void sprint_section_name(char*,name_pointer);

/*:7*//*9:*/
#line 176 "comm-foo.h"

extern int wrap_up(void);
extern void err_print(const char*);
extern void fatal(const char*,const char*);
extern void overflow(const char*);

/*:9*//*11:*/
#line 209 "comm-foo.h"

extern boolean get_line(void);
extern void check_complete(void);
extern void reset_input(void);

/*:11*//*15:*/
#line 250 "comm-foo.h"

extern void common_init(void);
extern void print_stats(void);

/*:15*//*67:*/
#line 963 "common.w"

static int section_name_cmp(char**,int,name_pointer);

/*:67*//*76:*/
#line 1092 "common.w"

extern void fatal(const char*,const char*);
extern void overflow(const char*);

/*:76*//*82:*/
#line 1164 "common.w"

static void scan_args(void);

/*:82*//*93:*/
#line 539 "comm-foo.ch"

static boolean set_path(char*,char*);
#line 1302 "common.w"
static boolean input_ln(FILE*);
static int web_strcmp(char*,int,char*,int);
static name_pointer add_section_name(name_pointer,int,char*,char*,int);
static void extend_section_name(name_pointer,char*,char*,int);
static void check_change(void);
static void prime_the_change_buffer(void);

#line 546 "comm-foo.ch"
/*:93*/
#line 71 "common.w"


/*:1*//*20:*/
#line 100 "common.w"

void
common_init(void)
{
/*46:*/
#line 596 "common.w"

name_dir->byte_start= byte_ptr= byte_mem;
name_ptr= name_dir+1;
name_ptr->byte_start= byte_mem;

/*:46*//*49:*/
#line 621 "common.w"

for(h= hash;h<=hash_end;*h++= NULL);

/*:49*//*55:*/
#line 684 "common.w"

root= NULL;

/*:55*/
#line 104 "common.w"

#line 47 "comm-foo.ch"
/*98:*/
#line 625 "comm-foo.ch"

setlocale(LC_MESSAGES,setlocale(LC_CTYPE,""));
bindtextdomain("cweb","/usr/share/locale/");
textdomain("cweb");


/*:98*/
#line 47 "comm-foo.ch"

/*81:*/
#line 1145 "common.w"

#line 377 "comm-foo.ch"
show_banner= show_happiness= show_progress= make_xrefs= true;
temporary_output= true;
#line 1147 "common.w"
show_stats= false;

/*:81*/
#line 48 "comm-foo.ch"

#line 106 "common.w"
/*91:*/
#line 489 "comm-foo.ch"

scan_args();
if(program==ctangle){
if((C_file= fopen(C_file_name,"a"))==NULL)
fatal(_("! Cannot open output file "),C_file_name);

else fclose(C_file);
strcpy(check_file_name,C_file_name);
if(check_file_name[0]!='\0'){
char*dot_pos= strrchr(check_file_name,'.');
if(dot_pos==NULL)strcat(check_file_name,".ttp");
else strcpy(dot_pos,".ttp");
}
if((C_file= fopen(check_file_name,"wb"))==NULL)
fatal(_("! Cannot open output file "),check_file_name);

}
else{
if((tex_file= fopen(tex_file_name,"a"))==NULL)
fatal(_("! Cannot open output file "),tex_file_name);
else fclose(tex_file);
strcpy(check_file_name,tex_file_name);
if(check_file_name[0]!='\0'){
char*dot_pos= strrchr(check_file_name,'.');
if(dot_pos==NULL)strcat(check_file_name,".wtp");
else strcpy(dot_pos,".wtp");
}
if((tex_file= fopen(check_file_name,"wb"))==NULL)
fatal(_("! Cannot open output file "),check_file_name);
}
#line 1298 "common.w"

#line 524 "comm-foo.ch"
/*:91*/
#line 106 "common.w"

}

/*:20*//*25:*/
#line 167 "common.w"

static boolean input_ln(
FILE*fp)
{
register int c= EOF;
register char*k;
if(feof(fp))return(0);
limit= k= buffer;
while(k<=buffer_end&&(c= getc(fp))!=EOF&&c!='\n')
if((*(k++)= c)!=' ')limit= k;
if(k> buffer_end)
if((c= getc(fp))!=EOF&&c!='\n'){
#line 54 "comm-foo.ch"
ungetc(c,fp);loc= buffer;err_print(_("! Input line too long"));
#line 180 "common.w"

}
if(c==EOF&&limit==buffer)return(0);

return(1);
}

/*:25*//*28:*/
#line 241 "common.w"

static void
prime_the_change_buffer(void)
{
change_limit= change_buffer;
/*29:*/
#line 255 "common.w"

while(1){
change_line++;
if(!input_ln(change_file))return;
if(limit<buffer+2)continue;
if(buffer[0]!='@')continue;
if(xisupper(buffer[1]))buffer[1]= tolower((eight_bits)buffer[1]);
if(buffer[1]=='x')break;
if(buffer[1]=='y'||buffer[1]=='z'||buffer[1]=='i'){
loc= buffer+2;
#line 60 "comm-foo.ch"
err_print(_("! Missing @x in change file"));
#line 266 "common.w"

}
}

/*:29*/
#line 246 "common.w"

/*30:*/
#line 272 "common.w"

do{
change_line++;
if(!input_ln(change_file)){
#line 66 "comm-foo.ch"
err_print(_("! Change file ended after @x"));
#line 277 "common.w"

return;
}
}while(limit==buffer);

/*:30*/
#line 247 "common.w"

/*31:*/
#line 282 "common.w"

{
change_limit= change_buffer+(ptrdiff_t)(limit-buffer);
strncpy(change_buffer,buffer,(size_t)(limit-buffer+1));
}

/*:31*/
#line 248 "common.w"

}

/*:28*//*32:*/
#line 310 "common.w"

static void
check_change(void)
{
int n= 0;
if(lines_dont_match)return;
change_pending= 0;
if(!changed_section[section_count]){
if_section_start_make_pending(1);
if(!change_pending)changed_section[section_count]= 1;
}
while(1){
changing= 1;print_where= 1;change_line++;
if(!input_ln(change_file)){
#line 72 "comm-foo.ch"
err_print(_("! Change file ended before @y"));
#line 325 "common.w"

change_limit= change_buffer;changing= 0;
return;
}
if(limit> buffer+1&&buffer[0]=='@'){
char xyz_code= xisupper(buffer[1])?tolower((eight_bits)buffer[1]):buffer[1];
/*33:*/
#line 348 "common.w"

if(xyz_code=='x'||xyz_code=='z'){
#line 84 "comm-foo.ch"
loc= buffer+2;err_print(_("! Where is the matching @y?"));
#line 351 "common.w"

}
else if(xyz_code=='y'){
if(n> 0){
loc= buffer+2;
printf("\n! Hmm... %d ",n);
#line 90 "comm-foo.ch"
err_print(_("of the preceding lines failed to match"));
#line 358 "common.w"

}
change_depth= include_depth;
return;
}

/*:33*/
#line 332 "common.w"

}
/*31:*/
#line 282 "common.w"

{
change_limit= change_buffer+(ptrdiff_t)(limit-buffer);
strncpy(change_buffer,buffer,(size_t)(limit-buffer+1));
}

/*:31*/
#line 334 "common.w"

changing= 0;cur_line++;
while(!input_ln(cur_file)){
if(include_depth==0){
#line 78 "comm-foo.ch"
err_print(_("! CWEB file ended during a change"));
#line 339 "common.w"

input_has_ended= 1;return;
}
include_depth--;cur_line++;
}
if(lines_dont_match)n++;
}
}

/*:32*//*34:*/
#line 368 "common.w"

void
reset_input(void)
{
limit= buffer;loc= buffer+1;buffer[0]= ' ';
/*35:*/
#line 383 "common.w"

if((web_file= fopen(web_file_name,"r"))==NULL){
strcpy(web_file_name,alt_web_file_name);
if((web_file= fopen(web_file_name,"r"))==NULL)
#line 96 "comm-foo.ch"
fatal(_("! Cannot open input file "),web_file_name);
#line 388 "common.w"
}


web_file_open= 1;
if((change_file= fopen(change_file_name,"r"))==NULL)
#line 102 "comm-foo.ch"
fatal(_("! Cannot open change file "),change_file_name);
#line 394 "common.w"

/*:35*/
#line 373 "common.w"

include_depth= 0;cur_line= 0;change_line= 0;
change_depth= include_depth;
changing= 1;prime_the_change_buffer();changing= !changing;
limit= buffer;loc= buffer+1;buffer[0]= ' ';input_has_ended= 0;
}

/*:34*//*37:*/
#line 415 "common.w"

boolean get_line(void)
{
restart:
if(changing&&include_depth==change_depth)
/*41:*/
#line 526 "common.w"
{
change_line++;
if(!input_ln(change_file)){
#line 206 "comm-foo.ch"
err_print(_("! Change file ended without @z"));
#line 530 "common.w"

buffer[0]= '@';buffer[1]= 'z';limit= buffer+2;
}
if(limit> buffer){
if(change_pending){
if_section_start_make_pending(0);
if(change_pending){
changed_section[section_count]= 1;change_pending= 0;
}
}
*limit= ' ';
if(buffer[0]=='@'){
if(xisupper(buffer[1]))buffer[1]= tolower((eight_bits)buffer[1]);
if(buffer[1]=='x'||buffer[1]=='y'){
loc= buffer+2;
#line 212 "comm-foo.ch"
err_print(_("! Where is the matching @z?"));
#line 546 "common.w"

}
else if(buffer[1]=='z'){
prime_the_change_buffer();changing= !changing;print_where= 1;
}
}
}
}

/*:41*/
#line 420 "common.w"

if(!changing||include_depth> change_depth){
/*40:*/
#line 509 "common.w"
{
cur_line++;
while(!input_ln(cur_file)){
print_where= 1;
if(include_depth==0){input_has_ended= 1;break;}
else{
fclose(cur_file);include_depth--;
if(changing&&include_depth==change_depth)break;
cur_line++;
}
}
if(!changing&&!input_has_ended)
if(limit-buffer==change_limit-change_buffer)
if(buffer[0]==change_buffer[0])
if(change_limit> change_buffer)check_change();
}

/*:40*/
#line 422 "common.w"

if(changing&&include_depth==change_depth)goto restart;
}
if(input_has_ended)return 0;
loc= buffer;*limit= ' ';
if(buffer[0]=='@'&&(buffer[1]=='i'||buffer[1]=='I')){
loc= buffer+2;*limit= '"';
while(*loc==' '||*loc=='\t')loc++;
if(loc>=limit){
#line 108 "comm-foo.ch"
err_print(_("! Include file name not given"));
#line 432 "common.w"

goto restart;
}
if(include_depth>=max_include_depth-1){
#line 114 "comm-foo.ch"
err_print(_("! Too many nested includes"));
#line 437 "common.w"

goto restart;
}
include_depth++;
/*39:*/
#line 463 "common.w"
{
char temp_file_name[max_file_name_length];
char*cur_file_name_end= cur_file_name+max_file_name_length-1;
char*k= cur_file_name,*kk;
int l;

if(*loc=='"'){
loc++;
while(*loc!='"'&&k<=cur_file_name_end)*k++= *loc++;
if(loc==limit)k= cur_file_name_end+1;
}else
while(*loc!=' '&&*loc!='\t'&&*loc!='"'&&k<=cur_file_name_end)*k++= *loc++;
if(k> cur_file_name_end)too_long();

*k= '\0';
if((cur_file= fopen(cur_file_name,"r"))!=NULL){
cur_line= 0;print_where= 1;
goto restart;
}
#line 174 "comm-foo.ch"
if(0==set_path(include_path,getenv("CWEBINPUTS"))){
include_depth--;goto restart;
}
path_prefix= include_path;
while(path_prefix){
for(kk= temp_file_name,p= path_prefix,l= 0;
p&&*p&&*p!=PATH_SEPARATOR;
*kk++= *p++,l++);
if(path_prefix&&*path_prefix&&*path_prefix!=PATH_SEPARATOR&&
*--p!=DEVICE_SEPARATOR&&*p!=DIR_SEPARATOR){
*kk++= DIR_SEPARATOR;l++;
}
if(k+l+2>=cur_file_name_end)too_long();
strcpy(kk,cur_file_name);
if((cur_file= fopen(temp_file_name,"r"))!=NULL){
cur_line= 0;print_where= 1;goto restart;
}
if((next_path_prefix= strchr(path_prefix,PATH_SEPARATOR))!=NULL)
path_prefix= next_path_prefix+1;
else break;
}
#line 200 "comm-foo.ch"
include_depth--;err_print(_("! Cannot open include file"));goto restart;
#line 507 "common.w"
}

/*:39*/
#line 441 "common.w"

}
return 1;
}

#line 129 "comm-foo.ch"
/*:37*//*42:*/
#line 558 "common.w"

void
check_complete(void){
if(change_limit!=change_buffer){
strncpy(buffer,change_buffer,(size_t)(change_limit-change_buffer+1));
limit= buffer+(ptrdiff_t)(change_limit-change_buffer);
changing= 1;change_depth= include_depth;loc= buffer;
#line 218 "comm-foo.ch"
err_print(_("! Change file entry did not match"));
#line 566 "common.w"

}
}

/*:42*//*50:*/
#line 626 "common.w"

name_pointer
id_lookup(
const char*first,
const char*last,
char t)
{
const char*i= first;
int h;
int l;
name_pointer p;
if(last==NULL)for(last= first;*last!='\0';last++);
l= (int)(last-first);
/*51:*/
#line 649 "common.w"

h= (eight_bits)*i;
while(++i<last)h= (h+h+(int)((eight_bits)*i))%hash_size;


/*:51*/
#line 639 "common.w"

/*52:*/
#line 657 "common.w"

p= hash[h];
while(p&&!names_match(p,first,l,t))p= p->link;
if(p==NULL){
p= name_ptr;
p->link= hash[h];hash[h]= p;
}

/*:52*/
#line 640 "common.w"

if(p==name_ptr)/*53:*/
#line 665 "common.w"
{
#line 225 "comm-foo.ch"
if(byte_ptr+l> byte_mem_end)overflow(_("byte memory"));
if(name_ptr>=name_dir_end)overflow(_("name"));
#line 668 "common.w"
strncpy(byte_ptr,first,l);
(++name_ptr)->byte_start= byte_ptr+= l;
init_p(p,t);
}

/*:53*/
#line 641 "common.w"

return(p);
}

/*:50*//*56:*/
#line 711 "common.w"

void
print_section_name(
name_pointer p)
{
char*ss,*s= first_chunk(p);
name_pointer q= p+1;
while(p!=name_dir){
ss= (p+1)->byte_start-1;
if(*ss==' '&&ss>=s){
term_write(s,(size_t)(ss-s));p= q->link;q= p;
}else{
term_write(s,(size_t)(ss+1-s));p= name_dir;q= NULL;
}
s= p->byte_start;
}
if(q)term_write("...",3);
}

/*:56*//*57:*/
#line 730 "common.w"

void
sprint_section_name(
char*dest,
name_pointer p)
{
char*ss,*s= first_chunk(p);
name_pointer q= p+1;
while(p!=name_dir){
ss= (p+1)->byte_start-1;
if(*ss==' '&&ss>=s){
p= q->link;q= p;
}else{
ss++;p= name_dir;
}
strncpy(dest,s,(size_t)(ss-s)),dest+= ss-s;
s= p->byte_start;
}
*dest= '\0';
}

/*:57*//*58:*/
#line 751 "common.w"

void
print_prefix_name(
name_pointer p)
{
char*s= first_chunk(p);
int l= prefix_length(p);
term_write(s,l);
if(s+l<(p+1)->byte_start)term_write("...",3);
}

/*:58*//*59:*/
#line 772 "common.w"

static int web_strcmp(
char*j,
int j_len,
char*k,
int k_len)
{
char*j1= j+j_len,*k1= k+k_len;
while(k<k1&&j<j1&&*j==*k)k++,j++;
if(k==k1)if(j==j1)return equal;
else return extension;
else if(j==j1)return prefix;
else if(*j<*k)return less;
else return greater;
}

/*:59*//*61:*/
#line 801 "common.w"

static name_pointer
add_section_name(
name_pointer par,
int c,
char*first,
char*last,
int ispref)
{
name_pointer p= name_ptr;
char*s= first_chunk(p);
int name_len= (int)(last-first)+ispref;
#line 233 "comm-foo.ch"
if(s+name_len> byte_mem_end)overflow(_("byte memory"));
if(name_ptr+1>=name_dir_end)overflow(_("name"));
#line 815 "common.w"
(++name_ptr)->byte_start= byte_ptr= s+name_len;
if(ispref){
*(byte_ptr-1)= ' ';
name_len--;
name_ptr->link= name_dir;
(++name_ptr)->byte_start= byte_ptr;
}
set_prefix_length(p,name_len);
strncpy(s,first,name_len);
p->llink= NULL;
p->rlink= NULL;
init_node(p);
return par==NULL?(root= p):c==less?(par->llink= p):(par->rlink= p);
}

/*:61*//*62:*/
#line 830 "common.w"

static void
extend_section_name(
name_pointer p,
char*first,
char*last,
int ispref)
{
char*s;
name_pointer q= p+1;
int name_len= (int)(last-first)+ispref;
#line 240 "comm-foo.ch"
if(name_ptr>=name_dir_end)overflow(_("name"));
#line 842 "common.w"
while(q->link!=name_dir)q= q->link;
q->link= name_ptr;
s= name_ptr->byte_start;
name_ptr->link= name_dir;
#line 246 "comm-foo.ch"
if(s+name_len> byte_mem_end)overflow(_("byte memory"));
#line 847 "common.w"
(++name_ptr)->byte_start= byte_ptr= s+name_len;
strncpy(s,first,name_len);
if(ispref)*(byte_ptr-1)= ' ';
}

/*:62*//*63:*/
#line 858 "common.w"

name_pointer
section_lookup(
char*first,char*last,
int ispref)
{
int c= 0;
name_pointer p= root;
name_pointer q= NULL;
name_pointer r= NULL;
name_pointer par= NULL;

int name_len= (int)(last-first)+1;
/*64:*/
#line 882 "common.w"

while(p){
c= web_strcmp(first,name_len,first_chunk(p),prefix_length(p));
if(c==less||c==greater){
if(r==NULL)
par= p;
p= (c==less?p->llink:p->rlink);
}else{
if(r!=NULL){
#line 252 "comm-foo.ch"
fputs(_("\n! Ambiguous prefix: matches <"),stdout);
#line 892 "common.w"

print_prefix_name(p);
#line 258 "comm-foo.ch"
fputs(_(">\n and <"),stdout);
#line 895 "common.w"
print_prefix_name(r);
err_print(">");
return name_dir;
}
r= p;
p= p->llink;
q= r->rlink;
}
if(p==NULL)
p= q,q= NULL;
}

/*:64*/
#line 872 "common.w"

/*65:*/
#line 907 "common.w"

if(r==NULL)
return add_section_name(par,c,first,last+1,ispref);

/*:65*/
#line 873 "common.w"

/*66:*/
#line 915 "common.w"

switch(section_name_cmp(&first,name_len,r)){

case prefix:
if(!ispref){
#line 264 "comm-foo.ch"
fputs(_("\n! New name is a prefix of <"),stdout);
#line 921 "common.w"

print_section_name(r);
err_print(">");
}
else if(name_len<prefix_length(r))set_prefix_length(r,name_len);

case equal:return r;
case extension:if(!ispref||first<=last)
extend_section_name(r,first,last+1,ispref);
return r;
case bad_extension:
#line 270 "comm-foo.ch"
fputs(_("\n! New name extends <"),stdout);
#line 933 "common.w"

print_section_name(r);
err_print(">");
return r;
default:
#line 276 "comm-foo.ch"
fputs(_("\n! Section name incompatible with <"),stdout);
#line 939 "common.w"

print_prefix_name(r);
#line 282 "comm-foo.ch"
fputs(_(">,\n which abbreviates <"),stdout);
#line 942 "common.w"
print_section_name(r);
err_print(">");
return r;
}

/*:66*/
#line 874 "common.w"

}

/*:63*//*68:*/
#line 966 "common.w"

static int section_name_cmp(
char**pfirst,
int len,
name_pointer r)
{
char*first= *pfirst;
name_pointer q= r+1;
char*ss,*s= first_chunk(r);
int c;
int ispref;
while(1){
ss= (r+1)->byte_start-1;
if(*ss==' '&&ss>=r->byte_start)ispref= 1,q= q->link;
else ispref= 0,ss++,q= name_dir;
switch(c= web_strcmp(first,len,s,ss-s)){
case equal:if(q==name_dir)
if(ispref){
*pfirst= first+(ptrdiff_t)(ss-s);
return extension;
}else return equal;
else return(q->byte_start==(q+1)->byte_start)?equal:prefix;
case extension:
if(!ispref)return bad_extension;
first+= ss-s;
if(q!=name_dir){len-= (int)(ss-s);s= q->byte_start;r= q;continue;}
*pfirst= first;return extension;
default:return c;
}
}
}

/*:68*//*71:*/
#line 1018 "common.w"

void
err_print(
const char*s)
{
char*k,*l;
printf(*s=='!'?"\n%s":"%s",s);
if(web_file_open)/*72:*/
#line 1038 "common.w"

{if(changing&&include_depth==change_depth)
#line 290 "comm-foo.ch"
printf(_(". (l. %d of change file)\n"),change_line);
else if(include_depth==0)printf(_(". (l. %d)\n"),cur_line);
else printf(_(". (l. %d of include file %s)\n"),cur_line,cur_file_name);
#line 1043 "common.w"
l= (loc>=limit?limit:loc);
if(l> buffer){
for(k= buffer;k<l;k++)
if(*k=='\t')putchar(' ');
else putchar(*k);
putchar('\n');
for(k= buffer;k<l;k++)putchar(' ');
}
for(k= l;k<limit;k++)putchar(*k);
if(*limit=='|')putchar('|');
putchar(' ');
}

/*:72*/
#line 1025 "common.w"

update_terminal;mark_error;
}

/*:71*//*74:*/
#line 1069 "common.w"

int wrap_up(void){
if(show_progress)new_line;
if(show_stats)
print_stats();
#line 320 "comm-foo.ch"
/*75:*/
#line 1079 "common.w"

switch(history){
#line 344 "comm-foo.ch"
case spotless:
if(show_happiness)puts(_("(No errors were found.)"));break;
case harmless_message:
puts(_("(Did you see the warning message above?)"));break;
case error_message:
puts(_("(Pardon me, but I think I spotted something wrong.)"));break;
case fatal_message:
puts(_("(That was a fatal error, my friend.)"));
#line 1087 "common.w"
}

/*:75*/
#line 320 "comm-foo.ch"

/*96:*/
#line 598 "comm-foo.ch"

if(C_file)fclose(C_file);
if(tex_file)fclose(tex_file);
if(check_file)fclose(check_file);
if(strlen(check_file_name))
remove(check_file_name);

/*:96*/
#line 321 "comm-foo.ch"

#line 328 "comm-foo.ch"
switch(history){
case harmless_message:return RETURN_WARN;
case error_message:return RETURN_ERROR;
case fatal_message:return RETURN_FAIL;
default:return RETURN_OK;
}
#line 1077 "common.w"
}

/*:74*//*77:*/
#line 1099 "common.w"
void
fatal(
const char*s,const char*t)
{
if(*s)err_print(s);
err_print(t);
history= fatal_message;exit(wrap_up());
}

/*:77*//*78:*/
#line 1110 "common.w"
void
overflow(
const char*t)
{
#line 357 "comm-foo.ch"
printf(_("\n! Sorry, %s capacity exceeded"),t);fatal("","");
#line 1115 "common.w"
}


/*:78*//*83:*/
#line 1167 "common.w"

static void
scan_args(void)
{
char*dot_pos;
char*name_pos;
register char*s;
boolean found_web= 0,found_change= 0,found_out= 0;


#line 393 "comm-foo.ch"

#if defined DEV_NULL
strncpy(change_file_name,DEV_NULL,max_file_name_length-2);
change_file_name[max_file_name_length-2]= '\0';
#elif defined _DEV_NULL
strncpy(change_file_name,_DEV_NULL,max_file_name_length-2);
change_file_name[max_file_name_length-2]= '\0';
#else
strcpy(change_file_name,"/dev/null");
#endif

#line 1178 "common.w"
while(--argc> 0){
if((**(++argv)=='-'||**argv=='+')&&*(*argv+1))/*87:*/
#line 427 "comm-foo.ch"

{
for(dot_pos= *argv+1;*dot_pos> '\0';dot_pos++)
if(*dot_pos=='l'){
use_language= ++dot_pos;
break;
}else
#line 1259 "common.w"
 flags[(eight_bits)*dot_pos]= flag_change;
}

/*:87*/
#line 1179 "common.w"

else{
s= name_pos= *argv;dot_pos= NULL;
#line 413 "comm-foo.ch"
while(*s){
if(*s=='.')dot_pos= s++;
else if(*s==DIR_SEPARATOR||*s==DEVICE_SEPARATOR||*s=='/')
dot_pos= NULL,name_pos= ++s;
else s++;
}

#line 1187 "common.w"
if(!found_web)/*84:*/
#line 1204 "common.w"

{
if(s-*argv> max_file_name_length-5)
/*89:*/
#line 466 "comm-foo.ch"
fatal(_("! Filename too long\n"),*argv);
#line 1275 "common.w"


/*:89*/
#line 1207 "common.w"

if(dot_pos==NULL)
sprintf(web_file_name,"%s.w",*argv);
else{
strcpy(web_file_name,*argv);
*dot_pos= 0;
}
sprintf(alt_web_file_name,"%s.web",*argv);
sprintf(tex_file_name,"%s.tex",name_pos);
sprintf(idx_file_name,"%s.idx",name_pos);
sprintf(scn_file_name,"%s.scn",name_pos);
sprintf(C_file_name,"%s.c",name_pos);
found_web= 1;
}

/*:84*/
#line 1188 "common.w"

else if(!found_change)/*85:*/
#line 1222 "common.w"

{
if(strcmp(*argv,"-")!=0){
if(s-*argv> max_file_name_length-4)
/*89:*/
#line 466 "comm-foo.ch"
fatal(_("! Filename too long\n"),*argv);
#line 1275 "common.w"


/*:89*/
#line 1226 "common.w"

if(dot_pos==NULL)
sprintf(change_file_name,"%s.ch",*argv);
else strcpy(change_file_name,*argv);
}
found_change= 1;
}

/*:85*/
#line 1189 "common.w"

else if(!found_out)/*86:*/
#line 1234 "common.w"

{
if(s-*argv> max_file_name_length-5)
/*89:*/
#line 466 "comm-foo.ch"
fatal(_("! Filename too long\n"),*argv);
#line 1275 "common.w"


/*:89*/
#line 1237 "common.w"

if(dot_pos==NULL){
sprintf(tex_file_name,"%s.tex",*argv);
sprintf(idx_file_name,"%s.idx",*argv);
sprintf(scn_file_name,"%s.scn",*argv);
sprintf(C_file_name,"%s.c",*argv);
}else{
strcpy(tex_file_name,*argv);
strcpy(C_file_name,*argv);
if(make_xrefs){
*dot_pos= 0;
sprintf(idx_file_name,"%s.idx",*argv);
sprintf(scn_file_name,"%s.scn",*argv);
}
}
found_out= 1;
}

/*:86*/
#line 1190 "common.w"

else/*88:*/
#line 1262 "common.w"

{
#line 446 "comm-foo.ch"
switch(program){
case ctangle:fatal(
_("! Usage: ctangle [options] "
"webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n")
,"");

case cweave:fatal(
_("! Usage: cweave [options] "
"webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
,"");
default:fatal(
_("! Usage: ctwill [options] "
"webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
,"");
}
#line 1272 "common.w"
}

#line 466 "comm-foo.ch"
/*:88*/
#line 1191 "common.w"

}
}
if(!found_web)/*88:*/
#line 1262 "common.w"

{
#line 446 "comm-foo.ch"
switch(program){
case ctangle:fatal(
_("! Usage: ctangle [options] "
"webfile[.w] [{changefile[.ch]|-} [outfile[.c]]]\n")
,"");

case cweave:fatal(
_("! Usage: cweave [options] "
"webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
,"");
default:fatal(
_("! Usage: ctwill [options] "
"webfile[.w] [{changefile[.ch]|-} [outfile[.tex]]]\n")
,"");
}
#line 1272 "common.w"
}

#line 466 "comm-foo.ch"
/*:88*/
#line 1194 "common.w"

}

/*:83*//*94:*/
#line 555 "comm-foo.ch"

static boolean set_path(char*include_path,char*environment)
{
char string[max_path_length+2];

#ifdef CWEBINPUTS
strncpy(include_path,CWEBINPUTS,max_path_length);
include_path[max_path_length]= '\0';
#endif

if(environment){
if(strlen(environment)+strlen(include_path)>=max_path_length){
err_print(_("! Include path too long"));return(0);

}else{
sprintf(string,"%s%c%s",environment,PATH_SEPARATOR,include_path);
strcpy(include_path,string);
}
}
return(1);
}

/*:94*/
