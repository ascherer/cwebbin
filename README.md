# literate programming in ansi-c/c++

cwebbin is the ansi-c/c++ implementation of silvio levy's and donald ervin
knuth's [cweb system](http://www-cs-faculty.stanford.edu/~uno/cweb.html). it
requires the contents of [the original source
drop](ftp://ftp.cs.stanford.edu/pub/cweb/cweb-3.64ad.tar.gz), to which it
applies a set of patches to fix warnings issued by modern c/c++ compilers and
to introduce advanced features. see the extensive [readme](README.22p) for the
full story. unix/linux  users should work with [make -f
Makefile.unix](Makefile.unix) exclusively (targets ‘boot,’ ‘cautiously,’ and
‘all’).
