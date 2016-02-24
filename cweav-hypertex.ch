diff --git a/texk/web2c/cwebdir/cweav-w2c.ch b/texk/web2c/cwebdir/cweav-w2c.ch
index 0fde9a7..6afabe5 100644
--- a/texk/web2c/cwebdir/cweav-w2c.ch
+++ b/texk/web2c/cwebdir/cweav-w2c.ch
@@ -75,6 +75,13 @@ char **av; /* argument values */
 int main (int ac, char **av)
 @z
 
+@x l.104 - add src_locs
+  make_xrefs=force_lines=make_pb=1; /* controlled by command-line options */
+@y
+  make_xrefs=force_lines=make_pb=1; /* controlled by command-line options */
+  src_locs=0; /* also controlled by a command-line option */
+@z
+
 @x l.107 - Add Web2C version to banner.
   if (show_banner) printf(banner); /* print a ``banner line'' */
 @y
@@ -488,6 +495,18 @@ static void
 finish_line (void) /* do this at the end of a line */
 @z
 
+Section 80.
+
+@x l.1370
+*out_ptr='c'; tex_printf("\\input cwebma");
+@y
+if (src_locs) {
+  *out_ptr='e'; tex_printf("\\input cwebmac\n\\srcloctru");
+} else {
+  *out_ptr='c'; tex_printf("\\input cwebma");
+}
+@z
+
 Section 81.
 
 @x l.1383
@@ -893,6 +912,58 @@ static void
 phase_two (void) {
 @z
 
+Section 208
+
+@x l.3997
+@ Sections beginning with the \.{CWEB} control sequence `\.{@@\ }' start in the
+output with the \TEX/ control sequence `\.{\\M}', followed by the section
+number. Similarly, `\.{@@*}' sections lead to the control sequence `\.{\\N}'.
+In this case there's an additional parameter, representing one plus the
+specified depth, immediately after the \.{\\N}.
+If the section has changed, we put \.{\\*} just after the section number.
+@y
+@ Sections beginning with the \.{CWEB} control sequence `\.{@@\ }' start in the
+output with the \TEX/ control sequence `\.{\\M}', followed by the section
+number. Similarly, `\.{@@*}' sections lead to the control sequence `\.{\\N}'.
+In this case there's an additional parameter, representing one plus the
+specified depth, immediately after the \.{\\N}.
+If the section has changed, we put \.{\\*} just after the section number.
+(The \TEX/ control sequences that start sections will interpret any initial
+text that's surrounded with square brackets as instruction to
+emit a source special, supported by some DVI previewers.)
+@d src_locs flags['l'] /* whether source specials be output */
+@d out_src_loc() if (src_locs) { char s[20+1+max_file_name_length];
+  sprintf(s,"[%d %s]",cur_line,basename(cur_file_name));out_str(s); }
+@z
+
+@x l.4005
+if (*(loc-1)!='*') out_str("\\M");
+@.\\M@>
+else {
+@y
+if (*(loc-1)!='*') {
+  out_str("\\M");
+  out_src_loc();
+@.\\M@>
+} else {
+@z
+
+@x l.4019
+  out_str("\\N");
+@y
+  out_str("\\N");
+  out_src_loc();
+@z
+
+@x l.4025
+out_str("{");out_section(section_count); out_str("}");
+@y
+out_str("{");out_section(section_count); out_str("}");
+
+@ @<Include...@>=
+#include <libgen.h> /* definition of basename */
+@z
+
 Section 212.
 
 @x l.4074
diff --git a/texk/web2c/cwebdir/cweb.1 b/texk/web2c/cwebdir/cweb.1
index ad41c42..27cfc9f 100644
--- a/texk/web2c/cwebdir/cweb.1
+++ b/texk/web2c/cwebdir/cweb.1
@@ -81,7 +81,7 @@ The
 option prints statistics about memory usage at the end of a run
 (assuming that the programs have been compiled with the -DSTAT switch).
 .PP
-There are three other options applicable to
+There are four other options applicable to
 .I cweave
 only:
 .B \-f
@@ -97,6 +97,9 @@ can be used by
 and similar programs.
 .B \-x
 means omit the index and table of contents.
+.B \+l
+means include source file name and line number references in the TeX
+file (useful with some DVI previewers).
 .
 .SH FILES
 .TP
diff --git a/texk/web2c/cwebdir/cwebmac.tex b/texk/web2c/cwebdir/cwebmac.tex
index d50987d..26d342e 100644
--- a/texk/web2c/cwebdir/cwebmac.tex
+++ b/texk/web2c/cwebdir/cwebmac.tex
@@ -309,9 +309,19 @@
 \let\K== % assignment operator
 %\let\K=\leftarrow % "honest" alternative to standard assignment operator
 % \L is Polish letter suppressed-L
-\outer\def\M#1{\MN{#1}\ifon\vfil\penalty-100\vfilneg % beginning of section
-  \vskip\intersecskip\startsection\ignorespaces}
-\outer\def\N#1#2#3.{% beginning of starred section
+\newif\ifsrcloc
+\srclocfalse % cweave will set this true if it's emitting source locations.
+\outer\def\M{\ifsrcloc \expandafter\MS \else \expandafter\MX \fi}
+\outer\def\N{\ifsrcloc \expandafter\NS \else \expandafter\NX \fi}
+\newtoks\srcloc
+\def\MS[#1]{\srcloc={#1}\MX}
+\def\NS[#1]{\srcloc={#1}\NX}
+\def\MX#1{\MN{#1}%
+  \ifon\vfil\penalty-100\vfilneg % beginning of section
+  \vskip\intersecskip%
+  \ifsrcloc\special{src:\the\srcloc}\fi
+  \startsection\ignorespaces}
+\def\NX#1#2#3.{% beginning of starred section
   \ifacro{\toksF={}\makeoutlinetoks#3\outlinedone\outlinedone}\fi
   \gdepth=#1\gtitle={#3}\MN{#2}%
   \ifon\ifnum#1<\secpagedepth \vfil\eject % force page break if depth is small
@@ -326,6 +336,7 @@
       \advancenumber{chunk\the\countB.\expnumber{curr\the\countB}}\fi\fi
   \ifpdf\special{pdf: outline #1 << /Title (\the\toksE) /Dest
     [ @thispage /FitH @ypos ] >>}\fi
+  \ifsrcloc\special{src:\the\srcloc}\fi
   \ifon\startsection{\bf#3.\quad}\ignorespaces}
 \def\MN#1{\par % common code for \M, \N
   {\xdef\secstar{#1}\let\*=\empty\xdef\secno{#1}}% remove \* from section name
diff --git a/texk/web2c/help.h b/texk/web2c/help.h
index 1d12856..a50cf06 100644
--- a/texk/web2c/help.h
+++ b/texk/web2c/help.h
@@ -80,6 +80,7 @@ const_string CWEAVEHELP[] = {
     "-x          omit indices and table of contents",
     "+e          enclose C material in \\PB{...}",
     "+s          print usage statistics",
+    "+l          include source locations in TeX file",
     "--help      display this help and exit",
     "--version   output version information and exit",
     NULL
