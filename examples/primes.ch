Dijkstra's and Knuth's "primes" programs calculate the first 1000 prime
numbers.  Now that's just greasy kids' stuff, so we want more...

@x l.24
\def\title{PRIMES (C Version 1.1)}
@y
\def\title{PRIMES (C Version 1.2)}
@z

@x l.28
  \centerline{(C Version 1.1)}
@y
  \centerline{(C Version 1.2)}
@z

@x l.46
Dijkstra's program prints a table of the first thousand prime numbers. We
@y
Dijkstra's program prints a table of the first thousand prime numbers, but
here we want significantly more, i.e., we calculate a table of the first
million prime numbers (this may take some time on slow machines!). We
@z

@x l.63
@<Program to print the first thousand prime numbers@>
@y
@<Program to print the first million prime numbers@>
@z

@x l.66
result of the program will be to produce a list of the first thousand prime
numbers, and this list will appear on the |stdout| file.
@y
result of the program will be to produce a list of the first million prime
numbers, and this list will appear in a (most certainly system dependent)
binary file.
@z

@x l.69
Since there is no input, we declare the value |MM==1000| as a compile-time
@y
Since there is no input, we declare the value |MM==1000000| as a compile-time
@z

@x l.79
@d MM    1000
@y
@d MM    1000000
@z

@x l.84
#include <stdio.h>
@y
#include <stdio.h>
#include <stdlib.h>
@h
@z

@x l.109
   @<Fill table |p| with the first |MM| prime numbers@>@;
   @<Print table |p|                                 @>@;
@y
   @<Allocate memory for tables |p| and |mult|       @>@;
   @<Fill table |p| with the first |MM| prime numbers@>@;
   @<Print table |p|                                 @>@;
   @<Free tables |p| and |mult|                      @>@;
@z

@x l.137
   int p[MM]; /* the first |MM| prime numbers, in increasing order */
@y
   long *p; /* the first |MM| prime numbers, in increasing order */
@z

@x l.146
Since |p| is simply an array of integers, there is little difficulty in
printing the output, except that we need to decide upon a suitable output
format. Let us print the table on separate pages, with |RR| rows and |CC|
columns per page, where every column is |WW| character positions wide. In
this case we shall choose |RR==50|, |CC==5|, and |WW==10|, so that
the first 1000~primes will appear on four pages. The program will not assume
that |MM| is an exact multiple of |RR@t${}\times{}$@>CC|.
@^output format@>
@^Differences between \PASCAL/ and \CEE/@>

@d RR 50 /* this many rows will be on each page in the output         */
@d CC  5 /* this many columns will be on each page in the output      */
@d WW 10 /* this many character positions will be used in each column */

@ In order to keep this program reasonably free of notations that are
uniquely \CEE/esque, \[and in order to illustrate more of the facilities of
\.{CWEB},\] a few macro definitions for low-level output instructions are
introduced here. All of the output-oriented commands in the remainder of
the program will be stated in terms of five simple primitives called
|print_string|, |print_integer|, |print_entry|, |new_line|, and |new_page|.

\[Sections of a \.{CWEB} program are allowed to contain {\it macro
definitions} between the opening comments and the closing program text. The
general format for each section is actually tripartite: commentary, then
definitions, then program. Any of the three parts may be absent; for
example, the present section contains no program text.\]

\[Simple macros simply substitute a bit of \CEE/ code for an identifier.
Parametric macros are similar, but they also substitute an argument
wherever `A' occurs in the macro definition. (You may \#|define| macros with
more than just one parameter in \CEE/.) The first three macro definitions
here are parametric; the other two are simple. (I am using |fputs| in order
to get rid of the surplus `new line' character inserted by |puts|, and I am
using |putc| instead of |putchar| for consistency in notation.)\]
@^Differences between \PASCAL/ and \CEE/@>

@d print_string(A)
   fputs(A,stdout) /* put a given string into the |stdout| file */
@d print_integer(A)
   printf("%d",A) /* put a given integer into the |stdout| file, in decimal
   notation, using only as many digit positions as necessary */
@d print_entry(A)
   printf("%*d",WW,A) /* like |print_integer|, but |WW| character positions
   are filled, inserting blanks at the left */
@d new_line putc('\n',stdout); fflush(stdout)
   /* advance to a new line in the |stdout| file */
@d new_page putc('\f',stdout); fflush(stdout)
   /* advance to a new page in the |stdout| file */

@ Several variables are needed to govern the output process. When we begin
to print a new page, the variable |page_number| will be the ordinal number
of that page, and |page_offset| will be such that |p[page_offset-1]| is the
first prime to be printed. Similarly, |p[row_offset-1]| will be the first
prime in a given row.

\[Notice the notation `$\mathrel+\E$' below; this indicates that the present
section has the same name as a previous section, so the program text will
be appended to some text that was previously specified.\]

@<Variables of the program@>=
   int page_number;
      /* one more than the number of pages printed so far */
   int page_offset;
      /* index into |p| for the first entry on the current page */
   int row_offset;
      /* index into |p| for the first entry in the current row */
   int c;
      /* runs through the columns in a row (|0@t${}\ldots{}$@>CC|) */

@ Now that appropriate auxiliary variables have been introduced, the
process of outputting table |p| almost writes itself.

@<Print table |p|@>={
   page_number = page_offset = 1;
   while(page_offset <= MM) {
      @<Output a page of answers@>@;
      page_number++;
      page_offset += RR*CC;
      }
   }

@ A simple heading is printed at the top of each page.
@^output format@>
@^page headings@>
@<Output a page of answers@>={
   print_string("The First ");@+               print_integer(MM);
   print_string(" Prime Numbers --- Page ");@+ print_integer(page_number);
   new_line;@+ new_line; /* there's a blank line after the heading */
   for(row_offset = page_offset; row_offset <= page_offset + RR - 1;
      row_offset++)
      @<Output a line of answers@>@;
   new_page;
   }

@ The first row will contain
$$
  p[1-1],\thinspace p[1+\.{RR}-1],\thinspace
  p[1+2\cdot\.{RR}-1],\thinspace \ldots;
$$
a similar pattern holds for each value of the |row_offset|.

@<Output a line of answers@>={
   for(c=0; c<=CC-1; c++) {
      if(row_offset+c*RR <= MM)
         print_entry(p[row_offset + c*RR -1]);
      }
   new_line;
   }
@y
One million integers in text format accumulate to a great mass of paper if
we used the original output format (4000~pages!), so here we do something
very simple (breaking every unwritten law of \CEE/ programming in doing so): 
we write the binary representation of |p| to a file that can be processed
later by suitable tools.  Our first intension in this patch is to ``do the
calculations and save the results.''  Unfortunately, the resulting binary
file is heavily dependent on the hardware ``primes'' is running on, so
don't expect the contents of {\tt primes.out} to be portable in any sense.

@ We don't need a lot of variables to create the output, a |FILE| pointer
will suffice.  In a quiet hour, an analyzing tool can then implement
whatever ``real'' output format is suitable, either displaying all primes
or just picking at some of them.  A very simple program for the latter
approach is included right before the index of this source.

@<Variables of the program@>=
   FILE *fp;

@ The process of outputting table |p| is a trivial pursuit, although I'm
absolutely sure this will crash some compilers.  So, what!

@<Print table |p|@>=
   if(fp=fopen("primes.out","wb")) {
      fwrite(p,sizeof(long),MM,fp);
      fclose(fp);
      }
@z

@x l.266
   while(k < MM) {
      @<Increase |j| until it is the next prime number@>@;
      k++;@+ p[k-1] = j;
      }
@y
   while(k < MM) {
      @<Increase |j| until it is the next prime number@>@;
      k++;@+ p[k-1] = j;
      if(k%1000==0) {
         putchar('.'); /* Give some progress indication and
            also a chance to |break| */
         fflush(stdout);
         }
      }
   putchar('\n'); fflush(stdout);
@z

@x l.275
   int j; /* all primes ${}\leq j$ are in table |p|                    */
   int k; /* this many primes are in table |p| (|0@t${}\ldots{}$@>MM|) */
@y
   long j; /* all primes ${}\leq j$ are in table |p|                    */
   long k; /* this many primes are in table |p| (|0@t${}\ldots{}$@>MM|) */
@z

@x l.340
   int ord; /* the smallest index ${}\geq2$ such that $p^2_{ord}>j$ */
   int square; /* |square|${}=p^2_{ord}$ */
@y
   long ord; /* the smallest index ${}\geq2$ such that $p^2_{ord}>j$ */
   long square; /* |square|${}=p^2_{ord}$ */
@z

@x l.348
exceeds 30 when |MM==1000|.

@d ORD_MAX 30 /* $p^2_{ord\_max}$ must exceed $p_M$ */
@y
exceeds 3000 when |MM==1000000|.

@d ORD_MAX 3000 /* $p^2_{ord\_max}$ must exceed $p_M$ */
@z

@x l.391
   int n; /* runs from 2 to |ord| when testing divisibility */
@y
   long n; /* runs from 2 to |ord| when testing divisibility */
@z

@x l.413
   int mult[ORD_MAX]; /* runs through multiples of primes */
@y
   long *mult; /* runs through multiples of primes */
@z

@x l.437
@* For further reading. Here is a very short list of literature that has
@y
@* Memory allocation.  When using the standard form of this program with
very high values of |MM|, e.g., |1000000|, all internal memory is loaded
on the stack and this amounts to more than 4~MB of {\mc RAM}.  To avoid
system crashes due to stack overflow, the two internal arrays are
allocated dynamically at run-time.  If your compiler can't handle
this much of memory in one block, change the system.

@s type long

@d allocate_memory(object,size,type)
   if(!(object=(type *)malloc((size)*sizeof(type))))
      exit(EXIT_FAILURE);

@<Alloc...@>=
   allocate_memory(p,MM,long);
   allocate_memory(mult,ORD_MAX,long);

@ After the calculations are done and the output is written the memory is
freed in reverse order.  This isn't really necessary, but it's nicer.

@d free_memory(object)
   if(object)
      free(object);

@<Free...@>=
   free_memory(mult);
   free_memory(p);

@* Analyzing the results.  Here is a very simple tool to read {\tt
primes.out} and pick at certain prime numbers on user's request.  Again I
have to warn about possible problems with brain-dead compilers.  This code
works for me, but I expect there will be problems on other systems.

@(primereader.c@>=
#include <stdio.h>
#include <stdlib.h>
@h

int main(void)
   {
   FILE *fp;
   long *p,i;

   if((fp=fopen("primes.out","rb")) && (p=(long *)malloc(MM*sizeof(long)))) {
      fread(p,sizeof(long),MM,fp);
      fclose(fp);
      @<Choose primes at random@>@;
      free(p);
      }
   }

@ @<Choose primes at random@>=
   while(1) {
      do {
         fputs("Gimme a number: ",stdout); fflush(stdout);
         scanf("%ld",&i); if(i==0L) exit(0); /* Jump out */
         } while((1L>i)||(i>MM)); /* |i| must be a legal index value */
      switch(i) {
      case 1:
         fputs("The first ",stdout); break;
      case 2:
         fputs("The second ",stdout); break;
      case 3:
         fputs("The third ",stdout); break;
      default:
         printf("The %dth ",i);
         }
      printf("prime number is %d.\n\n",p[i-1]);
      }

@* For further reading. Here is a very short list of literature that has
@z
