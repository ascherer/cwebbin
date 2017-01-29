# literate programming in ansi-c/c++

*cwebbin* is the ansi-c/c++ implementation of silvio levy's and donald ervin
knuth's [cweb system](http://www-cs-faculty.stanford.edu/~uno/cweb.html). it
requires the contents of [the original source
drop](https://www.ctan.org/tex-archive/web/c_cpp/cweb/cweb.tar.gz), to
which it applies a set of change files to fix warnings issued by modern c/c++
compilers and to introduce advanced features. see the extensive
[readme](README.22p) for the full story.

extract *cwebbin-22p.tar.gz* and add the contents of *cweb-3.64ai.tar.gz* for
the full set of source files.  unix/linux  users should work with
[make -f Makefile.unix](Makefile.unix) exclusively (targets ‘boot,’
‘cautiously,’ and ‘all’).

alternatively, you may want to use *rpmbuild* or *debbuild* for compiling the
sources and for creating installable packages in *rpm* and *deb* format. clone
[cweb](https://github.com/ascherer/cweb) and
[cwebbin](https://github.com/ascherer/cwebbin), create the source drops with
```
git archive -o cweb-3.64ai.tgz cweb-3.64ai
git archive -o cwebbin-22p.tar.gz cwebbin-22p
```
respectively, put these two tarballs in the *SOURCES* directory and
*cwebbin.spec* in the *SPECS* directory of your build arena, and run
```
rpmbuild -ba SPECS/cwebbin.spec
debbuild -ba SPECS/cwebbin.spec
```
depending on your preferences.

if all you want is plain vanilla cweb without any add-ons and minus heaps of
compiler warnings, use the special option `--with ansi_only` to include only
the minimal changes required for a clean compilation.
```
rpmbuild -ba SPECS/cwebbin.spec --with ansi_only
debbuild -ba SPECS/cwebbin.spec --with ansi_only
```
