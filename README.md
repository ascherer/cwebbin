# literate programming in ansi-c/c++

*cwebbin* is the ansi-c/c++ implementation of silvio levy's and donald e.
knuth's [cweb system](http://www-cs-faculty.stanford.edu/~uno/cweb.html)
and donald e. knuth's [ctwill program](ftp://ftp.cs.stanford.edu/pub/ctwill).
it requires the contents of [the original *cweb* source
drop](http://ftp.cs.stanford.edu/pub/cweb/cweb-3.64c.tar.gz) and [the secondary
*ctwill* source drop](http://ftp.cs.stanford.edu/pub/ctwill/ctwill.tar.gz), to
which it applies a set of change files to fix warnings issued by modern c/c++
compilers and to introduce advanced features. see the extensive
[readme](README.txt) for the full story.

**NOTE:** the link to the *ctwill* tarball on the stanford cs server seems to
be broken at this time; luckily, the [source package for
cwebbin](https://github.com/ascherer/cwebbin/releases/download/cwebbin-2019/cwebbin-2019-17.sdeb)
contains the original 2000 `ctwill.tar.gz` (among other things). you can
extract the contents of this package with `pax -rzf cwebbin-2019-17.sdeb`.

extract `cwebbin-2019.tar.gz` and add the contents of `cweb-3.64c.tar.gz` and
`ctwill.tar.gz` for the full set of source files.  unix/linux users should work
with [`make -f Makefile.unix`](Makefile.unix) exclusively (targets `boot`,
`cautiously`, and `all`).

## advanced packaging

alternatively, you may want to use *rpmbuild* or *debbuild* for compiling the
sources and for creating installable packages in *rpm* and *deb* format. clone
[cweb](https://github.com/ascherer/cweb) and
[cwebbin](https://github.com/ascherer/cwebbin), create the source drops with
```
git archive -o cweb-3.64c.tar.gz cweb-3.64c
git archive -o cwebbin-2019.tar.gz cwebbin-2019
```
respectively, put these two tarballs and the original `ctwill.tar.gz` (see
**note** above) in the *SOURCES* directory and `cwebbin.spec` in the *SPECS*
directory of your build arena, and run
```
rpmbuild -ba SPECS/cwebbin.spec
debbuild -ba SPECS/cwebbin.spec
```
depending on your preferences.

## plain vanilla cweb (deprecated)

if all you want is the original cweb without any add-ons but minus heaps of
compiler warnings, use the special option `--with ansi_only` to include only
the minimal changes required for a clean compilation.
```
rpmbuild -ba SPECS/cwebbin.spec --with ansi_only
debbuild -ba SPECS/cwebbin.spec --with ansi_only
```

## cweb for texlive (new!)

the extended sources and the build system were modified to smoothly integrate
with the [texlive build system](https://github.com/TeX-Live/texlive-source).
by invoking
```
debbuild -bi SPECS/cwebbin.spec --with texlive
```
you receive a small tarball `cweb-texlive.tar.gz`, which should be extracted in
texlive's source directory `texk/web2c/cwebdir`. this tarball contains
`*-w2c.ch` files that modify the original cweb sources for the texlive
ecosystem.  additionally, it contains language catalogs, tex macros, and cweb
include files.
