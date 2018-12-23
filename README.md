# literate programming in ansi-c/c++

*cwebbin* is the ansi-c/c++ implementation of silvio levy's and donald ervin
knuth's [cweb system](http://www-cs-faculty.stanford.edu/~uno/cweb.html). it
requires the contents of [the 3.65 source
drop](https://github.com/ascherer/cwebbin/tree/cweb-3.65), to which it adds
some advanced features. see the extensive [readme](README.txt) for the full
story.

extract *cwebbin-2018.tar.gz* and add the contents of *cweb-3.65.tar.gz* for
the full set of source files.  unix/linux users should work with
[make -f Makefile.unix](Makefile.unix) exclusively (targets ‘boot,’
‘cautiously,’ and ‘all’).

## advanced packaging

alternatively, you may want to use *rpmbuild* or *debbuild* for compiling the
sources and for creating installable packages in *rpm* and *deb* format. clone
[cweb](https://github.com/ascherer/cweb) and
[cwebbin](https://github.com/ascherer/cwebbin), create the source drops with
```
git archive -o cweb-3.65.tar.gz cweb-3.65
git archive -o cwebbin-2018.tar.gz cwebbin-2018
```
respectively, put these two tarballs in the *SOURCES* directory and
*cwebbin.spec* in the *SPECS* directory of your build arena, and run
```
rpmbuild -ba SPECS/cwebbin.spec
debbuild -ba SPECS/cwebbin.spec
```
depending on your preferences.

## cweb for texlive

in a [recent
effort](https://github.com/ascherer/texlive-source/tree/integrate-cwebbin-in-texlive),
the extended sources and the build system were modified to smoothly integrate
with the texlive build system. by invoking
```
debbuild -bi SPECS/cwebbin.spec --with texlive
```
you receive a small tarball `cweb-texlive.tar.gz`, which should be extracted in
texlive's source directory `texk/web2c/cwebdir`. this tarball contains
`*-w2c.ch` files that modify the original cweb sources for the texlive
ecosystem.  additionally, it contains language catalogs, tex macros, and cweb
include files.
