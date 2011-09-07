%
% CWEB $VER: cct.w 1.5 (09.06.2000)
%
% SYNOPSIS:
%    This CWEB file contains two programs!  The first program `cct' is a
%    simple tool for translating `text files' between various systems with
%    different `character code tables'.  The second program `cctsetup'
%    creates the necessary external translation files from internal string
%    representations described below.
%
% CREATION DATE: 09.07.1994
%
% AUTHOR:
%    Andreas Scherer
%    Rochusstraﬂe 22-24
%    52062 Aachen, Germany
%    <andreas.scherer@@pobox.com>
%
% COPYRIGHT: (c) 1994 Andreas Scherer
%
% Permission is granted to make and distribute verbatim copies of this
% document provided that the copyright notice and this permission notice
% are preserved on all copies.
%
% Permission is granted to copy and distribute modified versions of this
% document under the conditions for verbatim copying, provided that the
% entire resulting derived work is distributed under the terms of a
% permission notice identical to this one.
%
% CHANGES:
%    12.07.1994: Replace `fgetc' by `fread'.
%                Add code tables and translation strings.
%    13.07.1994: Add set up program and extended documentation.
%    14.07.1994: Numerous corrections.
%    27.07.1994: New option `-m' for plain TeX output.
%                This works for ECMA 94 only!!!
%    28.07.1994: Minor corrections.
%    24.08.1994: Portability bug fixed.
%    16.03.1995: Minor corrections.
%    09.06.2000: `main' returns int.
%
% macros for font tables
\def\Toct#1{\hbox{$^\circ$\kern-.1em\it#1\/\kern.05em}} % octal constant
\def\Thex#1{\hbox{$^{\scriptscriptstyle\#}$\tt#1}} % hexadecimal constant
\def\oddline#1{\cr
  \noalign{\nointerlineskip}
  \multispan{19}\hrulefill&
  \setbox0=\hbox{\lower 2.3pt\hbox{\Thex{#1x}}}\smash{\box0}\cr
  \noalign{\nointerlineskip}}
\def\evenline{\cr\noalign{\hrule}}
\def\chartstrut{\lower3.5pt\vbox to14pt{}}
\countdef\chartcount=255
\def\beginchart#1{$$%\postdisplaypenalty=-10000
  \global\chartcount=0 #1
  \halign to\hsize\bgroup
    \chartstrut##\tabskip0pt plus10pt&
    &\hfil##\hfil&\vrule##\cr
    \lower6.5pt\null
    &&&\Toct0&&\Toct1&&\Toct2&&\Toct3&&\Toct4&&\Toct5&&\Toct6&&\Toct7&\evenline}
\def\endchart{\raise11.5pt\null&&&\Thex 8&&\Thex 9&&\Thex A&&\Thex B&
  &\Thex C&&\Thex D&&\Thex E&&\Thex F&\cr\egroup$$}
\def\:{\setbox0=\hbox{\char\chartcount}%
  \ifdim\ht0>7.5pt\reposition
  \else\ifdim\dp0>2.5pt\reposition\fi\fi
  \box0\global\advance\chartcount by1 }
\def\reposition{\setbox0=\hbox{$\vcenter{\kern2pt\box0\kern2pt}$}}

\nocon

\def\fin{\par\vfill\eject
  \message{Section names:}
  \def\note##1##2.{\quad{\eightrm##1~##2.}}
  \def\Q{\note{Cited in section}}
  \def\Qs{\note{Cited in sections}}
  \def\U{\note{Used in section}}
  \def\Us{\note{Used in sections}}
  \def\I{\par\hangindent 2em}\let\*=*
  \readsections}

@* Character code translation.  It is a non-trivial task to transfer `text
files' from one computer system to another, because of the different code
tables in use.  For example, on the Amiga there is {\mc ECMA}~94, also known
as {\mc ISO}~Latin~1 or {\mc ISO}~8859-1\nobreak
{\catcode`^=7\input ecma94.sty
\beginchart{\global\chartcount='200\tenrm}%
&\Toct{20x}&& && && && && && && && &&\oddline8
&\Toct{21x}&& && && && && && && && &\evenline
&\Toct{22x}&& && && && && && && && &&\oddline9
&\Toct{23x}&& && && && && && && && &\evenline
&\Toct{24x}&& &&^^a1&& &&^^a3&& && && &&^^a7&&\oddline A
&\Toct{25x}&& &&^^a9&& && && && && && &\evenline
&\Toct{26x}&&^^b0&&^^b1&&^^b2&&^^b3&& &&^^b5&&^^b6&& &&\oddline B
&\Toct{27x}&& &&^^b9&& && && && && &&^^bf&\evenline
&\Toct{30x}&&^^c0&&^^c1&&^^c2&&^^c3&&^^c4&&^^c5&&^^c6&&^^c7&&\oddline C
&\Toct{31x}&&^^c8&&^^c9&&^^ca&&^^cb&&^^cc&&^^cd&&^^ce&&^^cf&\evenline
&\Toct{32x}&& &&^^d1&&^^d2&&^^d3&&^^d4&&^^d5&&^^d6&&^^d7&&\oddline D
&\Toct{33x}&&^^d8&&^^d9&&^^da&&^^db&&^^dc&&^^dd&& &&^^df&\evenline
&\Toct{34x}&&^^e0&&^^e1&&^^e2&&^^e3&&^^e4&&^^e5&&^^e6&&^^e7&&\oddline E
&\Toct{35x}&&^^e8&&^^e9&&^^ea&&^^eb&&^^ec&&^^ed&&^^ee&&^^ef&\evenline
&\Toct{36x}&& &&^^f1&&^^f2&&^^f3&&^^f4&&^^f5&&^^f6&&^^f7&&\oddline F
&\Toct{37x}&&^^f8&&^^f9&&^^fa&&^^fb&&^^fc&&^^fd&& &&^^ff&\evenline
\endchart\par}

\noindent{\mc MSDOS} nowadays has {\mc IBM}'s International
Codepage~850\nobreak
{\catcode`^=7\input pc850.sty
\beginchart{\global\chartcount='200\tenrm}%
&\Toct{20x}&&^^80&&^^81&&^^82&&^^83&&^^84&&^^85&&^^86&&^^87&&\oddline8
&\Toct{21x}&&^^88&&^^89&&^^8a&&^^8b&&^^8c&&^^8d&&^^8e&&^^8f&\evenline
&\Toct{22x}&&^^90&&^^91&&^^92&&^^93&&^^94&&^^95&&^^96&&^^97&&\oddline9
&\Toct{23x}&&^^98&&^^99&&^^9a&&^^9b&&^^9c&&^^9d&&^^9e&& &\evenline
&\Toct{24x}&&^^a0&&^^a1&&^^a2&&^^a3&&^^a4&&^^a5&& && &&\oddline A
&\Toct{25x}&&^^a8&& && && && &&^^ad&& && &\evenline
&\Toct{26x}&& && && && && &&^^b5&&^^b6&&^^b7&&\oddline B
&\Toct{27x}&&^^b8&& && && && && && && &\evenline
&\Toct{30x}&& && && && && && &&^^c6&&^^c7&&\oddline C
&\Toct{31x}&& && && && && && && && &\evenline
&\Toct{32x}&& && &&^^d2&&^^d3&&^^d4&& &&^^d6&&^^d7&&\oddline D
&\Toct{33x}&&^^d8&& && && && && &&^^de&& &\evenline
&\Toct{34x}&&^^e0&&^^e1&&^^e2&&^^e3&&^^e4&&^^e5&&^^e6&& &&\oddline E
&\Toct{35x}&& &&^^e9&&^^ea&&^^eb&&^^ec&&^^ed&& && &\evenline
&\Toct{36x}&& &&^^f1&& && &&^^f4&&^^f5&&^^f6&& &&\oddline F
&\Toct{37x}&&^^f8&& && &&^^fb&&^^fc&&^^fd&& && &\evenline
\endchart\par}

\noindent Macintosh users also know a 8-bit font\nobreak
{\catcode`^=7\input mac8.sty
\beginchart{\global\chartcount='200\tenrm}%
&\Toct{20x}&&^^80&&^^81&&^^82&&^^83&&^^84&&^^85&&^^86&&^^87&&\oddline8
&\Toct{21x}&&^^88&&^^89&&^^8a&&^^8b&&^^8c&&^^8d&&^^8e&&^^8f&\evenline
&\Toct{22x}&&^^90&&^^91&&^^92&&^^93&&^^94&&^^95&&^^96&&^^97&&\oddline9
&\Toct{23x}&&^^98&&^^99&&^^9a&&^^9b&&^^9c&&^^9d&&^^9e&&^^9f&\evenline
&\Toct{24x}&& &&^^a1&& &&^^a3&&^^a4&& &&^^a6&&^^a7&&\oddline A
&\Toct{25x}&& &&^^a9&& && && && &&^^ae&&^^af&\evenline
&\Toct{26x}&& &&^^b1&& && && &&^^b5&& && &&\oddline B
&\Toct{27x}&& && && && && && &&^^be&&^^bf&\evenline
&\Toct{30x}&&^^c0&&^^c1&& && && && && && &&\oddline C
&\Toct{31x}&& && && &&^^cb&&^^cc&&^^cd&& && &\evenline
&\Toct{32x}&& && && && && && &&^^d6&& &&\oddline D
&\Toct{33x}&&^^d8&&^^d9&& && && && && && &\evenline
&\Toct{34x}&& && && && && &&^^e5&&^^e6&&^^e7&&\oddline E
&\Toct{35x}&&^^e8&&^^e9&&^^ea&&^^eb&&^^ec&&^^ed&&^^ee&&^^ef&\evenline
&\Toct{36x}&& &&^^f1&&^^f2&&^^f3&&^^f4&& && && &&\oddline F
&\Toct{37x}&& && && && && && && && &\evenline
\endchart\par}

\noindent And on some \UNIX/ systems there is {\mc HP}~8\nobreak
{\catcode`^=7\input hp8.sty
\beginchart{\global\chartcount='200\tenrm}%
&\Toct{20x}&& && && && && && && && &&\oddline8
&\Toct{21x}&& && && && && && && && &\evenline
&\Toct{22x}&& && && && && && && && &&\oddline9
&\Toct{23x}&& && && && && && && && &\evenline
&\Toct{24x}&& &&^^a1&&^^a2&&^^a3&&^^a4&&^^a5&&^^a6&&^^a7&&\oddline A
&\Toct{25x}&& && && && && &&^^ad&&^^ae&&^^af&\evenline
&\Toct{26x}&& &&^^b1&&^^b2&&^^b3&&^^b4&&^^b5&&^^b6&&^^b7&&\oddline B
&\Toct{27x}&&^^b8&&^^b9&& &&^^bb&& &&^^bd&& && &\evenline
&\Toct{30x}&&^^c0&&^^c1&&^^c2&&^^c3&&^^c4&&^^c5&&^^c6&&^^c7&&\oddline C
&\Toct{31x}&&^^c8&&^^c9&&^^ca&&^^cb&&^^cc&&^^cd&&^^ce&&^^cf&\evenline
&\Toct{32x}&&^^d0&&^^d1&&^^d2&&^^d3&&^^d4&&^^d5&&^^d6&&^^d7&&\oddline D
&\Toct{33x}&&^^d8&&^^d9&&^^da&&^^db&&^^dc&&^^dd&&^^de&&^^df&\evenline
&\Toct{34x}&&^^e0&&^^e1&&^^e2&& && &&^^e5&&^^e6&&^^e7&&\oddline E
&\Toct{35x}&&^^e8&&^^e9&&^^ea&& && &&^^ed&&^^ee&&^^ef&\evenline
&\Toct{36x}&& && && &&^^f3&&^^f4&& && && &&\oddline F
&\Toct{37x}&& && && && && && &&^^fe&& &\evenline
\endchart\par}

All of these code tables are extensions to the {\mc ASCII} table\nobreak
{\beginchart{\global\chartcount='41\tentt
  \def\chartstrut{\lower4.3pt\vbox to13.6pt{}}}%
&\Toct{00x}&&NUL&&SOH&&STX&&ETX&&EOT&&ENQ&&ACK&&BEL&&\oddline0
&\Toct{01x}&&BS&&HT&&LF&&VT&&FF&&CR&&SO&&SI&\evenline
&\Toct{02x}&&DLE&&DC1&&DC2&&DC3&&DC4&&NAK&&SYN&&ETB&&\oddline1
&\Toct{03x}&&CAN&&EM&&SUB&&ESC&&FS&&GS&&RS&&US&\evenline
&\Toct{04x}&&SP&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\oddline2
&\Toct{05x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&\evenline
&\Toct{06x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\oddline3
&\Toct{07x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&\evenline
&\Toct{10x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\oddline4
&\Toct{11x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&\evenline
&\Toct{12x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\oddline5
&\Toct{13x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&\evenline
&\Toct{14x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\oddline6
&\Toct{15x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&\evenline
&\Toct{16x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&\oddline7
&\Toct{17x}&&\:&&\:&&\:&&\:&&\:&&\:&&\:&&DEL&\evenline
\endchart\par}

\noindent i.e., they provide additional symbols and characters with
codes from~128 to~255, while they agree in positions~0 to~127.  The
tables shown above represent the set of characters provided by the
\TEX/ macro files \.{ecma94.sty}, \.{hp8.sty}, \.{mac8.sty}, and
\.{pc850.sty} in the \.{macros} subdirectory of \.{CWEB}.  There may
(or may not) be additional characters in the empty `slots' of the font
tables.  Either there is no simple representation for these characters
in \TEX/nical form or they are not useful for programming, so they
were left out.

Most of the relevant characters appear in all of these code tables, so
switching between character representations is quite logical.  For example,
if we want to translate `\"a' from {\mc ECMA}~94 to Codepage~850,
we have to replace the character with code~|0344| by the character with
code~|0204|.

In the terms of what follows, character translation is done with the help
of replacement tables or strings which hold the new character code in byte
notation at the position of the old character code, counting from~0
upto~255, i.e., for the `\"a'-example, byte number~|0344| would have the
value~|0204| in |ecma_to_pc|.

@* The translation program.  The following program is a simple tool
for converting text files between various computers and operating
systems by means of external translation files.

@c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
@#
int main(int argc, char **argv)
   {
   @<Local variables of |main|@>@;
@#
   @<Initialize the local variables@>@;
   @<Scan the arguments from the command line@>@;
   @<Set up the translation tables for both directions@>@;
   @<Copy |in_file| to |out_file| according to |trans_file|@>@;
   @<The endgame@>@;
   }

@ There are three different files used in the process of code translation.
Input is read from |in_file| and output is written to |out_file|.
|trans_file| is a special file with exactly 512~characters in two
groups of 256~characters each, defining two translation tables at once.
See section |@<Character table representation@>| for details.

@d in_file file[0]
@d out_file file[1]
@d trans_file file[2]
@#
@d in_file_name file_name[0]
@d out_file_name file_name[1]
@d trans_file_name file_name[2]
@d prog_name file_name[3]

@<Local variables of |main|@>=
FILE *file[3];
char file_name[4][60];

@ To control the direction of translation, this program accepts two
command line options, indicated by a leading `\.-' sign.  If you set
`\.{-t}' anywhere in the command line, translation is done according to
the |to_code| table, i.e., the output is written by means of this table.
If you set `\.{-f}', all characters read from |in_file| are translated
according to the |from_code| table.  If no option is given, `cct' simply
copies the input file to the output file.  You shouldn't use `\.{-f}'
and `\.{-t}' simultaneously.

@d copy_from flags['f']
@d copy_to flags['t']

@<Local variables of |main|@>=
unsigned char uc,*cp,from_code[256],to_code[256],flags[256];
unsigned char found_trans,found_in,found_out;
int i;

@ There is yet another way to obtain full portability.  Replace every
character by its \TEX/nical equivalent, i.e., either the character itself,
or a ``control sequence.''  Thus any extended {\mc ASCII} file can be
reduced to the 7-bit representation.  In this example program we start with
{\mc ECMA}~94 again.  To activate the {\mc ASCII}-to-\TEX/
conversion, set the `\.{-m}'~option as the first~(!) argument on the
command line.  No external conversion file is needed, so only the names
of the input and the output files are required.

The ``translation table'' is an array of strings, which replace the
characters with codes between~128 and~255 inclusive.  Not all characters
are supported, just as in \.{ecma94.sty}.

@d copy_tex flags['m']

@<Local variables of |main|@>=
static char *ecma_to_tex[128] = {@|
   "\200","\201","\202","\203","\204","\205","\206","\207",@|
   "\210","\211","\212","\213","\214","\215","\216","\217",@|
   "\220","\221","\222","\223","\224","\225","\226","\227",@|
   "\230","\231","\232","\233","\234","\235","\236","\237",@|
   "\240","{!`}","\242","{\\it\\$}","\244","\245","\246","{\\S}",@|
   "\250","{\\copyright}","\252","\253","\254","\255","\256","\257",@|
   "$^\\circ$","$\\pm$","$^2$","$^3$","\264","$\\mu$","{\\P}","\267",@|
   "\270","$^1$","\272","\273","\274","\275","\276","{?`}",@|
   "\\`A","\\'A","\\^A","\\~A","\\\"A","{\\AA}","{\\AE}","\\c{C}",@|
   "\\`E","\\'E","\\^E","\\\"E","\\`I","\\'I","\\^I","\\\"I",@|
   "\320","\\~N","\\`O","\\'O","\\^O","\\~O","\\\"O","$\\times$",@|
   "{\\O}","\\`U","\\'U","\\^U","\\\"U","\\'Y","\336","{\\ss}",@|
   "\\`a","\\'a","\\^a","\\~a","\\\"a","{\\aa}","{\\ae}","\\c{c}",@|
   "\\`e","\\'e","\\^e","\\\"e","{\\`\\i}","{\\'\\i}","{\\^\\i}","{\\\"\\i}",@|
   "\360","\\~n","\\`o","\\'o","\\^o","\\~o","\\\"o","$\\div$",@|
   "{\\o}","\\`u","\\'u","\\^u","\\\"u","\\'y","\376","\\\"y"};

@ Either we use global variables, which are statically zeroed, or we must
do this ourselves.

@<Initialize the local variables@>=
   strcpy(prog_name,argv[0]);
   for(i=0; i<256; i++)
      flags[i]=0;
   found_trans=found_in=found_out=0;

@ @<Scan the arguments from the command line@>=
   while(--argc>0) {
      if(**(++argv)=='-')
         @<Handle flag argument@>@;
      else {
         if(!found_trans)
            @<Make |trans_file_name| and open |trans_file|@>@;
         else if(!found_in)
            @<Make |in_file_name| and open |in_file|@>@;
         else if(!found_out)
            @<Make |out_file_name| and open |out_file|@>@;
         }
      }
   if(!found_in || !found_out || !found_trans) {
      fprintf(stderr,"Usage: %s [options] trans_file in_file out_file\n"@|
         "\toptions are\n"@|
         "\t\t-t to translate to another codepage\n"@|
         "\t\t-f to translate from another codepage\n"@|
         "\t\t-m to translate to portable TeX code (no trans_file needed)\n",@|
         prog_name);
      return(EXIT_FAILURE);
      }

@ There is a flag value for each possible character code, although only
three of them have a sensible meaning.

@<Handle flag argument@>={
   for(cp=(unsigned char *)(*argv+1); *cp>'\0'; cp++)
      flags[*cp]=1;
   if(copy_tex)
      found_trans=1;
   }

@ There must be exactly three file names as command line arguments for this
program.  The first is the |trans_file| and the second is the |in_file|,
which are both opened for reading, the third is the |out_file|, which we
open for writing.

@<Make |trans_file_name| and open |trans_file|@>={
   strcpy(trans_file_name,*argv);
   if(trans_file=fopen(trans_file_name,"rb"))
      found_trans=1;
   }

@ @<Make |in_file_name| and open |in_file|@>={
   strcpy(in_file_name,*argv);
   if(in_file=fopen(in_file_name,"rb"))
      found_in=1;
   }

@ @<Make |out_file_name| and open |out_file|@>={
   strcpy(out_file_name,*argv);
   if(out_file=fopen(out_file_name,"wb"))
      found_out=1;
   }

@ After the files have been opened, the translation tables can be read
from |trans_file|.  Here we don't check for errors in |trans_file|.
Make sure that there are at least 512~characters to read.  The first
half of |trans_file| gives the translation rules for conversion ``from
the home system to the target system,'' i.e., for every character position
from~0 to~255 the numeric equivalent for the target system is given in form
of a byte value, the second half is the other way round, i.e., for every
character value from the foreign system the equivalent of the home system
is defined.  As soon as this is done, we close the translation file.

When translating from extended {\mc ASCII} to 7-bit \TEX/, the |trans_file|
is not used, so no access to this file will be done.

@<Set up the translation tables for both directions@>=
   if(!copy_tex) {
      fread(to_code,256,1,trans_file);
      fread(from_code,256,1,trans_file);

      fclose(trans_file);
      }

@ The code in this section actually translates |in_file| to |out_file|
according to the rules given in |trans_file|.  Here are two examples:

If you want to translate one of your {\mc ASCII} files for use on another
system, e.g., from Amiga to {\mc MSDOS}, use something like

\.{ct pc850.cct {\it$\langle$Amiga file$\rangle$}
-t {\it$\langle$MSDOS file$\rangle$}}

If you want to translate a file from another system to make it usable on
your own system, e.g., from {\mc MSDOS} to Amiga, use something like

\.{ct pc850.cct -f {\it$\langle$MSDOS file$\rangle$
$\langle$Amiga file$\rangle$}}

Note that in both cases \.{pc850.cct} is used as the |trans_file|, but
the direction of translation is determined by the appropriate option.  There
is no sense in setting both the `\.{-f}' and the `\.{-t}' option, the
results would get fouled up.

If you want to translate a file into a fully portable form, where every
``special'' character is replaced by a straightforward 7-bit \TEX/ macro,
use the command line

\.{ct -m {\it$\langle$Amiga file$\rangle$}
{\it$\langle$\TEX/ file$\rangle$}}

The \.{-m} option {\it must\/} be the first argument to \.{cct} in this case
to suppress access to the |trans_file|, which is not needed here.

@<Copy |in_file| to |out_file| according to |trans_file|@>=
   while((uc = (unsigned char)fgetc(in_file)) && !feof(in_file)) {
      if(copy_from) uc = from_code[uc];
      if(copy_to)
         fputc((int)to_code[uc],out_file);
      else if(copy_tex && uc>127)
         fprintf(out_file,"%s",ecma_to_tex[uc-128]);
      else
         fputc((int)uc,out_file);
      }

@ After our work is done we close the source and the target files and quit.

@<The endgame@>=
   fclose(in_file);
   fclose(out_file);
   return(EXIT_SUCCESS);

@* Setting up the translation tables.  We still have to deal with the
problem of creating appropriate translation files like \.{pc850.cct}.
This is a somewhat tedious task if done by hand, because of the many
possible `directions' between the systems.  The following program
initializes three external files \.{hp8.cct}, \.{mac8.cct}, and
\.{pc850.cct}.  These tables can be used for translation between
systems with {\mc ECMA}~94 and one of the target systems.

To begin with we represent the tables in the form of \CEE/ strings in octal
notation.  The to-and-fro directions are separated, but will be united in
the external files.  For every character code from~0 to~255 the equivalent
representation on the respective target system is given.  Obviously the
values~0 upto~127 are not translated, they come from the standard {\mc
ASCII}\null.  Non-present characters are replaced by a whitespace.

The first string converts the code table of {\mc ECMA}~94 into the code
table of {\mc HP}~8, as explained above.

@<Character table representation@>=
const unsigned char ecma_to_hp[] = @|
"\000\001\002\003\004\005\006\007\010\011\012\013\014\015\016\017"@|
"\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"@|
"\040\041\042\043\044\045\046\047\050\051\052\053\054\055\056\057"@|
"\060\061\062\063\064\065\066\067\070\071\072\073\074\075\076\077"@|
"\100\101\102\103\104\105\106\107\110\111\112\113\114\115\116\117"@|
"\120\121\122\123\124\125\126\127\130\131\132\133\134\135\136\137"@|
"\140\141\142\143\144\145\146\147\150\151\152\153\154\155\156\157"@|
"\160\161\162\163\164\165\166\167\170\171\172\173\174\175\176\177"@|
"\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040"@|
"\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040"@|
"\040\270\040\273\040\040\040\275\040\040\040\040\040\040\040\040"@|
"\263\376\040\040\040\363\364\040\040\040\040\040\040\040\040\271"@|
"\241\340\242\341\330\320\323\264\243\334\244\245\346\345\246\247"@|
"\040\266\350\347\337\351\332\040\322\255\355\256\333\261\040\336"@|
"\310\304\300\342\314\324\327\265\311\305\301\315\331\325\321\335"@|
"\040\267\312\306\302\352\316\040\326\313\307\303\317\262\040\357";

@ Its counterpart converts from {\mc HP}~8 back to {\mc ECMA}~94.

@<Character table representation@>=
const unsigned char hp_to_ecma[] = @|
"\000\001\002\003\004\005\006\007\010\011\012\013\014\015\016\017"@|
"\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"@|
"\040\041\042\043\044\045\046\047\050\051\052\053\054\055\056\057"@|
"\060\061\062\063\064\065\066\067\070\071\072\073\074\075\076\077"@|
"\100\101\102\103\104\105\106\107\110\111\112\113\114\115\116\117"@|
"\120\121\122\123\124\125\126\127\130\131\132\133\134\135\136\137"@|
"\140\141\142\143\144\145\146\147\150\151\152\153\154\155\156\157"@|
"\160\161\162\163\164\165\166\167\170\171\172\173\174\175\176\177"@|
"\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040"@|
"\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040"@|
"\040\300\302\310\312\313\316\317\040\040\040\040\040\331\333\243"@|
"\040\335\375\260\307\347\321\361\241\277\040\243\040\247\040\040"@|
"\342\352\364\373\341\351\363\372\340\350\362\371\344\353\366\374"@|
"\305\356\330\306\345\355\370\346\304\354\326\334\311\357\337\324"@|
"\301\303\343\040\040\315\314\323\322\325\365\040\040\332\040\377"@|
"\040\040\040\265\266\040\040\040\040\040\040\040\040\040\261\040";

@ This ``Macintosh 8-bit font'' comes from the article ``A typewriter font
for the Macintosh 8-bit font table'' by Yannis Haralambous, {\mc TUG}boat
13/4 (1992), and was not yet tested for real.

@<Character table representation@>=
const unsigned char ecma_to_mac[] = @|
"\000\001\002\003\004\005\006\007\010\011\012\013\014\015\016\017"@|
"\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"@|
"\040\041\042\043\044\045\046\047\050\051\052\053\054\055\056\057"@|
"\060\061\062\063\064\065\066\067\070\071\072\073\074\075\076\077"@|
"\100\101\102\103\104\105\106\107\110\111\112\113\114\115\116\117"@|
"\120\121\122\123\124\125\126\127\130\131\132\133\134\135\136\137"@|
"\140\141\142\143\144\145\146\147\150\151\152\153\154\155\156\157"@|
"\160\161\162\163\164\165\166\167\170\171\172\173\174\175\176\177"@|
"\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040"@|
"\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040"@|
"\040\301\040\243\040\040\040\244\040\251\040\040\040\040\040\040"@|
"\241\261\040\040\040\265\246\040\040\040\040\040\040\040\040\300"@|
"\313\307\345\314\200\201\256\202\351\203\346\350\355\352\353\354"@|
"\040\204\361\356\357\315\205\040\257\364\362\363\206\040\040\247"@|
"\210\207\211\213\212\214\276\215\217\216\220\221\223\222\224\225"@|
"\040\226\230\227\231\233\232\326\277\235\234\236\237\040\040\330";

@ @<Character table representation@>=
const unsigned char mac_to_ecma[] = @|
"\000\001\002\003\004\005\006\007\010\011\012\013\014\015\016\017"@|
"\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"@|
"\040\041\042\043\044\045\046\047\050\051\052\053\054\055\056\057"@|
"\060\061\062\063\064\065\066\067\070\071\072\073\074\075\076\077"@|
"\100\101\102\103\104\105\106\107\110\111\112\113\114\115\116\117"@|
"\120\121\122\123\124\125\126\127\130\131\132\133\134\135\136\137"@|
"\140\141\142\143\144\145\146\147\150\151\152\153\154\155\156\157"@|
"\160\161\162\163\164\165\166\167\170\171\172\173\174\175\176\177"@|
"\304\305\307\311\321\326\334\341\340\342\344\343\345\347\351\350"@|
"\352\353\355\354\356\357\361\363\362\364\366\365\372\371\373\374"@|
"\040\260\040\243\247\040\266\337\040\251\040\040\040\040\306\330"@|
"\040\261\040\040\040\265\040\040\040\040\040\040\040\040\346\370"@|
"\277\241\040\040\040\040\040\040\040\040\040\300\303\325\040\040"@|
"\040\040\040\040\040\040\367\040\377\040\040\040\040\040\040\040"@|
"\040\040\040\040\040\302\312\301\313\310\315\316\317\314\323\324"@|
"\040\322\332\333\331\040\040\040\040\040\040\040\040\040\040\040";

@ For use with {\mc OS/2}, {\mc MS}-Windows and {\mc MSDOS}, {\mc IBM}'s
``International Codepage~850'' represents a ``standard'' font encoding.
It is slightly different than the older ``CodePage~437''.

@<Character table representation@>=
const unsigned char ecma_to_pc[] = @|
"\000\001\002\003\004\005\006\007\010\011\012\013\014\015\016\017"@|
"\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"@|
"\040\041\042\043\044\045\046\047\050\051\052\053\054\055\056\057"@|
"\060\061\062\063\064\065\066\067\070\071\072\073\074\075\076\077"@|
"\100\101\102\103\104\105\106\107\110\111\112\113\114\115\116\117"@|
"\120\121\122\123\124\125\126\127\130\131\132\133\134\135\136\137"@|
"\140\141\142\143\144\145\146\147\150\151\152\153\154\155\156\157"@|
"\160\161\162\163\164\165\166\167\170\171\172\173\174\175\176\177"@|
"\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040"@|
"\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040\040"@|
"\040\255\040\234\040\040\040\365\040\270\040\040\040\040\040\040"@|
"\370\361\375\374\040\346\364\040\040\373\040\040\040\040\040\250"@|
"\267\265\266\307\216\217\222\200\324\220\322\323\336\326\327\330"@|
"\040\245\343\340\342\345\231\236\235\353\351\352\232\355\040\341"@|
"\205\240\203\306\204\206\221\207\212\202\210\211\215\241\214\213"@|
"\040\244\225\242\223\344\224\366\233\227\243\226\201\354\040\230";

@ @<Character table representation@>=
const unsigned char pc_to_ecma[] = @|
"\000\001\002\003\004\005\006\007\010\011\012\013\014\015\016\017"@|
"\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037"@|
"\040\041\042\043\044\045\046\047\050\051\052\053\054\055\056\057"@|
"\060\061\062\063\064\065\066\067\070\071\072\073\074\075\076\077"@|
"\100\101\102\103\104\105\106\107\110\111\112\113\114\115\116\117"@|
"\120\121\122\123\124\125\126\127\130\131\132\133\134\135\136\137"@|
"\140\141\142\143\144\145\146\147\150\151\152\153\154\155\156\157"@|
"\160\161\162\163\164\165\166\167\170\171\172\173\174\175\176\177"@|
"\307\374\351\342\344\340\345\347\352\353\350\357\356\354\304\305"@|
"\311\346\306\364\366\362\373\371\377\326\334\370\243\330\327\040"@|
"\341\355\363\372\361\321\040\040\277\040\040\040\040\241\040\040"@|
"\040\040\040\040\040\301\302\300\251\040\040\040\040\040\040\040"@|
"\040\040\040\040\040\040\343\303\040\040\040\040\040\040\040\040"@|
"\040\040\312\313\310\040\315\316\317\040\040\040\040\040\314\040"@|
"\323\337\324\322\365\325\265\040\040\332\333\331\375\040\040\040"@|
"\040\261\040\040\266\247\367\040\260\040\040\271\263\262\040\040";

@ With these tables installed, the setup program almost writes itself.

@(cctsetup.c@>=
#include <stdio.h>
#include <stdlib.h>
@#
@<Character table representation@>@;
@#
int main(void)
   {
   FILE *fp;

   @<Write \.{hp8.cct}@>@;
   @<Write \.{mac8.cct}@>@;
   @<Write \.{pc850.cct}@>@;
   return(EXIT_SUCCESS);
   }

@ @<Write \.{hp8.cct}@>=
if(fp=fopen("hp8.cct","wb")) {
   fwrite(ecma_to_hp,256,1,fp);
   fwrite(hp_to_ecma,256,1,fp);
   fclose(fp);
   }

@ @<Write \.{mac8.cct}@>=
if(fp=fopen("mac8.cct","wb")) {
   fwrite(ecma_to_mac,256,1,fp);
   fwrite(mac_to_ecma,256,1,fp);
   fclose(fp);
   }

@ @<Write \.{pc850.cct}@>=
if(fp=fopen("pc850.cct","wb")) {
   fwrite(ecma_to_pc,256,1,fp);
   fwrite(pc_to_ecma,256,1,fp);
   fclose(fp);
   }

@* Index.
