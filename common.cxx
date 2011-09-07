/*1:*/
#line 58 "common.w"

/*5:*/
#line 102 "common.w"

#include <ctype.h> 

/*:5*//*8:*/
#line 165 "common.w"

#include <stdio.h> 

/*:8*//*22:*/
#line 470 "common.w"

#line 257 "comm-p19.ch"
#include <stddef.h>  
#include <signal.h>  
#include <stdlib.h>  

#ifdef SEPARATORS
char separators[]= SEPARATORS;
#else
char separators[]= "://";
#endif

#define PATH_SEPARATOR   separators[0]
#define DIR_SEPARATOR    separators[1]
#define DEVICE_SEPARATOR separators[2]
#line 472 "common.w"

/*:22*//*81:*/
#line 1013 "comm-p19.ch"

#include <string.h> 

/*:81*//*90:*/
#line 1135 "comm-p19.ch"

#ifdef _AMIGA
#include <proto/exec.h> 
#include <proto/locale.h> 

struct Library*LocaleBase= NULL;
struct Catalog*catalog= NULL;
int i;
#else 
typedef long int LONG;
typedef char*STRPTR;
#define EXEC_TYPES_H 1 
#endif

#define STRINGARRAY 1 
#define get_string(n) AppStrings[n].as_Str 

#include "cweb.h"

/*:90*/
#line 59 "common.w"

#define ctangle 0
#define cweave 1 \

#define and_and 04
#define lt_lt 020
#define gt_gt 021
#define plus_plus 013
#define minus_minus 01
#define minus_gt 031
#define not_eq 032
#define lt_eq 034
#define gt_eq 035
#define eq_eq 036
#define or_or 037
#define dot_dot_dot 016
#define colon_colon 06
#define period_ast 026
#define minus_gt_ast 027 \

#define buf_size 100
#define longest_name 1000
#define long_buf_size (buf_size+longest_name) 
#define xisspace(c) (isspace(c) &&((unsigned char) c<0200) ) 
#define xisupper(c) (isupper(c) &&((unsigned char) c<0200) )  \

#define max_include_depth 10 \

#define max_file_name_length 255
#define cur_file file[include_depth]
#define cur_file_name file_name[include_depth]
#define cur_line line[include_depth]
#define web_file file[0]
#define web_file_name file_name[0] \

#define lines_dont_match (change_limit-change_buffer!=limit-buffer|| \
strncmp(buffer,change_buffer,(size_t) (limit-buffer) ) )  \

#define if_section_start_make_pending(b) {*limit= '!'; \
for(loc= buffer;xisspace(*loc) ;loc++) ; \
*limit= ' '; \
if(*loc=='@'&&(xisspace(*(loc+1) ) ||*(loc+1) =='*') ) change_pending= b; \
} \

#define max_sections 2000 \
 \

#define too_long() {include_depth--; \
err_print(get_string(MSG_ERROR_CO22) ) ;goto restart;} \

#define max_bytes 90000 \

#define max_names 4000 \
 \

#define length(c) (size_t) ((c+1) ->byte_start-(c) ->byte_start) 
#define print_id(c) term_write((c) ->byte_start,length((c) ) )  \

#define alloc_object(object,size,type)  \
if(!(object= (type*) malloc((size) *sizeof(type) ) ) )  \
fatal("",get_string(MSG_FATAL_CO85) ) 
#define free_object(object)  \
if(object) free(object) ,object= NULL \

#define hash_size 353 \

#define llink link
#define rlink dummy.Rlink
#define root name_dir->rlink \
 \

#define first_chunk(p) ((p) ->byte_start+2) 
#define prefix_length(p) (int) ((unsigned char) *((p) ->byte_start) *256+ \
(unsigned char) *((p) ->byte_start+1) ) 
#define set_prefix_length(p,m) (*((p) ->byte_start) = (m) /256, \
*((p) ->byte_start+1) = (m) %256)  \

#define less 0
#define equal 1
#define greater 2
#define prefix 3
#define extension 4 \

#define bad_extension 5 \

#define spotless 0
#define harmless_message 1
#define error_message 2
#define fatal_message 3
#define mark_harmless {if(history==spotless) history= harmless_message;}
#define mark_error history= error_message \

#define RETURN_OK 0
#define RETURN_WARN 5
#define RETURN_ERROR 10
#define RETURN_FAIL 20 \

#define confusion(s) fatal(get_string(MSG_FATAL_CO66) ,s)  \
 \

#define show_banner flags['b']
#define show_progress flags['p']
#define show_stats flags['s']
#define show_happiness flags['h']
#define indent_param_decl flags['i']
#define order_decl_stmt flags['o'] \

#define update_terminal fflush(stdout)  \

#define new_line putchar('\n') 
#define putxchar putchar
#define term_write(a,b) fflush(stdout) ,fwrite(a,sizeof(char) ,b,stdout) 
#define C_printf(c,a) fprintf(C_file,c,a) 
#define C_putc(c) putc(c,C_file)  \

#define max_path_length (BUFSIZ-2)  \


#line 60 "common.w"

/*2:*/
#line 73 "common.w"

typedef short boolean;
boolean program;

/*:2*//*7:*/
#line 159 "common.w"

#line 44 "comm-p19.ch"
char*buffer;
char*buffer_end;
char*limit;
char*loc;
#line 164 "common.w"

/*:7*//*10:*/
#line 214 "common.w"

int include_depth;
#line 79 "comm-p19.ch"
FILE**file;
FILE*change_file;
char**file_name;
char*change_file_name;
char*alt_web_file_name;
int*line;
#line 223 "common.w"
int change_line;
int change_depth;
boolean input_has_ended;
boolean changing;
boolean web_file_open= 0;

/*:10*//*20:*/
#line 418 "common.w"

#line 192 "comm-p19.ch"
typedef unsigned char eight_bits;
typedef unsigned short sixteen_bits;
#line 420 "common.w"
sixteen_bits section_count;
#line 199 "comm-p19.ch"
boolean*changed_section;
#line 422 "common.w"
boolean change_pending;

boolean print_where= 0;

/*:20*//*27:*/
#line 588 "common.w"

typedef struct name_info{
char*byte_start;
/*31:*/
#line 625 "common.w"

struct name_info*link;

/*:31*//*40:*/
#line 724 "common.w"

union{
struct name_info*Rlink;

char Ilk;
}dummy;

/*:40*//*55:*/
#line 682 "comm-p19.ch"

void*equiv_or_xref;
#line 1058 "common.w"

/*:55*/
#line 591 "common.w"

}name_info;
typedef name_info*name_pointer;
#line 364 "comm-p19.ch"
char*byte_mem;
char*byte_mem_end;
name_pointer name_dir;
name_pointer name_dir_end;
#line 598 "common.w"

/*:27*//*29:*/
#line 611 "common.w"

name_pointer name_ptr;
char*byte_ptr;

#line 380 "comm-p19.ch"
/*:29*//*32:*/
#line 638 "common.w"

typedef name_pointer*hash_pointer;
#line 412 "comm-p19.ch"
hash_pointer hash;
hash_pointer hash_end;
#line 642 "common.w"
hash_pointer h;

/*:32*//*56:*/
#line 1076 "common.w"

int history= spotless;

/*:56*//*67:*/
#line 1214 "common.w"

int argc;
char**argv;
#line 837 "comm-p19.ch"
char*C_file_name;
char*tex_file_name;
char*idx_file_name;
char*scn_file_name;
char*check_file_name;
char*use_language;
#line 848 "comm-p19.ch"
boolean flags[256];
#line 1222 "common.w"

/*:67*//*77:*/
#line 1364 "common.w"

FILE*C_file;
FILE*tex_file;
FILE*idx_file;
#line 953 "comm-p19.ch"
FILE*scn_file;
FILE*check_file;
#line 1369 "common.w"
FILE*active_file;

#line 970 "comm-p19.ch"
/*:77*/
#line 61 "common.w"

/*3:*/
#line 83 "common.w"
int phase;

/*:3*//*11:*/
#line 240 "common.w"

#line 98 "comm-p19.ch"
char*change_buffer;
#line 242 "common.w"
char*change_limit;

/*:11*//*85:*/
#line 1085 "comm-p19.ch"

char*include_path;
char*p,*path_prefix,*next_path_prefix;

/*:85*/
#line 62 "common.w"

/*33:*/
#line 644 "common.w"

#line 419 "comm-p19.ch"
extern int names_match(name_pointer,char*,size_t,eight_bits);
#line 646 "common.w"

/*:33*//*38:*/
#line 697 "common.w"

#line 457 "comm-p19.ch"
extern void init_p(name_pointer,eight_bits);
#line 699 "common.w"

/*:38*//*46:*/
#line 846 "common.w"

#line 524 "comm-p19.ch"
extern void init_node(name_pointer);
#line 848 "common.w"

/*:46*//*53:*/
#line 1011 "common.w"

#line 647 "comm-p19.ch"
static int section_name_cmp(char**,int,name_pointer);
#line 1013 "common.w"

/*:53*//*57:*/
#line 1086 "common.w"

#line 689 "comm-p19.ch"
extern void err_print(char*);
#line 1088 "common.w"

/*:57*//*60:*/
#line 1134 "common.w"

#line 704 "comm-p19.ch"
extern int wrap_up(void);
extern void print_stats(void);
#line 1137 "common.w"

#line 715 "comm-p19.ch"
/*:60*//*63:*/
#line 1167 "common.w"

#line 779 "comm-p19.ch"
extern void fatal(char*,char*);
extern void overflow(char*);
#line 1169 "common.w"

/*:63*//*69:*/
#line 1245 "common.w"

#line 872 "comm-p19.ch"
static void scan_args(void);
#line 1247 "common.w"

/*:69*//*82:*/
#line 1020 "comm-p19.ch"

boolean get_line(void);
name_pointer add_section_name(name_pointer,int,char*,char*,int);
name_pointer id_lookup(char*,char*,char);
name_pointer section_lookup(char*,char*,int);
void check_complete(void);
void common_init(void);
void extend_section_name(name_pointer,char*,char*,int);
void print_prefix_name(name_pointer);
void print_section_name(name_pointer);
void reset_input(void);
void sprint_section_name(char*,name_pointer);

/*:82*//*83:*/
#line 1035 "comm-p19.ch"

static boolean set_path(char*,char*);
static int input_ln(FILE*);
static int web_strcmp(char*,int,char*,int);
static void check_change(void);
static void prime_the_change_buffer(void);
#line 1411 "common.w"

#line 1046 "comm-p19.ch"
/*:83*//*89:*/
#line 1121 "comm-p19.ch"

void catch_break(int);

/*:89*/
#line 63 "common.w"


/*:1*//*4:*/
#line 89 "common.w"

#line 25 "comm-p19.ch"
void common_init(void)
#line 92 "common.w"
{
#line 31 "comm-p19.ch"
/*87:*/
#line 1106 "comm-p19.ch"

if(signal(SIGINT,&catch_break)==SIG_ERR)
exit(EXIT_FAILURE);

/*:87*/
#line 31 "comm-p19.ch"
;
/*30:*/
#line 388 "comm-p19.ch"

alloc_object(buffer,long_buf_size,char);
buffer_end= buffer+buf_size-2;
limit= loc= buffer;
alloc_object(file,max_include_depth,FILE*);
alloc_object(file_name,max_include_depth,char*);
for(phase= 0;phase<max_include_depth;phase++)
alloc_object(file_name[phase],max_file_name_length,char);
alloc_object(change_file_name,max_file_name_length,char);
alloc_object(alt_web_file_name,max_file_name_length,char);
alloc_object(line,max_include_depth,int);
alloc_object(change_buffer,buf_size,char);
alloc_object(changed_section,max_sections,boolean);
alloc_object(byte_mem,max_bytes,char);
alloc_object(name_dir,max_names,name_info);
byte_mem_end= byte_mem+max_bytes-1;
name_dir_end= name_dir+max_names-1;
name_dir->byte_start= byte_ptr= byte_mem;
#line 617 "common.w"
name_ptr= name_dir+1;
name_ptr->byte_start= byte_mem;

/*:30*//*34:*/
#line 649 "common.w"

#line 425 "comm-p19.ch"
alloc_object(hash,hash_size,name_pointer);
hash_end= hash+hash_size-1;
for(h= hash;h<=hash_end;*h++= NULL);
alloc_object(check_file_name,max_file_name_length,char);
alloc_object(C_file_name,max_file_name_length,char);
alloc_object(tex_file_name,max_file_name_length,char);
alloc_object(idx_file_name,max_file_name_length,char);
alloc_object(scn_file_name,max_file_name_length,char);
#line 651 "common.w"

/*:34*//*41:*/
#line 731 "common.w"

root= NULL;

/*:41*//*86:*/
#line 1089 "comm-p19.ch"

alloc_object(include_path,max_path_length+2,char);
strcpy(include_path,"");

/*:86*/
#line 32 "comm-p19.ch"
;
#ifdef _AMIGA
/*91:*/
#line 1158 "comm-p19.ch"

if(LocaleBase= (struct Library*)OpenLibrary(
(unsigned char*)"locale.library",38L)){
if(catalog= OpenCatalog(NULL,"cweb.catalog",
OC_BuiltInLanguage,"english",TAG_DONE)){
for(i= MSG_ERROR_CO9;i<=MSG_STATS_CW248_6;++i)
AppStrings[i].as_Str= GetCatalogStr(catalog,i,AppStrings[i].as_Str);
}
}

/*:91*/
#line 34 "comm-p19.ch"
;
#endif
#line 94 "common.w"
/*68:*/
#line 855 "comm-p19.ch"

show_banner= show_happiness= show_progress= indent_param_decl= order_decl_stmt= 1;
use_language= "";
#line 1229 "common.w"

/*:68*/
#line 94 "common.w"
;
/*78:*/
#line 970 "comm-p19.ch"

scan_args();
if(program==ctangle){
strcpy(check_file_name,C_file_name);
if(check_file_name[0]!='\0'){
char*dot_pos= strrchr(check_file_name,'.');
if(dot_pos==NULL)strcat(check_file_name,".ttp");
else strcpy(dot_pos,".ttp");
}
if((C_file= fopen(check_file_name,"w"))==NULL)
fatal(get_string(MSG_FATAL_CO78),check_file_name);

}
else{
strcpy(check_file_name,tex_file_name);
if(check_file_name[0]!='\0'){
char*dot_pos= strrchr(check_file_name,'.');
if(dot_pos==NULL)strcat(check_file_name,".wtp");
else strcpy(dot_pos,".wtp");
}
if((tex_file= fopen(check_file_name,"w"))==NULL)
fatal(get_string(MSG_FATAL_CO78),check_file_name);
}
#line 1382 "common.w"

/*:78*/
#line 95 "common.w"
;
}

/*:4*//*9:*/
#line 172 "common.w"

#line 54 "comm-p19.ch"
static int input_ln(
FILE*fp)
#line 175 "common.w"
{
register int c= EOF;
register char*k;
if(feof(fp))return(0);
limit= k= buffer;
while(k<=buffer_end&&(c= getc(fp))!=EOF&&c!='\n')
if((*(k++)= c)!=' ')limit= k;
if(k> buffer_end)
if((c= getc(fp))!=EOF&&c!='\n'){
#line 61 "comm-p19.ch"
ungetc(c,fp);loc= buffer;err_print(get_string(MSG_ERROR_CO9));
#line 185 "common.w"

}
if(c==EOF&&limit==buffer)return(0);

return(1);
}

/*:9*//*12:*/
#line 251 "common.w"

#line 105 "comm-p19.ch"
static void prime_the_change_buffer(void)
#line 254 "common.w"
{
change_limit= change_buffer;
/*13:*/
#line 265 "common.w"

while(1){
change_line++;
if(!input_ln(change_file))return;
if(limit<buffer+2)continue;
if(buffer[0]!='@')continue;
if(xisupper(buffer[1]))buffer[1]= tolower(buffer[1]);
if(buffer[1]=='x')break;
if(buffer[1]=='y'||buffer[1]=='z'||buffer[1]=='i'){
loc= buffer+2;
#line 111 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO13));
#line 276 "common.w"

}
}

/*:13*/
#line 256 "common.w"
;
/*14:*/
#line 282 "common.w"

do{
change_line++;
if(!input_ln(change_file)){
#line 117 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO14));
#line 287 "common.w"

return;
}
}while(limit==buffer);

/*:14*/
#line 257 "common.w"
;
/*15:*/
#line 292 "common.w"

{
#line 124 "comm-p19.ch"
change_limit= change_buffer+(ptrdiff_t)(limit-buffer);
strncpy(change_buffer,buffer,(size_t)(limit-buffer+1));
#line 296 "common.w"
}

/*:15*/
#line 258 "common.w"
;
}

/*:12*//*16:*/
#line 320 "common.w"

#line 132 "comm-p19.ch"
static void check_change(void)

#line 323 "common.w"
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
#line 139 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO16_1));
#line 335 "common.w"

change_limit= change_buffer;changing= 0;
return;
}
if(limit> buffer+1&&buffer[0]=='@'){
if(xisupper(buffer[1]))buffer[1]= tolower(buffer[1]);
/*17:*/
#line 358 "common.w"

if(buffer[1]=='x'||buffer[1]=='z'){
#line 151 "comm-p19.ch"
loc= buffer+2;err_print(get_string(MSG_ERROR_CO17_1));
#line 361 "common.w"

}
else if(buffer[1]=='y'){
if(n> 0){
loc= buffer+2;
printf("\n! Hmm... %d ",n);
#line 157 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO17_2));
#line 368 "common.w"

}
change_depth= include_depth;
return;
}

/*:17*/
#line 342 "common.w"
;
}
/*15:*/
#line 292 "common.w"

{
#line 124 "comm-p19.ch"
change_limit= change_buffer+(ptrdiff_t)(limit-buffer);
strncpy(change_buffer,buffer,(size_t)(limit-buffer+1));
#line 296 "common.w"
}

/*:15*/
#line 344 "common.w"
;
changing= 0;cur_line++;
while(!input_ln(cur_file)){
if(include_depth==0){
#line 145 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO16_2));
#line 349 "common.w"

input_has_ended= 1;return;
}
include_depth--;cur_line++;
}
if(lines_dont_match)n++;
}
}

/*:16*//*18:*/
#line 378 "common.w"

#line 164 "comm-p19.ch"
void reset_input(void)
#line 381 "common.w"
{
limit= buffer;loc= buffer+1;buffer[0]= ' ';
#line 171 "comm-p19.ch"
include_depth= 0;cur_line= 0;change_line= 0;
/*19:*/
#line 393 "common.w"

if((web_file= fopen(web_file_name,"r"))==NULL){
strcpy(web_file_name,alt_web_file_name);
if((web_file= fopen(web_file_name,"r"))==NULL)
#line 178 "comm-p19.ch"
fatal(get_string(MSG_FATAL_CO19_1),web_file_name);
#line 398 "common.w"
}


web_file_open= 1;
#line 185 "comm-p19.ch"
if((change_file= fopen(change_file_name,"r"))==NULL)
fatal(get_string(MSG_FATAL_CO19_2),change_file_name);
#line 404 "common.w"

/*:19*/
#line 172 "comm-p19.ch"
;
#line 385 "common.w"
change_depth= include_depth;
changing= 1;prime_the_change_buffer();changing= !changing;
limit= buffer;loc= buffer+1;buffer[0]= ' ';input_has_ended= 0;
}

/*:18*//*21:*/
#line 426 "common.w"

#line 205 "comm-p19.ch"
boolean get_line(void)
#line 428 "common.w"
{
restart:
if(changing&&include_depth==change_depth)
/*25:*/
#line 531 "common.w"
{
change_line++;
if(!input_ln(change_file)){
#line 330 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO25_1));
#line 535 "common.w"

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
if(xisupper(buffer[1]))buffer[1]= tolower(buffer[1]);
if(buffer[1]=='x'||buffer[1]=='y'){
loc= buffer+2;
#line 336 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO25_2));
#line 551 "common.w"

}
else if(buffer[1]=='z'){
prime_the_change_buffer();changing= !changing;print_where= 1;
}
}
}
}

/*:25*/
#line 431 "common.w"
;
if(!changing||include_depth> change_depth){
/*24:*/
#line 514 "common.w"
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

/*:24*/
#line 433 "common.w"
;
if(changing&&include_depth==change_depth)goto restart;
}
loc= buffer;*limit= ' ';
if(*buffer=='@'&&(*(buffer+1)=='i'||*(buffer+1)=='I')){
loc= buffer+2;
while(loc<=limit&&(*loc==' '||*loc=='\t'||*loc=='"'))loc++;
if(loc>=limit){
#line 211 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO21_1));
#line 442 "common.w"

goto restart;
}
if(include_depth>=max_include_depth-1){
#line 217 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO21_2));
#line 447 "common.w"

goto restart;
}
include_depth++;
/*23:*/
#line 473 "common.w"
{
char temp_file_name[max_file_name_length];
char*cur_file_name_end= cur_file_name+max_file_name_length-1;
char*k= cur_file_name,*kk;
int l;

while(*loc!=' '&&*loc!='\t'&&*loc!='"'&&k<=cur_file_name_end)*k++= *loc++;
if(k> cur_file_name_end)too_long();

*k= '\0';
if((cur_file= fopen(cur_file_name,"r"))!=NULL){
cur_line= 0;print_where= 1;
goto restart;
}
#line 298 "comm-p19.ch"
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
#line 324 "comm-p19.ch"
include_depth--;err_print(get_string(MSG_ERROR_CO23));goto restart;
#line 512 "common.w"
}

/*:23*/
#line 451 "common.w"
;
}
return(!input_has_ended);
}

#line 232 "comm-p19.ch"
/*:21*//*26:*/
#line 563 "common.w"

#line 346 "comm-p19.ch"
void check_complete(void){
if(change_limit!=change_buffer){
strncpy(buffer,change_buffer,(size_t)(change_limit-change_buffer+1));
limit= buffer+(ptrdiff_t)(change_limit-change_buffer);
#line 569 "common.w"
changing= 1;change_depth= include_depth;loc= buffer;
#line 355 "comm-p19.ch"
err_print(get_string(MSG_ERROR_CO26));
#line 571 "common.w"

}
}

/*:26*//*35:*/
#line 654 "common.w"

#line 442 "comm-p19.ch"
name_pointer id_lookup(
char*first,
char*last,
char t)
#line 660 "common.w"
{
char*i= first;
int h;
int l;
name_pointer p;
if(last==NULL)for(last= first;*last!='\0';last++);
#line 451 "comm-p19.ch"
l= (int)(last-first);
#line 667 "common.w"
/*36:*/
#line 677 "common.w"

h= (unsigned char)*i;
while(++i<last)h= (h+h+(int)((unsigned char)*i))%hash_size;


/*:36*/
#line 667 "common.w"
;
/*37:*/
#line 685 "common.w"

p= hash[h];
while(p&&!names_match(p,first,l,t))p= p->link;
if(p==NULL){
p= name_ptr;
p->link= hash[h];hash[h]= p;
}

/*:37*/
#line 668 "common.w"
;
if(p==name_ptr)/*39:*/
#line 700 "common.w"
{
#line 464 "comm-p19.ch"
if(byte_ptr+l> byte_mem_end)overflow(get_string(MSG_OVERFLOW_CO39_1));
if(name_ptr>=name_dir_end)overflow(get_string(MSG_OVERFLOW_CO39_2));
#line 703 "common.w"
strncpy(byte_ptr,first,l);
(++name_ptr)->byte_start= byte_ptr+= l;
if(program==cweave)init_p(p,t);
}

/*:39*/
#line 669 "common.w"
;
return(p);
}

/*:35*//*42:*/
#line 758 "common.w"

#line 473 "comm-p19.ch"
void print_section_name(name_pointer p)
#line 762 "common.w"
{
char*ss,*s= first_chunk(p);
name_pointer q= p+1;
while(p!=name_dir){
ss= (p+1)->byte_start-1;
if(*ss==' '&&ss>=s){
#line 481 "comm-p19.ch"
term_write(s,(size_t)(ss-s));p= q->link;q= p;
}else{
term_write(s,(size_t)(ss+1-s));p= name_dir;q= NULL;
#line 771 "common.w"
}
s= p->byte_start;
}
if(q)term_write("...",3);
}

/*:42*//*43:*/
#line 777 "common.w"

#line 492 "comm-p19.ch"
void sprint_section_name(char*dest,name_pointer p)
#line 782 "common.w"
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
#line 498 "comm-p19.ch"
strncpy(dest,s,(size_t)(ss-s)),dest+= ss-s;
#line 793 "common.w"
s= p->byte_start;
}
*dest= '\0';
}

/*:43*//*44:*/
#line 798 "common.w"

#line 506 "comm-p19.ch"
void print_prefix_name(name_pointer p)
#line 802 "common.w"
{
char*s= first_chunk(p);
int l= prefix_length(p);
term_write(s,l);
if(s+l<(p+1)->byte_start)term_write("...",3);
}

/*:44*//*45:*/
#line 819 "common.w"

#line 514 "comm-p19.ch"
static int web_strcmp(
char*j,
int j_len,
char*k,
int k_len)
#line 823 "common.w"
{
char*j1= j+j_len,*k1= k+k_len;
while(k<k1&&j<j1&&*j==*k)k++,j++;
if(k==k1)if(j==j1)return equal;
else return extension;
else if(j==j1)return prefix;
else if(*j<*k)return less;
else return greater;
}

/*:45*//*47:*/
#line 849 "common.w"

#line 536 "comm-p19.ch"
name_pointer add_section_name(
name_pointer par,
int c,
char*first,
char*last,
int ispref)
#line 857 "common.w"
{
name_pointer p= name_ptr;
char*s= first_chunk(p);
#line 547 "comm-p19.ch"
int name_len= (int)(last-first)+ispref;
#line 554 "comm-p19.ch"
if(s+name_len> byte_mem_end)overflow(get_string(MSG_OVERFLOW_CO39_1));
if(name_ptr+1>=name_dir_end)overflow(get_string(MSG_OVERFLOW_CO39_2));
#line 863 "common.w"
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

/*:47*//*48:*/
#line 878 "common.w"

#line 566 "comm-p19.ch"
void extend_section_name(
name_pointer p,
char*first,
char*last,
int ispref)
#line 885 "common.w"
{
char*s;
name_pointer q= p+1;
#line 576 "comm-p19.ch"
int name_len= (int)(last-first)+ispref;
#line 582 "comm-p19.ch"
if(name_ptr>=name_dir_end)overflow(get_string(MSG_OVERFLOW_CO39_2));
#line 890 "common.w"
while(q->link!=name_dir)q= q->link;
q->link= name_ptr;
s= name_ptr->byte_start;
name_ptr->link= name_dir;
#line 588 "comm-p19.ch"
if(s+name_len> byte_mem_end)overflow(get_string(MSG_OVERFLOW_CO39_1));
#line 895 "common.w"
(++name_ptr)->byte_start= byte_ptr= s+name_len;
strncpy(s,first,name_len);
if(ispref)*(byte_ptr-1)= ' ';
}

/*:48*//*49:*/
#line 906 "common.w"

#line 597 "comm-p19.ch"
name_pointer section_lookup(
char*first,char*last,
int ispref)
#line 911 "common.w"
{
int c= 0;
name_pointer p= root;
name_pointer q= NULL;
name_pointer r= NULL;
name_pointer par= NULL;

#line 605 "comm-p19.ch"
int name_len= (int)(last-first)+1;
#line 919 "common.w"
/*50:*/
#line 930 "common.w"

while(p){
c= web_strcmp(first,name_len,first_chunk(p),prefix_length(p));
if(c==less||c==greater){
if(r==NULL)
par= p;
p= (c==less?p->llink:p->rlink);
}else{
if(r!=NULL){
#line 614 "comm-p19.ch"
printf(get_string(MSG_ERROR_CO50_1));

print_prefix_name(p);
printf(get_string(MSG_ERROR_CO50_2));
#line 943 "common.w"
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

/*:50*/
#line 920 "common.w"
;
/*51:*/
#line 955 "common.w"

if(r==NULL)
return add_section_name(par,c,first,last+1,ispref);

/*:51*/
#line 921 "common.w"
;
/*52:*/
#line 963 "common.w"

switch(section_name_cmp(&first,name_len,r)){

case prefix:
if(!ispref){
#line 623 "comm-p19.ch"
printf(get_string(MSG_ERROR_CO52_1));
#line 969 "common.w"

print_section_name(r);
err_print(">");
}
else if(name_len<prefix_length(r))set_prefix_length(r,name_len);

case equal:return r;
case extension:if(!ispref||first<=last)
extend_section_name(r,first,last+1,ispref);
return r;
case bad_extension:
#line 629 "comm-p19.ch"
printf(get_string(MSG_ERROR_CO52_2));
#line 981 "common.w"

print_section_name(r);
err_print(">");
return r;
default:
#line 638 "comm-p19.ch"
printf(get_string(MSG_ERROR_CO52_3));

print_prefix_name(r);
printf(get_string(MSG_ERROR_CO52_4));
#line 990 "common.w"
print_section_name(r);
err_print(">");
return r;
}

/*:52*/
#line 922 "common.w"
;
}

/*:49*//*54:*/
#line 1014 "common.w"

#line 656 "comm-p19.ch"
static int section_name_cmp(
char**pfirst,
int len,
name_pointer r)
#line 1019 "common.w"
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
#line 665 "comm-p19.ch"
*pfirst= first+(ptrdiff_t)(ss-s);
#line 1033 "common.w"
return extension;
}else return equal;
else return(q->byte_start==(q+1)->byte_start)?equal:prefix;
case extension:
if(!ispref)return bad_extension;
first+= ss-s;
#line 671 "comm-p19.ch"
if(q!=name_dir){len-= (int)(ss-s);s= q->byte_start;r= q;continue;}
#line 1040 "common.w"
*pfirst= first;return extension;
default:return c;
}
}
}

/*:54*//*58:*/
#line 1089 "common.w"

#line 697 "comm-p19.ch"
void err_print(char*s)
#line 1093 "common.w"
{
char*k,*l;
printf(*s=='!'?"\n%s":"%s",s);
if(web_file_open)/*59:*/
#line 1109 "common.w"

{if(changing&&include_depth==change_depth)
printf(". (l. %d of change file)\n",change_line);
else if(include_depth==0)printf(". (l. %d)\n",cur_line);
else printf(". (l. %d of include file %s)\n",cur_line,cur_file_name);
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

/*:59*/
#line 1096 "common.w"
;
update_terminal;mark_error;
}

/*:58*//*61:*/
#line 1144 "common.w"

#line 733 "comm-p19.ch"
int wrap_up(void){
#line 1146 "common.w"
putchar('\n');
if(show_stats)
print_stats();
#line 739 "comm-p19.ch"
/*62:*/
#line 1154 "common.w"

switch(history){
#line 766 "comm-p19.ch"
case spotless:
if(show_happiness)printf(get_string(MSG_HAPPINESS_CO62));break;
case harmless_message:
printf(get_string(MSG_WARNING_CO62));break;
case error_message:
printf(get_string(MSG_ERROR_CO62));break;
case fatal_message:
printf(get_string(MSG_FATAL_CO62));
#line 1162 "common.w"
}

/*:62*/
#line 739 "comm-p19.ch"
;
#ifdef _AMIGA
/*92:*/
#line 1172 "comm-p19.ch"

if(LocaleBase){
CloseCatalog(catalog);
CloseLibrary(LocaleBase);
}

/*:92*/
#line 741 "comm-p19.ch"
;
#endif
#line 749 "comm-p19.ch"
/*93:*/
#line 1181 "comm-p19.ch"

if(C_file)fclose(C_file);
if(tex_file)fclose(tex_file);
if(check_file)fclose(check_file);
if(check_file_name)
remove(check_file_name);

/*:93*/
#line 749 "comm-p19.ch"

switch(history){
case harmless_message:return(RETURN_WARN);break;
case error_message:return(RETURN_ERROR);break;
case fatal_message:return(RETURN_FAIL);break;
default:return(RETURN_OK);
}
#line 1152 "common.w"
}

/*:61*//*64:*/
#line 788 "comm-p19.ch"
void fatal(char*s,char*t)
#line 1176 "common.w"
{
if(*s)printf(s);
err_print(t);
history= fatal_message;exit(wrap_up());
}

/*:64*//*65:*/
#line 796 "comm-p19.ch"
void overflow(char*t)
#line 1187 "common.w"
{
#line 802 "comm-p19.ch"
printf(get_string(MSG_FATAL_CO65),t);fatal("","");
#line 1189 "common.w"
}


/*:65*//*70:*/
#line 1248 "common.w"

#line 879 "comm-p19.ch"
static void scan_args(void)
#line 1251 "common.w"
{
char*dot_pos;
char*name_pos;
register char*s;
boolean found_web= 0,found_change= 0,found_out= 0;

boolean flag_change;

while(--argc> 0){
if((**(++argv)=='-'||**argv=='+')&&*(*argv+1))/*74:*/
#line 1338 "common.w"

{
if(**argv=='-')flag_change= 0;
else flag_change= 1;
#line 913 "comm-p19.ch"
for(dot_pos= *argv+1;*dot_pos> '\0';dot_pos++)
if(*dot_pos=='l'){
use_language= ++dot_pos;
break;
}
else
flags[*dot_pos]= flag_change;
#line 1344 "common.w"
}

#line 935 "comm-p19.ch"
/*:74*/
#line 1260 "common.w"

else{
s= name_pos= *argv;dot_pos= NULL;
#line 889 "comm-p19.ch"
while(*s){
if(*s=='.')dot_pos= s++;
else if(*s==DIR_SEPARATOR||*s==DEVICE_SEPARATOR||*s=='/')
dot_pos= NULL,name_pos= ++s;
else s++;
}

#line 1268 "common.w"
if(!found_web)/*71:*/
#line 1286 "common.w"

{
if(s-*argv> max_file_name_length-5)
/*76:*/
#line 947 "comm-p19.ch"
fatal(get_string(MSG_FATAL_CO76),*argv);
#line 1359 "common.w"


/*:76*/
#line 1289 "common.w"
;
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

/*:71*/
#line 1269 "common.w"

else if(!found_change)/*72:*/
#line 1304 "common.w"

{
if(strcmp(*argv,"-")==0)found_change= -1;
else{
if(s-*argv> max_file_name_length-4)
/*76:*/
#line 947 "comm-p19.ch"
fatal(get_string(MSG_FATAL_CO76),*argv);
#line 1359 "common.w"


/*:76*/
#line 1309 "common.w"
;
if(dot_pos==NULL)
sprintf(change_file_name,"%s.ch",*argv);
else strcpy(change_file_name,*argv);
found_change= 1;
}
}

/*:72*/
#line 1270 "common.w"

else if(!found_out)/*73:*/
#line 1317 "common.w"

{
if(s-*argv> max_file_name_length-5)
/*76:*/
#line 947 "comm-p19.ch"
fatal(get_string(MSG_FATAL_CO76),*argv);
#line 1359 "common.w"


/*:76*/
#line 1320 "common.w"
;
if(dot_pos==NULL){
sprintf(tex_file_name,"%s.tex",*argv);
sprintf(idx_file_name,"%s.idx",*argv);
sprintf(scn_file_name,"%s.scn",*argv);
sprintf(C_file_name,"%s.c",*argv);
}else{
strcpy(tex_file_name,*argv);
strcpy(C_file_name,*argv);
if(flags['x']){
*dot_pos= 0;
sprintf(idx_file_name,"%s.idx",*argv);
sprintf(scn_file_name,"%s.scn",*argv);
}
}
found_out= 1;
}

/*:73*/
#line 1271 "common.w"

else/*75:*/
#line 935 "comm-p19.ch"

{
if(program==ctangle)
fatal(get_string(MSG_FATAL_CO75_2),"");
else fatal(get_string(MSG_FATAL_CO75_4),"");
}

#line 1357 "common.w"

#line 947 "comm-p19.ch"
/*:75*/
#line 1272 "common.w"
;
}
}
if(!found_web)/*75:*/
#line 935 "comm-p19.ch"

{
if(program==ctangle)
fatal(get_string(MSG_FATAL_CO75_2),"");
else fatal(get_string(MSG_FATAL_CO75_4),"");
}

#line 1357 "common.w"

#line 947 "comm-p19.ch"
/*:75*/
#line 1275 "common.w"
;
#line 901 "comm-p19.ch"
#ifdef _DEV_NULL
if(found_change<=0)strcpy(change_file_name,_DEV_NULL);
#else
if(found_change<=0)strcpy(change_file_name,"/dev/null");
#endif

#line 1277 "common.w"
}

/*:70*//*84:*/
#line 1055 "comm-p19.ch"

static boolean set_path(char*include_path,char*environment)
{
char*string;

alloc_object(string,max_path_length+2,char);

#ifdef CWEBINPUTS
strcpy(include_path,CWEBINPUTS);
#endif

if(environment){
if(strlen(environment)+strlen(include_path)>=max_path_length){
err_print("! Include path too long");
free_object(string);return(0);

}
else{
sprintf(string,"%s%c%s",environment,PATH_SEPARATOR,include_path);
strcpy(include_path,string);
}
}
free_object(string);return(1);
}

/*:84*//*88:*/
#line 1114 "comm-p19.ch"

void catch_break(int)
{
history= fatal_message;
exit(wrap_up());
}

/*:88*/
