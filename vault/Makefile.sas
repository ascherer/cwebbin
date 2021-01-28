# This file, makefile.sas, is part of CWEBBIN.
# It is distributed WITHOUT ANY WARRANTY, express or implied.
# Version 3.64 [2018] --- December 2018

# Copyright (C) 1987,1990,1993,2000 Silvio Levy and Donald E. Knuth
#
# Modified for SAS/C++ 6.57 under AmigaOS 2.1 on an AMIGA 2000 by
# Andreas Scherer <andreas.scherer@pobox.com>, March 1993.
# Last updated by Andreas Scherer, December 4, 2018.
# IMPORTANT NOTE: This installation was not tested.

# The following copyright notice extends to the changes in this Makefile
# only, not to any part of the original CWEB distribution.
#
# Copyright (C) 1993-1999, 2018 Andreas Scherer

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
MACROSDIR = TeXMF:AmiWeb2c-2.1/texmf/tex/generic/cweb

# directory for CWEB inputs in @i files
CWEBINPUTS = Local:cwebinputs

# extension for manual pages ("l" distinguishes local from system stuff)
#MANEXT = l
MANEXT = 1

# directory for manual pages (cweb.1 goes here)
MANDIR =

# destination directory for executables; must end in /
DESTDIR = Local:bin/

# directory for GNU EMACS Lips code (cweb.el goes here)
EMACSDIR = s:

# directory for language catalogs with message texts of the script file
CATDIR = Locale:catalogs/

# directory for the language header file "cweb.h"
CATINCLUDE = catalogs/

# Set DESTPREF to null if you want to call the executables "tangle" and
# "weave" (probably NOT a good idea; we recommend leaving DESTPREF = c)
DESTPREF = c

# Set CCHANGES to comm-foo.ch if you need changes to common.w
CCHANGES = comm-foo.ch

# Set HCHANGES to comm-foo.hch if you need changes to common.h
HCHANGES = comm-foo.h

# Set TCHANGES to ctang-foo.ch if you need changes to ctangle.w
TCHANGES = ctang-foo.ch

# Set WCHANGES to cweav-foo.ch if you need changes to cweave.w
WCHANGES = cweav-foo.ch

# Set MCHANGES to wmerge-foo.ch if you need changes to wmerge.w
MCHANGES = wmerg-foo.ch

# Set EXTENSION to either `c' if you want to treat CWEB as a system
# of ordinary ANSI-C programs, or to `cc', `cxx', `cpp' or similar
# if you want to treat CWEB as a system of C++ programs.  Your
# compiler should be able to distinguish between the two forms
# according to the source file extension.  Even with ANSI-C programs
# it is strongly recommended to use C++ compilers, because of the
# much stricter checking of type conversions and module interfaces.
# For highest portability, all of the extra features of C++ are
# avoided in the CWEB system, thus using something like C--.
EXTENSION = cxx

# These lists of arguments are specific for SC and SLINK.
# Change, add or delete things here to suit your personal conditions.
OBJS = LIB:cres.o
LIBS = LIB:sc.lib
CFLAGS = CPU=ANY INCLUDEDIR=$(CATINCLUDE) DEFINE=_DEV_NULL="NIL:" \
	DEFINE=_STRICT_ANSI DEFINE=CWEBINPUTS="$(CWEBINPUTS)" \
	DEFINE=SEPARATORS=",/:" NOSTACKCHECK NOICONS VERBOSE \
	IGNORE=304+1597
LINKFLAGS = VERBOSE NOICONS STRIPDEBUG LIB $(LIBS) FROM $(OBJS)

# The `f' flag is turned off to save paper
# The `lX' flag includes Xcwebmac.tex
# The `s' flag displays some statistics
WFLAGS = -f +lX +s
TFLAGS = +s

# What C compiler are you using?
CC = SC
LINK = SLink
MAKE = SMake

# Klaus Guntermann's Tie 2.4 processor can be found on the Aminet.
TIE = tie

# RM and CP are used below in case rm and cp are aliased
RM = - delete
CP = copy
INSTALL = copy

##########  You shouldn't have to change anything below this point #######

CWEAVE = CWEBINPUTS=$(INCLUDE) ./cweave $(WFLAGS)
CTANGLE = CWEBINPUTS=$(INCLUDE) ./ctangle $(TFLAGS)

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
	examples/extex.ch examples/extex.w \
	examples/kspell.el examples/Makefile examples/README \
	examples/oemacs.el examples/oemacs.w \
	examples/treeprint.w \
	examples/wc.w examples/wc-dos.ch \
	examples/wmerg-pc.ch examples/wmer-os2.ch \
	examples/wordtest.w \
	examples/xlib_types.w examples/xview_types.w

# The following files make the body of this patched distribution
# of CWEB.
# Note that not all of these changefiles are actually used.

COMMPATCH = comm-ansi.ch comm-ansi.hch comm-arexx.ch comm-arexx.hch \
	comm-borlandc.ch comm-borlandc.hch comm-extensions.ch \
	comm-extensions.hch comm-i18n.ch comm-i18n.hch comm-memory.ch \
	comm-memory.hch comm-newpage.ch comm-output.ch comm-output.hch \
	comm-patch.ch comm-translation.ch comm-translation.hch \
	comm-texlive.ch comm-texlive.hch
CTANGPATCH = ctang-ansi.ch ctang-borlandc.ch ctang-extensions.ch \
	ctang-i18n.ch ctang-memory.ch ctang-newpage.ch ctang-output.ch \
	ctang-patch.ch ctang-translation.ch ctang-texlive.ch
CWEAVPATCH = cweav-ansi.ch cweav-borlandc.ch cweav-extensions.ch \
	cweav-i18n.ch cweav-memory.ch cweav-newpage.ch cweav-output.ch \
	cweav-patch.ch cweav-translation.ch cweav-texlive.ch
WMERGPATCH = wmerg-ansi.ch wmerg-borlandc.ch wmerg-extensions.ch \
	wmerg-memory.ch wmerg-output.ch wmerg-patch.ch
PATCH = common.$(EXTENSION) ctangle.$(EXTENSION) wmerge.$(EXTENSION) \
	cwebman.ch README.txt Makefile.bcc Makefile.sas Makefile.unix \
	cwebbin.spec cwebbin.dsw ctangle.dsp cweave.dsp wmerge.dsp \
	0001-Update-CWEBbin-manpage.patch ctangle.1 cweave.1

EXAMPLES = examples/cct.w examples/commonwords.w examples/extex-ansi.ch \
	examples/Makefile.sas examples/matrix.w examples/primes.ch \
	examples/primes.w examples/README.p11 examples/sample.w \
	examples/treeprint-ansi.ch examples/wc-ansi.ch \
	examples/wordtest-ansi.ch

AREXX = arexx

CATALOGS = catalogs

I18N = po

INCLUDE = cwebinputs

MACROS = texinputs

ALL = $(ORIGINAL) $(COMMPATCH) $(CTANGPATCH) $(CWEAVPATCH) $(WMERGPATCH) \
	$(PATCH) $(EXAMPLES) $(AREXX) $(CATALOGS) $(I18N) $(INCLUDE) $(MACROS)

.SUFFIXES:
.SUFFIXES: .dvi .pdf .tex .w .$(EXTENSION) .o

.w.tex:
	$(CWEAVE) $(WFLAGS) $* $*

.tex.dvi:
	tex $<

.tex.pdf:
	pdftex $<

.w.dvi:
	$(MAKE) $*.tex
	$(MAKE) $*.dvi

.w.pdf:
	$(MAKE) $*.tex
	$(MAKE) $*.pdf

.w.$(EXTENSION):
	$(CTANGLE) $* - $*.$(EXTENSION)

.$(EXTENSION).o:
	$(CC) $(CFLAGS) $*.$(EXTENSION)

.w.o:
	$(MAKE) $*.$(EXTENSION)
	$(MAKE) $*.o

# When you say `smake' without any arguments, `smake' will jump to this item
default: boot progs

# The complete set of files contains the two programs `ctangle' and
# `cweave' plus the program `wmerge', the manuals `cwebman' and `cwebmana'
# and the source documentations.
all: progs docs

# The objects of desire
progs: ctangle cweave wmerge

cautiously: ctangle
	$(MAKE) SAVEcommon.$(EXTENSION)
	$(CTANGLE) $(TFLAGS) common $(CCHANGES) common.$(EXTENSION)
	diff common.$(EXTENSION) SAVEcommon.$(EXTENSION)
	$(RM) SAVEcommon.$(EXTENSION)
	$(MAKE) SAVEctangle.$(EXTENSION)
	$(CTANGLE) $(TFLAGS) ctangle $(TCHANGES) ctangle.$(EXTENSION)
	diff ctangle.$(EXTENSION) SAVEctangle.$(EXTENSION)
	$(RM) SAVEctangle.$(EXTENSION)

SAVEctangle.$(EXTENSION):
	$(CP) ctangle.$(EXTENSION) SAVEctangle.$(EXTENSION)

SAVEcommon.$(EXTENSION):
	$(CP) common.$(EXTENSION) SAVEcommon.$(EXTENSION)

common.$(EXTENSION): common.w $(CCHANGES)
	$(CTANGLE) $(TFLAGS) common $(CCHANGES) common.$(EXTENSION)

common.o: common.$(EXTENSION) $(CATINCLUDE)cweb.h

ctangle: ctangle.o common.o
	$(LINK) $(LINKFLAGS) common.o ctangle.o TO ctangle

ctangle.$(EXTENSION): ctangle.w $(TCHANGES) $(HCHANGES)
	$(CTANGLE) $(TFLAGS) ctangle $(TCHANGES) ctangle.$(EXTENSION)

ctangle.o: ctangle.$(EXTENSION) $(CATINCLUDE)cweb.h $(HCHANGES)

cweave: cweave.o common.o
	$(LINK) $(LINKFLAGS) common.o cweave.o TO cweave

cweave.$(EXTENSION): cweave.w $(WCHANGES) $(HCHANGES)
	$(CTANGLE) $(TFLAGS) cweave $(WCHANGES) cweave.$(EXTENSION)

cweave.o: cweave.$(EXTENSION) $(CATINCLUDE)cweb.h $(HCHANGES)
	$(CC) $(CFLAGS) code=FAR cweave.$(EXTENSION)

wmerge: wmerge.o
	$(LINK) $(LINKFLAGS) wmerge.o TO wmerge

wmerge.o: wmerge.$(EXTENSION)
	$(CC) $(CFLAGS) wmerge.$(EXTENSION)

wmerge.$(EXTENSION): examples/wmerge.w $(MCHANGES)
	$(CTANGLE) $(TFLAGS) examples/wmerge $(MCHANGES) wmerge.$(EXTENSION)

boot:
	$(CC) $(CFLAGS) ctangle.$(EXTENSION)
	$(CC) $(CFLAGS) common.$(EXTENSION)
	$(LINK) $(LINKFLAGS) ctangle.o common.o TO ctangle

# Take a good lecture for bedtime reading
docs: cwebman.dvi cwebmana.dvi common.dvi ctangle.dvi cweave.dvi wmerge.dvi

cwebman.dvi: cwebman.tex
cwebmana.dvi: cwebmana.tex
common.dvi: common.tex
ctangle.dvi: ctangle.tex
cweave.dvi: cweave.tex
wmerge.dvi: wmerge.tex

usermanual: cwebmana.dvi

fullmanual: usermanual $(SOURCES) \
	comm-doc.ch ctang-doc.ch cweav-doc.ch $(HCHANGES) $(MCHANGES)
	$(CWEAVE) common.w comm-doc.ch; $(MAKE) common.dvi
	$(CWEAVE) ctangle.w ctang-doc.ch; $(MAKE) ctangle.dvi
	$(CWEAVE) cweave.w cweav-doc.ch; $(MAKE) cweave.dvi
	$(CWEAVE) examples/wmerge.w $(MCHANGES); $(MAKE) wmerge.dvi

cwebmana.tex: cwebman.tex cwebman.ch
	$(TIE) -m cwebmana.tex cwebman.tex cwebman.ch

# the documentation change files are created automatically by the TIE
# processor from a set of separate change files.  note that not all
# change files listed above are actually used here, so you won't see
# any system-dependent parts not available under AmigaOS.
comm-doc.ch: common.w  $(CCHANGES) comm-man.ch comm-newpage.ch
	$(TIE) -c comm-doc.ch common.w $(CCHANGES) \
	comm-man.ch comm-newpage.ch
ctang-doc.ch: ctangle.w $(TCHANGES) ctang-man.ch ctang-newpage.ch
	$(TIE) -c ctang-doc.ch ctangle.w $(TCHANGES) \
	ctang-man.ch ctang-newpage.ch
cweav-doc.ch: cweave.w $(WCHANGES) cweav-man.ch cweav-newpage.ch
	$(TIE) -c cweav-doc.ch cweave.w $(WCHANGES) \
	cweav-man.ch cweav-newpage.ch

# for making the documentation we will have to include the change files
ctangle.tex: ctangle.w $(TCHANGES) $(HCHANGES)
	$(CWEAVE) ctangle $(TCHANGES)

cweave.tex: cweave.w $(WCHANGES) $(HCHANGES)
	$(CWEAVE) cweave $(WCHANGES)

common.tex: common.w $(CCHANGES)
	$(CWEAVE) common $(CCHANGES)

wmerge.tex: examples/wmerge.w $(MCHANGES)
	$(CWEAVE) examples/wmerge $(MCHANGES)

# the master change files are created automatically by the TIE processor
# from a set of separate change files.  note that not all change files
# listed above are actually used here, so you should not try to port
# the resulting sources to MS/DOS (UNIX is fine, though).
$(CCHANGES): common.w comm-patch.ch comm-ansi.ch comm-extensions.ch \
	comm-output.ch comm-memory.ch comm-translation.ch comm-arexx.ch
	$(TIE) -c $(CCHANGES) common.w \
	comm-patch.ch comm-ansi.ch comm-extensions.ch comm-output.ch \
	comm-memory.ch comm-translation.ch comm-arexx.ch
$(HCHANGES): common.h comm-ansi.hch comm-extensions.hch comm-output.ch \
	comm-memory.hch comm-translation.hch comm-arexx.hch
	$(TIE) -m $(HCHANGES) common.h \
	comm-ansi.hch comm-extensions.hch comm-output.ch \
	comm-memory.hch comm-translation.hch comm-arexx.hch
$(TCHANGES): ctangle.w ctang-patch.ch ctang-ansi.ch ctang-extensions.ch \
	ctang-output.ch ctang-memory.ch ctang-translation.ch
	$(TIE) -c $(TCHANGES) ctangle.w \
	ctang-patch.ch ctang-ansi.ch ctang-extensions.ch ctang-output.ch \
	ctang-memory.ch ctang-translation.ch
$(WCHANGES): cweave.w cweav-patch.ch cweav-ansi.ch cweav-extensions.ch \
	cweav-output.ch cweav-memory.ch cweav-translation.ch
	$(TIE) -c $(WCHANGES) cweave.w \
	cweav-patch.ch cweav-ansi.ch cweav-extensions.ch cweav-output.ch \
	cweav-memory.ch cweav-translation.ch
$(MCHANGES): examples/wmerge.w wmerg-patch.ch wmerg-ansi.ch \
	wmerg-extensions.ch wmerg-output.ch wmerg-memory.ch
	$(TIE) -c $(MCHANGES) examples/wmerge.w \
	wmerg-patch.ch wmerg-ansi.ch wmerg-extensions.ch \
	wmerg-output.ch wmerg-memory.ch

# be sure to leave ctangle.$(EXTENSION) and common.$(EXTENSION)
# for bootstrapping
clean:
	$(RM) \#?.(o|lnk|bak|log|dvi|pdf|toc|idx|scn)
	$(RM) common.tex cweave.tex cweave.$(EXTENSION) wmerge.$(EXTENSION)
	$(RM) ctangle.tex cweave ctangle cwebmana.tex wmerge.tex wmerge
	$(RM) \#?-foo.\#? \#?-doc.ch

# Install the new program versions where they can be found
install: progs
	$(INSTALL) cweave $(DESTDIR)$(DESTPREF)weave
	$(INSTALL) ctangle $(DESTDIR)$(DESTPREF)tangle
	$(INSTALL) wmerge $(DESTDIR)wmerge
	$(INSTALL) cwebmac.tex $(MACROSDIR)
	$(INSTALL) texinputs/\#? $(MACROSDIR)
	$(INSTALL) cwebinputs/\#? $(CWEBINPUTS)
	$(INSTALL) c++lib.w $(CWEBINPUTS)

# Remove the original distribution completely.
remove-orig:
	$(RM) $(ORIGINAL)

# Remove the patch completely
remove: clean
	$(RM) $(COMMPATCH)
	$(RM) $(CTANGPATCH)
	$(RM) $(CWEAVPATCH)
	$(RM) $(WMERGPATCH)
	$(RM) $(PATCH)
	$(RM) $(EXAMPLES)
	$(RM) $(AREXX) all
	$(RM) $(CATALOGS) all
	$(RM) $(I18N) all
	$(RM) $(INCLUDE) all
	$(RM) $(MACROS) all

# End of Makefile.sas
