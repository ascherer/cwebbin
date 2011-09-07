# This file, makefile.sas, is part of CWEBBIN (Version 3.63 [p19]).
# It is distributed WITHOUT ANY WARRANTY, express or implied.
#
# Modified for SAS/C++ 6.57 under AmigaOS 2.1 on an AMIGA 2000 by
# Andreas Scherer <andreas.scherer@pobox.com>, March 1993
# Last updated by Andreas Scherer, January 3, 2001.
# IMPORTANT NOTE: This installation was not tested.

# Copyright (C) 1987,1990,1993,1998 Silvio Levy and Donald E. Knuth
#
# The following copyright notice extends to this Amiga Makefile only,
# not to any part of the original CWEB distribution.
#
# Copyright (C) 1993-1999 Andreas Scherer

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
MANEXT = l
#MANEXT = 1

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
CCHANGES = comm-p19.ch

# Set HCHANGES to comm-foo.hch if you need changes to common.h
HCHANGES = comm-p19.hch

# Set HPATCH to comm-foo.h if you apply changes to common.h
# default should be common.h
HPATCH = comm-p19.h

# Set TCHANGES to ctang-foo.ch if you need changes to ctangle.w
TCHANGES = ctang-p19.ch

# Set WCHANGES to cweav-foo.ch if you need changes to cweave.w
WCHANGES = cweav-p19.ch

# Set MCHANGES to wmerge-foo.ch if you need changes to wmerge.w
MCHANGES = wmerg-p19.ch

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

CWEAVE = cweave
CTANGLE = ctangle
WMERGE = wmerge

# The following files come from the original CWEB distribution and
# are left completely unmodified.

SOURCES = common.w common.h ctangle.w cweave.w prod.w examples/wmerge.w

ORIGINAL = $(SOURCES) comm-amiga.ch comm-bs.ch comm-man.ch comm-os2.ch \
	comm-pc.ch comm-ql.ch comm-vms.ch common.c ctang-bs.ch \
	ctang-man.ch ctang-pc.ch ctang-ql.ch ctang-vms.ch ctangle.c \
	cweav-bs.ch cweav-man.ch cweav-pc.ch cweav-ql.ch cweav-vms.ch \
	cweb.1 cweb.el cwebmac.tex cwebman.tex Makefile \
	makefile.bs README readme.ql c++lib.w \
        examples/extex.w examples/kspell.el examples/Makefile \
	examples/oemacs.el examples/oemacs.w examples/README \
	examples/treeprint.w examples/wc.w examples/wc-dos.ch \
	examples/wmerg-pc.ch examples/wmer-os2.ch examples/wordtest.w \
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
	cwebman.ch README.p19 Makefile.bcc Makefile.sas Makefile.unix \
	comm-newpage.ch ctang-newpage.ch cweav-newpage.ch

AREXX = arexx

BIN = bin

EXAMPLES = examples/cct.w examples/commonwords.w examples/extex-ansi.ch \
	examples/Makefile.sas examples/matrix.w examples/primes.ch \
	examples/primes.w examples/README.p11 examples/sample.w \
	examples/treeprint.ch examples/wc.ch examples/wordtest.ch

INCLUDE = cwebinputs

MACROS = texinputs

ALL = $(ORIGINAL) $(COMMPATCH) $(CTANGPATCH) $(CWEAVPATCH) $(WMERGPATCH) \
	$(PATCH) $(AREXX) $(BIN) $(EXAMPLES) $(INCLUDE) $(MACROS)

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
	$(CP) common.$(EXTENSION) SAVEcommon.$(EXTENSION)
	$(CTANGLE) $(TFLAGS) common $(CCHANGES) common.$(EXTENSION)
	diff common.$(EXTENSION) SAVEcommon.$(EXTENSION)
	$(RM) SAVEcommon.$(EXTENSION)
	$(CP) ctangle.$(EXTENSION) SAVEctangle.$(EXTENSION)
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

ctangle.$(EXTENSION): ctangle.w $(TCHANGES) $(HPATCH)
	$(CTANGLE) $(TFLAGS) ctangle $(TCHANGES) ctangle.$(EXTENSION)

ctangle.o: ctangle.$(EXTENSION) $(CATINCLUDE)cweb.h $(HPATCH)

cweave: cweave.o common.o
	$(LINK) $(LINKFLAGS) common.o cweave.o TO cweave

cweave.$(EXTENSION): cweave.w $(WCHANGES) $(HPATCH)
	$(CTANGLE) $(TFLAGS) cweave $(WCHANGES) cweave.$(EXTENSION)

cweave.o: cweave.$(EXTENSION) $(CATINCLUDE)cweb.h $(HPATCH)
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
	comm-doc.ch ctang-doc.ch cweav-doc.ch $(HPATCH) $(MCHANGES)
	$(CWEAVE) $(WFLAGS) common.w comm-doc.ch
	$(MAKE) common.dvi
	$(CWEAVE) $(WFLAGS) ctangle.w ctang-doc.ch
	$(MAKE) ctangle.dvi
	$(CWEAVE) $(WFLAGS) cweave.w cweav-doc.ch
	$(MAKE) cweave.dvi
	$(CWEAVE) $(WFLAGS) examples/wmerge.w $(MCHANGES)
	$(MAKE) wmerge.dvi

cwebmana.tex: cwebman.tex cwebman.ch
	$(TIE) -m cwebmana.tex cwebman.tex cwebman.ch

# the documentation change files are created automatically by the TIE
# processor from a set of separate change files.  note that not all
# change files listed above are actually used here, so you won't see
# any system-dependent parts not available under AmigaOS.
comm-doc.ch: common.w comm-patch.ch comm-ansi.ch comm-extensions.ch \
	comm-memory.ch comm-translation.ch comm-arexx.ch comm-output.ch \
	comm-man.ch comm-newpage.ch
	$(TIE) -c comm-doc.ch common.w \
	comm-patch.ch comm-ansi.ch comm-extensions.ch comm-memory.ch \
	comm-translation.ch comm-arexx.ch comm-output.ch \
	comm-man.ch comm-newpage.ch
ctang-doc.ch: ctangle.w ctang-patch.ch ctang-ansi.ch \
	ctang-memory.ch ctang-translation.ch ctang-output.ch \
	ctang-man.ch ctang-newpage.ch
	$(TIE) -c ctang-doc.ch ctangle.w \
	ctang-patch.ch ctang-ansi.ch ctang-memory.ch \
	ctang-translation.ch ctang-output.ch \
	ctang-man.ch ctang-newpage.ch
cweav-doc.ch: cweave.w cweav-patch.ch cweav-ansi.ch cweav-extensions.ch \
	cweav-memory.ch cweav-translation.ch cweav-output.ch \
	cweav-man.ch cweav-newpage.ch
	$(TIE) -c cweav-doc.ch cweave.w \
	cweav-patch.ch cweav-ansi.ch cweav-extensions.ch \
	cweav-memory.ch cweav-translation.ch cweav-output.ch \
	cweav-man.ch cweav-newpage.ch

# for making the documentation we will have to include the change files
ctangle.tex: ctangle.w $(TCHANGES) $(HPATCH)
	$(CWEAVE) $(WFLAGS) ctangle $(TCHANGES)

cweave.tex: cweave.w $(WCHANGES) $(HPATCH)
	$(CWEAVE) $(WFLAGS) cweave $(WCHANGES)

common.tex: common.w $(CCHANGES)
	$(CWEAVE) $(WFLAGS) common $(CCHANGES)

wmerge.tex: examples/wmerge.w $(MCHANGES)
	$(CWEAVE) $(WFLAGS) examples/wmerge $(MCHANGES)

# the master change files are created automatically by the TIE processor
# from a set of separate change files.  note that not all change files
# listed above are actually used here, so you should not try to port
# the resulting sources to MS/DOS (UNIX is fine, though).
$(CCHANGES): common.w comm-patch.ch comm-ansi.ch comm-extensions.ch \
	comm-memory.ch comm-translation.ch comm-arexx.ch comm-output.ch
	$(TIE) -c $(CCHANGES) common.w \
	comm-patch.ch comm-ansi.ch comm-extensions.ch comm-memory.ch \
	comm-translation.ch comm-arexx.ch comm-output.ch
$(HCHANGES): common.h comm-ansi.hch comm-extensions.hch comm-memory.hch \
	comm-translation.hch comm-arexx.hch comm-output.hch
	$(TIE) -c $(HCHANGES) common.h \
	comm-ansi.hch comm-extensions.hch comm-memory.hch \
	comm-translation.hch comm-arexx.hch comm-output.hch
$(HPATCH): common.h $(HCHANGES)
	$(TIE) -m $(HPATCH) common.h $(HCHANGES)
$(TCHANGES): ctangle.w ctang-patch.ch ctang-ansi.ch \
	ctang-memory.ch ctang-translation.ch ctang-output.ch
	$(TIE) -c $(TCHANGES) ctangle.w \
	ctang-patch.ch ctang-ansi.ch ctang-memory.ch \
	ctang-translation.ch ctang-output.ch
$(WCHANGES): cweave.w cweav-patch.ch cweav-ansi.ch cweav-extensions.ch \
	cweav-memory.ch cweav-translation.ch cweav-output.ch
	$(TIE) -c $(WCHANGES) cweave.w \
	cweav-patch.ch cweav-ansi.ch cweav-extensions.ch \
	 cweav-memory.ch cweav-translation.ch cweav-output.ch
$(MCHANGES): examples/wmerge.w wmerg-patch.ch wmerg-ansi.ch \
	wmerg-extensions.ch wmerg-memory.ch wmerg-output.ch
	$(TIE) -c $(MCHANGES) examples/wmerge.w \
	wmerg-patch.ch wmerg-ansi.ch wmerg-extensions.ch \
	wmerg-memory.ch wmerg-output.ch

# be sure to leave ctangle.$(EXTENSION) and common.$(EXTENSION)
# and $(HPATCH) for bootstrapping
clean:
	$(RM) \#?.(o|lnk|bak|log|dvi|pdf|toc|idx|scn)
	$(RM) common.tex cweave.tex cweave.$(EXTENSION) wmerge.$(EXTENSION)
	$(RM) ctangle.tex cweave ctangle cwebmana.tex wmerge.tex wmerge
	$(RM) \#?-p19.\#? \#?-doc.ch

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
	$(RM) $(SOURCES)
	$(RM) comm-amiga.ch comm-bs.ch comm-mac.ch comm-man.ch comm-os2.ch \
	comm-pc.ch comm-ql.ch comm-vms.ch common.c ctang-bs.ch \
	ctang-man.ch ctang-pc.ch ctang-ql.ch ctang-vms.ch ctangle.c \
	cweav-bs.ch cweav-man.ch cweav-pc.ch cweav-ql.ch cweav-vms.ch
	$(RM) cweb.1 cweb.el cwebmac.tex cwebman.tex \
	Makefile makefile.bs README readme.ql c++lib.w
	$(RM) examples/extex.w examples/kspell.el examples/Makefile \
	examples/oemacs.el examples/oemacs.w examples/README
	$(RM) examples/treeprint.w examples/wc.w examples/wc-dos.ch \
	examples/wmerge.c examples/wmerg-pc.ch examples/wmer-os2.ch \
	examples/wordtest.w examples/xlib_types.w examples/xview_types.w

# Remove the patch completely
remove: clean
	$(RM) $(COMMPATCH)
	$(RM) $(CTANGPATCH)
	$(RM) $(CWEAVPATCH)
	$(RM) $(WMERGPATCH)
	$(RM) $(PATCH)
	$(RM) $(AREXX) all
	$(RM) $(BIN) all
	$(RM) $(EXAMPLES)
	$(RM) $(INCLUDE) all
	$(RM) $(MACROS) all

# End of Makefile.sas
