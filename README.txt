							-*-Text-*-
%%% LEGALESE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This file is part of CWEBbin (Version 3.64c [2018]).
% (Set TAB to 8 spaces to get the spacing right.)
% The CWEB programs by Silvio Levy are based on programs by D. E. Knuth.
% They are distributed WITHOUT ANY WARRANTY, express or implied.

% This README file was last updated February 19, 2017 by Andreas Scherer.

% The following copyright notices extend to the respective parts of the
% changed or added source code introduced in this patch only, not to the
% original CWEB distribution, which is copyright (C) 1987,1990,1993,1998
% by Silvio Levy and Donald E. Knuth.
%
% Copyright (C) 1991-1993 Hans-Hermann Bode
% Copyright (C) 1992 Klaus Guntermann
% Copyright (C) 1991,1993 Carsten Steger
% Copyright (C) 1993-2000,2005,2011,2017 Andreas Scherer

% Permission is granted to make and distribute verbatim copies of this
% document provided that the copyright notice and this permission notice
% are preserved on all copies.

% Permission is granted to copy and distribute modified versions of this
% document under the conditions for verbatim copying, provided that the
% entire resulting derived work is given a different name and distributed
% under the terms of a permission notice identical to this one.

% Please send comments, suggestions, etc., concerning the original CWEB
% implementation to tex-k@tug.org.

% Please send comments, suggestions, etc., related to changes specific
% for this modified distribution CWEBbin, especially language catalog
% translations to https://ascherer.github.io, or write an issue or pull
% request in https://github.com/ascherer/cwebbin.

%%% WHAT IS THIS STUFF? %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CWEBbin is the ANSI-C/C++ implementation of Silvio Levy's and Donald Ervin
Knuth's CWEB system, compiled and provided with changefiles for ANSI-C and
makefiles for Borland C/C++ 3.1 (no longer actively supported), MS/VC++ 4.1
(no longer actively supported) and 6.0, SAS/C++ 6.57 (no longer actively
supported), and most of all UNIX-cc/g++ (currently 4.4.3).  Additional features
differing from the original distribution are described further below.
General information is provided in the original README file shipped with the
CWEB distribution.

CWEBbin started from the Amiga port of CWEB 2.8 by Carsten Steger.  Then it
was merged with the CWEB-PC 3.0 distribution by Hans-Hermann Bode and Klaus
Guntermann, and the Amiga port of CWEB 3.1 by Tomas Charles Willis.  Of
course, it includes all features of the original UNIX implementation and all
enhancements of these Amiga and MS/DOS/Windows ports.

The distribution of CWEBbin consists of the additional files for this patch
only.  The complete contents of the original distribution is a prerequisite.
CWEB can be retrieved via anonymous ftp from

	FTP: ftp://ftp.cs.stanford.edu/pub/cweb
	CTAN: https://ctan.org/pkg/cweb

To apply this patched version of CWEB, extract the patch archive (yielding a
new subdirectory) and add the original distribution.  Care has been taken to
avoid collisions with any files from the original distribution and the
Makefiles provide a target to cleanly remove the patch leaving only the files
of the original distribution (and vice versa).

Intermediate files with extensions .tex and .cxx are reproducable from the
general sources by means of an executable ctangle, cweave, and an ANSI-C/C++
compiler.  In addition you need Klaus Guntermann's TIE processor, which is
available at

	CTAN: https://ctan.org/pkg/tie

TIE should be available on all systems with a recent TeX installation.

%%% TABLE OF CONTENTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The following files were added to this distribution by various contributors:

GENERAL CONTRIBUTION:

./comm-ansi.ch			change file for common.w
./comm-ansi.hch			change file for common.h
./comm-extensions.ch		change file for common.w
./comm-extensions.hch		change file for common.h
./comm-memory.ch		change file for common.w
./comm-memory.hch		change file for common.h
./comm-newpage.ch		change file for common.w
./comm-output.ch		change file for common.w
./comm-output.hch		change file for common.h
./comm-patch.ch			change file for common.w
./comm-translation.ch		change file for common.w
./comm-translation.hch		change file for common.h
./common.cxx			ctangled product of common.w and the above
./ctang-ansi.ch			change file for ctangle.w
./ctang-memory.ch		change file for ctangle.w
./ctang-newpage.ch		change file for ctangle.w
./ctang-output.ch		change file for ctangle.w
./ctang-patch.ch		change file for ctangle.w
./ctang-translation.ch		change file for ctangle.w
./ctangle.cxx			ctangled product of ctangle.w and the above
./cweav-ansi.ch			change file for cweave.w
./cweav-extensions.ch		change file for cweave.w
./cweav-memory.ch		change file for cweave.w
./cweav-newpage.ch		change file for cweave.w
./cweav-output.ch		change file for cweave.w
./cweav-patch.ch		change file for cweave.w
./cweav-translation.ch		change file for cweave.w
./cwebman.ch			change file for cwebman.tex
./README.txt			the current file
./wmerg-ansi.ch			change file for wmerge.w
./wmerg-extensions.ch		change file for wmerge.w
./wmerg-memory.ch		change file for wmerge.w
./wmerg-output.ch		change file for wmerge.w
./wmerg-patch.ch		change file for wmerge.w
./catalogs/dcweb.h		header file with the German strings
./catalogs/ecweb.h		header file with the English default strings
./catalogs/icweb.h		header file with the Italian strings
./cwebinputs/amiga_types.w	AMIGA specific keywords by Commodore and SAS
./cwebinputs/ecma94.w		Transliteration table for Latin-1
./cwebinputs/hp8.w		Transliteration table for HP Roman 8
./cwebinputs/mac8.w		Transliteration table for Macintosh 8-bit font
./cwebinputs/pc850.w		Transliteration table for Codepage 850
./examples/cct.w		program to translate between character tables
./examples/commonwords.w	program to count word frequencies in text files
./examples/extex-ansi.ch	change file for extex.w
./examples/matrix.w		C++ program to invert complex 4x4 matrices
./examples/primes.ch		changes for the first 1000000 prime numbers
./examples/primes.w     	program to print the first 1000 prime numbers
./examples/README.p11		extended description for the new examples
./examples/sample.w     	program to produce random numbers
./examples/treeprint-ansi.ch	change file for treeprint.w
./examples/wc-ansi.ch		change file for wc.w
./texinputs/Xcwebmac.tex	beautifications for cwebmac.tex
./texinputs/dcwebmac.tex	German captions in addition to cwebmac.tex
./texinputs/ecma94.sty		Umlauts and special characters for Latin-1
./texinputs/fcwebmac.tex	French captions in addition to cwebmac.tex
./texinputs/hp8.sty		Umlauts and special characters for HP Roman 8
./texinputs/icwebmac.tex	Italian captions in addition to cwebmac.tex
./texinputs/mac8.sty		Umlauts and special characters for Macintosh
./texinputs/pc850.sty		Umlauts and special characters for IBM 850

SPECIAL FOR USERS OF CC, C89, GCC OR OTHER ANSI C AND C++ COMPILERS FOR UNIX
BY KLAUS GUNTERMANN MODIFIED BY ANDREAS SCHERER ACCORDING TO THE ORIGINAL
MAKEFILE FROM THE CWEB DISTRIBUTION:

./Makefile.unix		makefile for cc, c89, gcc, ... on several machines

SPECIALS FOR USERS OF THE AMIGA AND SAS/C++ 6.5 BY ANDREAS SCHERER:
(NO LONGER ACTIVELY SUPPORTED!)

./Makefile.sas			makefile for SAS/C compiler 6.0 and up
./comm-arexx.ch			change file for common.w
./comm-arexx.hch		change file for common.h
./arexx/compile.ced		ARexx script to start SAS/C 6.x from CED (V3.5+)
./arexx/start_web.ced		ARexx script to start cweave/ctangle from CED
./arexx/catalogs/cweb_arexx.cd   catalog description for German defaults
./arexx/catalogs/cweb_arexx.e.ct catalog translation for English users
./arexx/catalogs/cweb_arexx.f.ct catalog translation for French users
./arexx/catalogs/cweb_arexx.i.ct catalog translation for Italian users
./arexx/catalogs/english/cweb_arexx.catalog  message catalog for English users
./arexx/catalogs/francais/cweb_arexx.catalog message catalog for French users
				(for compatibility reasons, the cedilla was
				replaced with an ordinary `c'.  when you use
				this on the AMIGA you have to rename it again.)
./arexx/catalogs/italiano/cweb_arexx.catalog message catalog for Italian users
./catalogs/cweb.cd		catalog description for English defaults
./catalogs/cweb.d.ct		catalog translation for German users
./catalogs/cweb.i.ct		catalog translation for Italian users
./examples/Makefile.sas		makefile for SAS/C compiler 6.0 and up

SPECIALS FOR USERS OF MS/DOS/WINDOWS AND BORLAND C++ 3.1 BY HANS-HERMANN BODE
WITH MODIFICATIONS BY ANDREAS SCHERER: (NO LONGER ACTIVELY SUPPORTED!)

./Makefile.bcc		makefile for Borland C/C++
./comm-borlandc.ch	change file for common.w
./comm-borlandc.hch	change file for common.h
./ctang-borlandc.ch	change file for ctangle.w
./cweav-borlandc.ch	change file for cweave.w
./wmerg-borlandc.ch	change file for wmerge.w

SPECIALS FOR USERS OF MS/WINDOWS AND MICROSOFT VISUAL C++ 6.0 BY ANDREAS
SCHERER: (NO LONGER ACTIVELY SUPPORTED!)

./ctangle.dsp		Developer Studio Project for CTANGLE
./cweave.dsp		Developer Studio Project for CWEAVE
./wmerge.dsp		Developer Studio Project for WMERGE
./cwebbin.dsw		Developer Studio Workspace for all three

%%% HOW TO CREATE THE BINARIES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[UNIX/Linux, GCC] The current setup of CWEBbin has been created on a Linux PC
	running GNU/Linux including the gcc/g++ compiler and the TeXLive system.
	Any similar setup should also work.  All set?
	-- Then proceed as follows:

	1. Check the entries in Makefile.unix for local conditions like a
	different compiler name or additional compiler options you want to
	use.  Check also the other lines in Makefile.unix so that all
	directory definitions are set properly for your local system
	configuration.

	2. If you want to create the ctangle and cweave binaries for a
	different language than English, set a link from one of the
	`[dei]cweb.h' header files to `cweb.h' in the ./catalogs directory.

	3. Touch common.cxx and ctangle.cxx to make them up-to-date.  Then say
	`make -f Makefile.unix boot'; this will create a local ctangle binary
	simply by compiling the distributed .cxx files.

	4. To make ctangle, cweave, and the wmerge processor say `make -f
	Makefile.unix [all]'.  To get some reassurance that things are OK, you
	can say `make cautiously', which ensures that ctangle will reproduce
	itself.  (Otherwise the source files common.w and ctangle.w won't
	actually have been used.)

	5. After all is set, you should become `superuser' and run `make -f
	Makefile.unix install'; this will install the binaries, the TeX macros
	and CWEB @include files, and some documentation in places specified in
	Makefile.unix.

	6. If you want a full documentation of the tangle and weave programs,
	type `make -f Makefile.unix docs' or preferably `make -f Makefile.unix
	fullmanual'.  The documentation created will include all changes
	introduced by the .ch files.

	7. To delete all intermediate files created in the make processes say
	`make -f Makefile.unix clean'.

	8. To remove the complete patch from the installed CWEB system, say
	`make -f Makefile.unix remove'.  You will be left with the original
	CWEB system.

	9. To remove the complete base system leaving only the patch behind,
	you can say `make -f Makefile.unix remove-orig'.

	10. The other labels have not been tested seriously. :-)

[AMIGA, SAS/C++ 6] I can no longer support this compiler and computer system
	and most likely it's impossible to install CWEBbin with SAS/C++.  The
	source files common.cxx, common.h, and ctangle.cxx can definitely NOT
	be used with SAS/C++ anymore.  They were created on a Linux PC leaving
	the Amiga stuff out.  You will have to use an older ctangle binary to
	create the TIE processor and then create the complete set of change
	files according to Makefile.sas.  Good luck!

[MS/DOS, BORLAND C++ 3.1] I can no longer support this compiler and most
	likely it's impossible to install CWEBbin with BC.  The source files
	common.cxx, common.h, and ctangle.cxx can definitely NOT be used with
	BC anymore.  They were created on a Linux PC leaving the
	`*-borlandc.*' change files out.  You will have to use an older
	ctangle.exe binary to create the TIE processor and then create the
	complete set of change files according to Makefile.bcc.  Good luck!

[MS/WINDOWS, MS/VC++ 4.1] I can no longer support this compiler and most
	likely it is impossible to install CWEBbin with this version of the
	Microsoft compiler.  The current version of MS/VC++ is supported
	through binary versions of CTANGLE and CWEAVE at
	http://www.literateprogramming.com.

[MS/WINDOWS, MS/VC++ 6.0] Double-click on "cwebbin.dsw" and proceed as usual.
	"Batch build" should result in "ctangle.exe", "cweave.exe", and
	"wmerge.exe".  Then proceed by hand.  See the gcc Makefile.unix for
	the "real thing".  Good luck!

%%% LIST OF FEATURES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

After the announcement of CWEB 3.3 [p11a] on news:comp.programming.literate
and news:comp.text.tex there have been questions: ``What's different in your
CWEB system in respect to the original system?  Why should programmers use
your's instead of the Levy/Knuth distribution?''

So here are some words about the `special features':

   - [GENERAL] The complete source code can (or at least at some point of time
     could) be recompiled with SAS/C for AmigaOS, with Borland C/C++ 3.1 for
     MS/DOS, with MS/VC++ 4.1 and 6.0 for MS/Windows, and with CC, C89, and
     GCC for UNIX without the need for further changes.  Well, to be honest,
     the complete source code was only compiled using GCC.

   - [GENERAL] The `+l' (or `-l') option with its argument `X' causes CWEAVE
     to prepend `X' to `cwebmac.tex' in the first line of the output file.
     `X' may be any string of characters (case dependent and possibly empty),
     e.g., if you called CWEAVE with the option `+ldansk', the danish  macro
     file `danskcwebmac.tex' (if there's such a thing) would be included
     instead of `cwebmac.tex'.  The macro file `Xcwebmac.tex' itself contains
     some modifications to the original `cwebmac.tex' file as described in the
     documentation.  At the time of writing there are macro packages
     `dcwebmac.tex' by  Andreas Scherer for German users, `icwebmac.tex' by
     Giuseppe Ghibò for Italian users, and `fcwebmac.tex' by Denis B. Roegel
     for French users.  These macro files translate all captions used by the
     CWEAVE processor into the respective languages and also include support
     for special characters like umlauts (diacritics) and some other
     frequently used specials according to ISO Latin-1, IBM PC International
     Codepage 850, Macintosh 8-bit font table and HP Roman 8.  Similar
     packages for other languages can easily be added to this scheme.  To date
     there are no conflicting languages, so single-character strings are used.

   - [GENERAL] <Obsolete> As of March 1997 five new macros with the prefix
     `pdf' are available.  Together with the "tex2pdf/pdftex" system they
     enable the presenation of CWEB source code in "Hyper CWEB" form, i.e.,
     all section references and the table of contents are hyperlinked and can
     be used in PDF readers.  Call "cweave -lpdf" (or "cweave -lpdfd", etc.)
     to include the respective macro file in the TeX output, before running
     "pdftex". </Obsolete>  As of July 2000 these macros are united with the
     generic macros, i.e., `cwebmac.tex' can be used with "plain TeX," "plain
     TeX + dvipdfm," and "pdftex."

   - [GENERAL] There are transliteration tables `ecma94.w', `hp8.w', `mac8.w',
     and `pc850.w' for @inclusion in limbo.  These files \input the associated
     TeX macro files `ecma94.sty', `hp8.sty', `mac8.sty', and `pc850.sty' with
     i18n support of extended code tables.  These macros can, of course, also
     be used independently of the CWEB files and have been set up to work as
     `packages' for LaTeX as well.  The option `+a' of former versions of the
     AMIGA installation is now replaced by the file `amiga_types.w' that can
     be `@i'ncluded in the source files where needed.

   - [GENERAL] Both CTANGLE and CWEAVE are fully localized for other natural
     languages than the English default.  #include files with the English,
     German, and Italian strings are provided in the ./catalogs directory
     for non-localized operating systems.  On AmigaOS 2.1/3.0 localization is
     done with the help of language catalogs and the system `locale.library'.
     Default is (of course) English; catalogs descriptions for German and
     Italian are provided and other language catalogs can easily be added.

   - [GENERAL] An algorithm for recursive `@i'nclude file search was adapted
     from the Web2c implementation of TeX and METAFONT.  The weave and tangle
     processors as well as wmerge now recognize the environment variable
     CWEBINPUTS.  When an include file name (argument to the @i command) can
     not be found in the current directory or in the absolute path, a
     multi-path search is performed.  CWEBINPUTS---if not empty---may contain
     a list of search path names, delimited by PATH_SEPARATORs, e.g., colons.
     The current directory is represented by an empty path entry, but it is
     searched first anyway.  In the respective makefiles for AMIGA, UNIX and
     MS/DOS some decent defaults are set in the compile time constant
     CWEBINPUTS, which always is appended to any environment variable, so you
     don't have to repeat the defaults.

   - [GENERAL] The `-o' option was added in connection with Carsten Steger's
     `-i' option.

   - [GENERAL] The output files of CTANGLE and CWEAVE are only written when
     there are significant changes to their contents, i.e., when a CWEB source
     creates multiple output files, only those modules effected by changes
     will be recompiled in the `make' process.  This mechanism was taken from
     Preston Briggs's NUWEB program, to whom credit is due.

   - [GENERAL] Five additional CWEB example programs are included as examples
     for the portability between PASCAL-WEB and C-CWEB and for the usage of
     the C++ features of version 3.1.  The fifth example program is a simple
     text converter for files with extended character codes of ISO-Latin-1,
     PC-850, MAC 8-bit font, and HP 8-bit font.

   - [AMIGA] Two AREXX scripts for use with the CygnusEd Professional Editor
     were added to this package, one for CTANGLE and CWEAVE, localized with
     the help of language catalogs under AmigaOS version 2.1 or 3.0, the other
     for use with the SAS/C 6.x compiler in connection with CED V3.5.

   - [AMIGA] All three system programs support the `version' information
     command of the Amiga operating system.

   - [AMIGA] All three system programs are compiled in the NEAR data segment
     and can be made `resident'.

   - [AMIGA] The `+m' option enables ARexx communication between CWEB and the
     SAS/C message browser SCMSG.  Any warnings or error messages are
     transferred to its list window.  The behaviour of  this feature can be
     controlled via the external environment variable SCMSGOPT, which may be
     set to any legal option string as described in the documentation of the
     SAS/C development system by SAS Institute.

%%% A BIT OF HISTORY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Patch level [p9b] of this implementation introduced localization to other
languages than English.  All output strings of ctangle and cweave were
replaced by variable references to an array AppStrings in cweb.h (also new),
set to the English defaults at startup time.  This works for all systems and
compilers in a compatible way.  However, version 2.1 of the AMIGA operating
system introduced the use of language catalogs, thus enabling programs and
applications to be inherently multilingual without recompilation.  To
activate this feature, you only have to install AmigaOS 2.1/3.0.  Catalogs
for various natural languages are already present at the correct place
(./catalogs/), so ctangle and cweave will greet you in any of these
languages, if you start them from their home directory ./bin and if your
system default language is supported.  If you want to use CTANGLE, CWEAVE,
and WMERGE as resident programs, you have to move the language catalogs to
the appropriate directories of the LOCALE: drawer.  Catalog translations for
other languages can easily be installed.  The author of this distribution
would be grateful to receive catalog translations for other languages for
inclusion in future versions.

Patch level [p9d] of this implementation introduced dynamic memory allocation
for all internal arrays except for `flags[256]'.  By this method both ctangle
and cweave can be compiled in the `NEAR' data segment, so on the AMIGA they
can be made `resident', i.e., they can reside in RAM and don't have to be
loaded from disk after the first time.  Patch level [p9d] also introduced an
ARexx communication facility between CWEB (i.e., ctangle and cweave) and the
`Message Browser' SCMSG, included in the SAS/C 6.X development system.  If
you run CWEB with the `+m' option, any error messages will be displayed in
the window of SCMSG.  The default setting is `off'.  You can control the
behaviour of this feature by setting the environment variable SCMSGOPT to
a string with any legal command line options for SCMSG as described in the
documentation provided with the compiler package by SAS Institute. If the
environment variable is not set, the default behaviour of SCMSG will be used.
Patch level [p9d] was evaluated on July 1, 1994, by Andreas Scherer and
Burkhard Schmitt of Bayreuth University with CC and GCC on a HP Apollo
workstation and a Sun 4 workstation and a SGI workstation, and on July 2,
with Borland C/C++ version 3.1 on a MS/DOS machine without any problems.

Patch level [p10] was released to the AmiNet and the Comprehensive TeX
Archive Network (CTAN) in August 1994.  At least one user had problems
installing the MS/DOS version.

Patch level [p11] was released to the AmiNet and the Comprehensive TeX
Archive Network (CTAN) in December 1994.  Only two days later another
update of CWEB 3.3 was released in Stanford, so a new patch level [p11a]
had to be created and released in mid-December 1994.  In January 1995 the
successful installation on at least two more systems has been notified.
The first is MS/DOS with GCC, the second OS/2 in genuine mode, both working
with Makefile.unix (and the obvious modifications).

%%% CREDIT WHERE CREDIT IS DUE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I want to express my deep gratitude to Silvio Levy and Donald Knuth for the
marvelous tool they provided us with.  Also I am indepted to my various pre-
and co-workers on whose initial ideas and contributions this package is based.


Happy CWEBbin'!

February 19, 2017.

Andreas Scherer

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
