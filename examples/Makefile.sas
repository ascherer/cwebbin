#
# Makefile for the example programs EXTEX, OEMACS, TREEPRINT, WC and
# WORDTEST from the original CWEB package.
# Additionally there are the three example programs COMMONWORDS, PRIMES,
# and SAMPLE.  These are originally WEB programs by Donald E. Knuth and
# were translated into CWEB for eductational purposes.
# And there is the example program MATRIX.  This is the first attempt of
# C++ programming in connection with the features of CWEB 3 for German
# users.  The program CCT translates text files between different
# character code tables.
# The routines below are suitable for the SAS/C Amiga compiler 6.x by
# SAS Institute Inc., Cary NC.
#
# March 16, 1995, Andreas Scherer.
#

CFLAGS = cpu=ANY math=STANDARD optimize nostackcheck define=_STRICT_ANSI

.SUFFIXES: .tex .dvi .w

.w.tex:
	cweave -f $*
.tex.dvi:
	virtex &plain "\\language=\\USenglish \\input " $*
.w.c:
	ctangle $*
.c.o:
	sc $(CFLAGS) $*.c

PRG = cct cctsetup commonwords extex matrix primes bigprimes \
	sample treeprint wc wordtest

all: $(PRG)

docs: cct.dvi commonwords.dvi extex.dvi oemacs.dvi primes.dvi bigprimes.dvi\
	sample.dvi treeprint.dvi wc.dvi wordtest.dvi

cct: cct.o
	slink FROM lib:c.o cct.o TO cct LIB lib:sc.lib NOICONS
cct.o: cct.c
cct.c: cct.w
cct.dvi: cct.tex
cct.tex: cct.w

cctsetup: cctsetup.o
	slink FROM lib:c.o cctsetup.o TO cctsetup LIB lib:sc.lib NOICONS
cctsetup.o: cct.c
	sc $(CFLAGS) cctsetup.c

commonwords: commonwords.o
	slink FROM lib:c.o commonwords.o TO commonwords LIB lib:sc.lib NOICONS
commonwords.o: commonwords.c
	sc $(CFLAGS) data=FAR commonwords.c
commonwords.c: commonwords.w
commonwords.dvi: commonwords.tex
commonwords.tex: commonwords.w

extex: extex.o
	slink FROM lib:c.o extex.o TO extex LIB lib:sc.lib NOICONS
extex.o: extex.c
extex.c: extex.w extex-ansi.ch
	ctangle extex.w extex-ansi.ch
extex.dvi: extex.tex
extex.tex: extex.w extex-ansi.ch
	cweave -f extex.w extex-ansi.ch

matrix: matrix.o
	slink FROM lib:c.o matrix.o TO matrix LIB lib:scm.lib lib:sc.lib NOICONS
matrix.o: matrix.cxx
matrix.cxx: matrix.wxx
	ctangle matrix.wxx - matrix.cxx
matrix.dvi: matrix.tex
matrix.tex: matrix.wxx
	cweave -f +ld matrix.wxx

oemacs: oemacs.o
	slink FROM lib:c.o oemacs.o TO oemacs LIB lib:sc.lib NOICONS
oemacs.o: oemacs.c
oemacs.c: oemacs.w
oemacs.dvi: oemacs.tex
oemacs.tex: oemacs.w

primes: primes.o
	slink FROM lib:c.o primes.o TO primes LIB lib:sc.lib NOICONS
primes.o: primes.c
primes.c: primes.w
primes.dvi: primes.tex
primes.tex: primes.w

bigprimes: bigprimes.o
	slink FROM lib:c.o bigprimes.o TO bigprimes LIB lib:sc.lib NOICONS
bigprimes.o: bigprimes.c
bigprimes.c: primes.w primes-ansi.ch
	ctangle primes primes bigprimes
bigprimes.dvi: bigprimes.tex
bigprimes.tex: primes.w primes-ansi.ch
	cweave -f primes primes bigprimes

primereader: bigprimes bigprimes.c
	sc link noicons optimize primereader.c

sample: sample.o
	slink FROM lib:c.o sample.o TO sample LIB lib:sc.lib lib:scm.lib NOICONS
sample.o: sample.c
sample.c: sample.w
sample.dvi: sample.tex
sample.tex: sample.w

treeprint: treeprint.o
	slink FROM lib:c.o treeprint.o TO treeprint LIB lib:sc.lib NOICONS
treeprint.o: treeprint.c
treeprint.c: treeprint.w treeprint-ansi.ch
	ctangle treeprint.w treeprint-ansi.ch
treeprint.dvi: treeprint.tex
treeprint.tex: treeprint.w treeprint-ansi.ch
	cweave -f treeprint.w treeprint-ansi.ch

wc: wc.o
	slink FROM lib:c.o wc.o TO wc LIB lib:sc.lib NOICONS
wc.o: wc.c
wc.c: wc.w wc-ansi.ch
	ctangle wc.w wc-ansi.ch
wc.dvi: wc.tex
wc.tex: wc.w wc-ansi.ch
	cweave -f wc.w wc-ansi.ch

wordtest: wordtest.o
	slink FROM lib:c.o wordtest.o TO wordtest LIB lib:sc.lib NOICONS
wordtest.o: wordtest.c
wordtest.c: wordtest.w wordtest-ansi.ch
	ctangle wordtest.w wordtest-ansi.ch
wordtest.dvi: wordtest.tex
wordtest.tex: wordtest.w wordtest-ansi.ch
	cweave -f wordtest.w wordtest-ansi.ch

clean:
	- delete \#?.(o|lnk|bak|dvi|tex|toc|log|c|cxx|idx|scn)

veryclean: clean
	- delete $(PRG) primereader \#?.(cct|out)
