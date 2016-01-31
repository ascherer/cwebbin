# literate programming in ansi-c/c++

cwebbin is the ansi-c/c++ implementation of silvio levy's and donald ervin
knuth's [cweb system](http://www-cs-faculty.stanford.edu/~uno/cweb.html). it
requires the contents of [the original source
drop](https://www.ctan.org/tex-archive/web/c_cpp/cweb/cweb-3.64ae.tar.gz), to
which it applies a set of patches to fix warnings issued by modern c/c++
compilers and to introduce advanced features. see the extensive
[readme](README.22p) for the full story. unix/linux  users should work with
[make -f Makefile.unix](Makefile.unix) exclusively (targets ‘boot,’
‘cautiously,’ and ‘all’).

if all you want is plain vanilla cweb without any add-ons and minus heaps of
compiler warnings, switch to the
[cweb-ansi](https://github.com/ascherer/cwebbin/tree/cweb-ansi) branch.
