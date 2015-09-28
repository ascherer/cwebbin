# This file, Makefile.unix, is part of CWEBBIN.
# It is distributed WITHOUT ANY WARRANTY, express or implied.
# Version 3.64 [22p] --- September 2015

# Copyright (C) 1987,1990,1993,2000 Silvio Levy and Donald E. Knuth
#
# Modified for the GCC compiler under Linux by Andreas Scherer
# (andreas.scherer@pobox.com), June 8, 1996.
# Last updated by Andreas Scherer, October 29, 2005.
# Revised by Andreas Scherer, September 29, 2015.

# The following copyright notice extends to the changes in this Makefile
# only, not to any part of the original CWEB distribution.
#
# Copyright (C) 1994, 1996, 2000, 2005 Andreas Scherer

# Permission is granted to make and distribute verbatim copies of this
# document provided that the copyright notice and this permission notice
# are preserved on all copies.

# Permission is granted to copy and distribute modified versions of this
# document under the conditions for verbatim copying, provided that the
# entire resulting derived work is given a different name and distributed
# under the terms of a permission notice identical to this one.

# 
# Read the README file, then edit this file to reflect local conditions
#

# directory for TeX inputs (cwebmac.tex and (X|d|f|i)cwebmac.tex and
# the 8-bit encodings go here)
MACROSDIR= /usr/local/share/texmf/tex/generic/cweb

# directory for CWEB inputs in @i files
CWEBINPUTS= /usr/local/lib/cweb

# extension for manual pages ("l" distinguishes local from system stuff)
MANEXT= l
#MANEXT= 1

# directory for manual pages (cweb.1 goes here)
MANDIR= /usr/share/man/man$(MANEXT)

# destination directory for executables; must end in /
DESTDIR= /usr/local/bin/

# directory for GNU EMACS Lisp code (cweb.el goes here)
EMACSDIR= /usr/share/emacs/site-lisp

# directory for the language header file "cweb.h"
CATINCLUDE= ./catalogs

# "$(CATLANGUAGE)cweb.h" is linked to "cweb.h"; it can be one of [dei]
CATLANGUAGE=e

# Set DESTPREF to null if you want to call the executables "tangle" and "weave"
# (probably NOT a good idea; we recommend leaving DESTPREF=c)
DESTPREF=c

# Set CCHANGES to comm-foo.ch if you need changes to common.w
CCHANGES= comm-22p.ch

# Set HCHANGES to comm-foo.hch if you need changes to common.h
HCHANGES= comm-22p.hch

# Set HPATCH to comm-foo.h if you apply changes to common.h
# default should be common.h
HPATCH= comm-22p.h

# Set TCHANGES to ctang-foo.ch if you need changes to ctangle.w
TCHANGES= ctang-22p.ch

# Set WCHANGES to cweav-foo.ch if you need changes to cweave.w
WCHANGES= cweav-22p.ch

# Set MCHANGES to wmerge-foo.ch if you need changes to wmerge.w
MCHANGES= wmerg-22p.ch

# Set EXTENSION to either `c' if you want to treat CWEB as a system
# of ordinary ANSI-C programs, or to `cc', `cxx', `cpp' or similar
# if you want to treat CWEB as a system of C++ programs.  Your
# compiler should be able to distinguish between the two forms
# according to the source file extension.  Even with ANSI-C programs
# it is strongly recommended to use C++ compilers, because of the
# much stricter checking of type conversions and module interfaces.
# For highest portability, all of the extra features of C++ are
# avoided in the CWEB system, thus using something like C--.
EXTENSION= cxx

# We keep debugging info around, for fun, but most users don't need it
CFLAGS = -g
#CFLAGS = -O

# These lists of arguments are specific for CC and GCC.  Change, add or
# delete things here to suit your personal conditions.

# This list of options works for all UNIX compilers tested.
OPT = -O3 -I$(CATINCLUDE) -DCWEBINPUTS=\"$(CWEBINPUTS)\" -W -Wall

# The following set of options work for CC 8.00 on HP-UX 8.00.
# The script cpp.sh is a local workaround for HP-UX 8.00 to unprotorize
# the patched source code, i.e., to remove all ANSI-prototypes.
# If you encounter any problems with the prototypes, look for it at
#    ftp.th-darmstadt.de:/pub/programming/languages/c/unproto-1.2.tar.Z
# If your version of HP-UX 8.00 acknowledges the `-Aa' option, delete
# the reference to cpp.sh.
#CFLAGS = $(OPT) -tp,/usr/local/bin/cpp.sh

# The following set of options work for CC 9.30 on HP-UX 9.01.
#CFLAGS = $(OPT) -Aa

# SunOS 4 has no `EXIT_FAILURE' or `EXIT_SUCCESS' in <stdlib.h>.
#CFLAGS = $(OPT) -DEXIT_FAILURE=20L

# SGI's IRIX 4.0.5 and DEC's Ultrix 4.4 don't need special treatment.
CFLAGS = $(OPT)

# All linkers tested worked fine with this option.
#LINKFLAGS = -g
LINKFLAGS = -s # for smaller (stripped) executables on many UNIX systems

# The `f' flag is turned off to save paper
# The `lX' flag includes Xcwebmac.tex
# The `s' flag displays some statistics
WFLAGS = -f +lX +s
TFLAGS = +s

# Always use this extended Makefile
MAKE = make -f Makefile.unix

# Klaus Guntermann's Tie 2.4 processor can easily be installed on UNIX.
TIE = tie

# What C compiler are you using?
CC = g++ # gcc cc

# RM and CP are used below in case rm and cp are aliased
RM= /bin/rm
CP= /bin/cp

# uncomment the second line if you use pdftex to bypass .dvi files
#PDFTEX = dvipdfm
PDFTEX = pdftex

##########  You shouldn't have to change anything after this point #######

CWEAVE = ./cweave $(WFLAGS)
CTANGLE = ./ctangle $(TFLAGS)

# The following files come from the original CWEB distribution and
# are left completely unmodified.

SOURCES = cweave.w common.w ctangle.w examples/wmerge.w

ORIGINAL = $(SOURCES) prod.w \
	Makefile common.c common.h ctangle.c \
	cwebman.tex cwebmac.tex comm-vms.ch ctang-vms.ch \
	cweav-vms.ch comm-man.ch ctang-man.ch cweav-man.ch \
	comm-pc.ch ctang-pc.ch cweav-pc.ch comm-amiga.ch \
        comm-bs.ch ctang-bs.ch cweav-bs.ch makefile.bs \
	comm-ql.ch ctang-ql.ch cweav-ql.ch readme.ql \
	comm-w32.ch ctang-w32.ch cweav-w32.ch \
	comm-os2.ch comm-mac.ch cweb.1 cweb.el c++lib.w README \
	examples/extex.c examples/extex.ch examples/extex.w \
	examples/kspell.el examples/Makefile examples/README \
	examples/oemacs.c examples/oemacs.el examples/oemacs.w \
	examples/treeprint.c examples/treeprint.w \
	examples/wc.c examples/wc.w examples/wc-dos.ch \
	examples/wmerge.c examples/wmerg-pc.ch examples/wmer-os2.ch \
	examples/wordtest.c examples/wordtest.w \
	examples/xlib_types.w examples/xview_types.w

# The following files make the body of this patched distribution
# of CWEB.

COMMPATCH = comm-ansi.ch comm-ansi.hch comm-arexx.ch comm-arexx.hch \
	comm-borlandc.ch comm-borlandc.hch comm-extensions.ch \
	comm-extensions.hch comm-memory.ch comm-memory.hch \
	comm-output.ch comm-output.hch comm-patch.ch \
	comm-translation.ch comm-translation.hch comm-newpage.ch
CTANGPATCH = ctang-ansi.ch ctang-borlandc.ch ctang-memory.ch \
	ctang-output.ch ctang-patch.ch ctang-translation.ch \
	ctang-newpage.ch
CWEAVPATCH = cweav-ansi.ch cweav-borlandc.ch cweav-extensions.ch \
	cweav-memory.ch cweav-output.ch cweav-patch.ch \
	cweav-translation.ch cweav-newpage.ch
WMERGPATCH = wmerg-ansi.ch wmerg-borlandc.ch wmerg-extensions.ch \
	wmerg-memory.ch wmerg-output.ch wmerg-patch.ch
PATCH = common.$(EXTENSION) ctangle.$(EXTENSION) wmerge.$(EXTENSION) \
	cwebman.ch README.22p Makefile.bcc Makefile.sas Makefile.unix \
	cwebbin.spec cwebbin.dsw ctangle.dsp cweave.dsp wmerge.dsp

AREXX = arexx

EXAMPLES = examples/cct.w examples/commonwords.w examples/extex-ansi.ch \
	examples/Makefile.sas examples/matrix.w examples/primes.ch \
	examples/primes.w examples/README.p11 examples/sample.w \
	examples/treeprint-ansi.ch examples/wc-ansi.ch examples/wordtest-ansi.ch

INCLUDE = cwebinputs

MACROS = texinputs

ALL = $(ORIGINAL) $(COMMPATCH) $(CTANGPATCH) $(CWEAVPATCH) $(WMERGPATCH) \
	$(PATCH) $(AREXX) $(EXAMPLES) $(INCLUDE) $(MACROS)

.SUFFIXES: .dvi .tex .w .pdf

.w.tex:
	$(CWEAVE) $*

.tex.dvi:	
	TEXINPUTS=.//: tex $<

.tex.pdf:
	case "$(PDFTEX)" in \
	  dvipdfm ) TEXINPUTS=.//: tex "\let\pdf+ \input $*"; dvipdfm $* ;; \
	  pdftex ) TEXINPUTS=.//: pdftex $* ;; \
	esac

.w.dvi:
	$(MAKE) $*.tex
	$(MAKE) $*.dvi

.w.pdf:
	$(MAKE) $*.tex
	$(MAKE) $*.pdf

.w.$(EXTENSION):
	$(CTANGLE) $* - $*.$(EXTENSION)

.w.o:
	$(MAKE) $*.$(EXTENSION)
	$(MAKE) $*.o

.$(EXTENSION).o:
	$(CC) $(CFLAGS) -c $*.$(EXTENSION)

# The complete set of files contains the two programs `ctangle' and
# `cweave' plus the program `wmerge', the manuals `cwebman' and `cwebmana'
# and the source documentations.
all: ctangle cweave wmerge fullmanual

cautiously: ctangle
	$(CP) common.$(EXTENSION) SAVEcommon.$(EXTENSION)
	$(CTANGLE) common $(CCHANGES) common.$(EXTENSION)
	diff common.$(EXTENSION) SAVEcommon.$(EXTENSION)
	$(RM) SAVEcommon.$(EXTENSION)
	$(CP) ctangle.$(EXTENSION) SAVEctangle.$(EXTENSION)
	$(CTANGLE) ctangle $(TCHANGES) ctangle.$(EXTENSION)
	diff ctangle.$(EXTENSION) SAVEctangle.$(EXTENSION)
	$(RM) SAVEctangle.$(EXTENSION)

SAVEctangle.$(EXTENSION):
	$(CP) ctangle.$(EXTENSION) SAVEctangle.$(EXTENSION)

SAVEcommon.$(EXTENSION):
	$(CP) common.$(EXTENSION) SAVEcommon.$(EXTENSION)

common.$(EXTENSION): common.w $(CCHANGES)
	$(CTANGLE) common $(CCHANGES) common.$(EXTENSION)

common.o: common.$(EXTENSION) $(CATINCLUDE)/cweb.h
	$(CC) $(CFLAGS) -DCWEBINPUTS=\"$(CWEBINPUTS)\" -c common.$(EXTENSION)

ctangle: ctangle.o common.o
	$(CC) $(LINKFLAGS) -o ctangle ctangle.o common.o 

ctangle.$(EXTENSION): ctangle.w $(TCHANGES) $(HPATCH)
	$(CTANGLE) ctangle $(TCHANGES) ctangle.$(EXTENSION)

ctangle.o: ctangle.$(EXTENSION) $(CATINCLUDE)/cweb.h $(HPATCH)
	$(CC) $(CFLAGS) -c ctangle.$(EXTENSION)

cweave: cweave.o common.o
	$(CC) $(LINKFLAGS) -o cweave cweave.o common.o

cweave.$(EXTENSION): cweave.w $(WCHANGES) $(HPATCH)
	$(CTANGLE) cweave $(WCHANGES) cweave.$(EXTENSION)

cweave.o: cweave.$(EXTENSION) $(CATINCLUDE)/cweb.h $(HPATCH)
	$(CC) $(CFLAGS) -c cweave.$(EXTENSION)

wmerge: wmerge.$(EXTENSION)
	$(CC) $(CFLAGS) -o wmerge wmerge.$(EXTENSION) $(LINKFLAGS)

wmerge.$(EXTENSION): examples/wmerge.w $(MCHANGES)
	$(CTANGLE) examples/wmerge $(MCHANGES) wmerge.$(EXTENSION)

boot:
	if test ! -h $(CATINCLUDE)/cweb.h; \
		then ln -s $(CATLANGUAGE)cweb.h $(CATINCLUDE)/cweb.h; fi
	$(CC) $(CFLAGS) -c ctangle.$(EXTENSION)
	$(CC) $(CFLAGS) -c common.$(EXTENSION)
	$(CC) $(LINKFLAGS) -o ctangle ctangle.o common.o

# Take a good lecture for bedtime reading
doc: $(SOURCES:.w=.pdf)

docs: cwebman.pdf cwebmana.pdf common.pdf ctangle.pdf cweave.pdf wmerge.pdf

cwebman.dvi: cwebman.tex
cwebmana.dvi: cwebmana.tex
common.dvi: common.tex
ctangle.dvi: ctangle.tex
cweave.dvi: cweave.tex
wmerge.dvi: wmerge.tex

usermanual: cwebmana.pdf

fullmanual: usermanual $(SOURCES) \
	comm-doc.ch ctang-doc.ch cweav-doc.ch $(HPATCH) $(MCHANGES)
	$(CWEAVE) common.w comm-doc.ch
	$(MAKE) common.pdf
	$(CWEAVE) ctangle.w ctang-doc.ch
	$(MAKE) ctangle.pdf
	$(CWEAVE) cweave.w cweav-doc.ch
	$(MAKE) cweave.pdf
	$(CWEAVE) examples/wmerge.w $(MCHANGES)
	$(MAKE) wmerge.pdf

cwebmana.tex: cwebman.tex cwebman.ch
	$(TIE) -m $@ $^

# the documentation change files are created automatically by the TIE
# processor from a set of separate change files.  note that not all
# change files listed above are actually used here, so you won't see
# any system-dependent parts not available under UNIX.
comm-doc.ch: common.w $(CCHANGES) comm-man.ch comm-newpage.ch
	$(TIE) -c $@ $^
ctang-doc.ch: ctangle.w $(TCHANGES) ctang-man.ch ctang-newpage.ch
	$(TIE) -c $@ $^
cweav-doc.ch: cweave.w $(WCHANGES) cweav-man.ch cweav-newpage.ch
	$(TIE) -c $@ $^

# for making the documentation we will have to include the change files
ctangle.tex: ctangle.w $(TCHANGES) $(HPATCH)
	$(CWEAVE) ctangle $(TCHANGES)

cweave.tex: cweave.w $(WCHANGES) $(HPATCH)
	$(CWEAVE) cweave $(WCHANGES)

common.tex: common.w $(CCHANGES)
	$(CWEAVE) common $(CCHANGES)

wmerge.tex: examples/wmerge.w $(MCHANGES)
	$(CWEAVE) examples/wmerge $(MCHANGES)

# the master change files are created automatically by the TIE processor
# from a set of separate change files.  note that not all change files
# listed above are actually used here, so you should not try to re-port
# the resulting sources to Amiga (or MS/DOS).
$(CCHANGES): common.w comm-patch.ch comm-ansi.ch comm-extensions.ch \
	comm-memory.ch comm-translation.ch comm-output.ch
	$(TIE) -c $@ $^
$(HCHANGES): common.h comm-ansi.hch comm-extensions.hch \
	comm-memory.hch comm-translation.hch comm-output.hch
	$(TIE) -c $@ $^
$(HPATCH): common.h $(HCHANGES)
	$(TIE) -m $@ $^
$(TCHANGES): ctangle.w ctang-patch.ch ctang-ansi.ch \
	ctang-memory.ch ctang-translation.ch ctang-output.ch
	$(TIE) -c $@ $^
$(WCHANGES): cweave.w cweav-patch.ch cweav-ansi.ch cweav-extensions.ch \
	cweav-memory.ch cweav-translation.ch cweav-output.ch
	$(TIE) -c $@ $^
$(MCHANGES): examples/wmerge.w wmerg-patch.ch wmerg-ansi.ch \
	wmerg-extensions.ch wmerg-memory.ch wmerg-output.ch
	$(TIE) -c $@ $^

# be sure to leave ctangle.$(EXTENSION) and common.$(EXTENSION)
# and $(HPATCH) for bootstrapping
clean:
	$(RM) -f -r *~ *.o common.tex cweave.tex cweave.$(EXTENSION) ctangle.tex \
	cweave.w.[12] cwebmana.tex wmerge.$(EXTENSION) wmerge.tex wmerge \
	  *-22p.* *-doc.ch *.orig *.rej $(CATINCLUDE)/cweb.h \
	  *.log *.dvi *.toc *.idx *.scn *.pdf core cweave ctangle

install: all
	- mkdir $(DESTDIR)
	$(CP) cweave $(DESTDIR)$(DESTPREF)weave
	chmod 755 $(DESTDIR)$(DESTPREF)weave
	$(CP) ctangle $(DESTDIR)$(DESTPREF)tangle
	chmod 755 $(DESTDIR)$(DESTPREF)tangle
	$(CP) wmerge $(DESTDIR)wmerge
	chmod 755 $(DESTDIR)wmerge
	- mkdir $(MANDIR)
	$(CP) cweb.1 $(MANDIR)/cweb.$(MANEXT)
	chmod 644 $(MANDIR)/cweb.$(MANEXT)
	- mkdir $(MACROSDIR)
	$(CP) cwebmac.tex $(MACROSDIR)
	chmod 644 $(MACROSDIR)/cwebmac.tex
	$(CP) $(MACROS)/* $(MACROSDIR)
	chmod 644 $(MACROSDIR)/*
	- mkdir $(EMACSDIR)
	$(CP) cweb.el $(EMACSDIR)
	chmod 644 $(EMACSDIR)/cweb.el
	- mkdir $(CWEBINPUTS)
	$(CP) c++lib.w $(CWEBINPUTS)
	chmod 644 $(CWEBINPUTS)/c++lib.w
	$(CP) $(INCLUDE)/* $(CWEBINPUTS)
	chmod 644 $(CWEBINPUTS)/*

floppy: $(ORIGINAL)
	bar cvhf /dev/rfd0 $(ORIGINAL)
	bar tvf /dev/rfd0
	eject

tags: $(ORIGINAL)
	etags -lnone $(ORIGINAL)

tarfile: $(ORIGINAL)
	tar cvhf /tmp/cweb.tar $(ORIGINAL)
	gzip -9 /tmp/cweb.tar

# Remove the original distribution completely.
remove-orig:
	- $(RM) $(ORIGINAL)

# Remove the patch completely
remove:
	- $(RM) $(COMMPATCH)
	- $(RM) $(CTANGPATCH)
	- $(RM) $(CWEAVPATCH)
	- $(RM) $(WMERGPATCH)
	- $(RM) $(PATCH)
	- $(RM) $(EXAMPLES)
	- $(RM) -r $(AREXX)
	- $(RM) -r $(CATINCLUDE)
	- $(RM) -r $(INCLUDE)
	- $(RM) -r $(MACROS)

# End of Makefile.unix
