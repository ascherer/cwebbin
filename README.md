# literate programming in ansi-c/c++

*cwebbin* is an extension of silvio levy's and donald e. knuth's
[cweb system](http://www-cs-faculty.stanford.edu/~uno/cweb.html)
and donald e. knuth's [ctwill program](http://ftp.cs.stanford.edu/pub/ctwill).
it requires the contents of [the original *cweb* source
drop](https://github.com/ascherer/cweb/releases/download/cweb-4.10/cweb-4.10.tar.gz)
and [the secondary *ctwill* source
drop](http://ftp.cs.stanford.edu/pub/ctwill/ctwill.tar.gz), to which it applies
a set of change files to introduce advanced features. see the extensive
[readme](README.txt) for the full story.

## feature list

* includes **ctwill** and its utilities;
* **internationalization** with the “GNU `gettext` utilities”;
* **temporary file output**: check output for differences from former run with
  new option `+c`;
* [only `cweave` and `ctwill`] option `-l` to change the first line in the tex
  output; options `-i` and `-o` for slightly customizable code layout;
* [only `ctangle`] output can be redirected to `@(/dev/{stdout,stderr,null}@>`;
* [only in “tex live”] file lookup with the **kpathsea** library.

## manual compilation

extract `ctwill.tar.gz` and add the contents of `cweb-4.10.tar.gz` (overwriting
outdated source files `Makefile`, `common.h`, `common.w`, and `prod.w`) and
`cwebbin-2023.tar.gz` for the full set of source files.
replace `@@VERSION@@` in line 129 of the `Makefile.unix` with something like
`Version 4.10 [CWEBbin 2023]`.
`touch *.cxx`.
unix/linux users should work with [`make -f Makefile.unix`](Makefile.unix)
exclusively (targets `boot`, `cautiously`, and `all`).
macos/bsd users will have to adapt `Makefile.unix` in several spots to make
things work.

## advanced packaging

alternatively, you may want to use
[rpmbuild](https://github.com/rpm-software-management/rpm) or
[debbuild](https://github.com/debbuild/debbuild) for compiling the sources and
for creating installable packages in *rpm* and *deb* format.
set up your *build arena* with `mkdir BUILD BUILDROOT RPMS SOURCES SPECS SRPMS`
for *rpmbuild* (plus `mkdir DEBS SDEBS` for *debbuild*).

clone
[cweb](https://github.com/ascherer/cweb) and
[cwebbin](https://github.com/ascherer/cwebbin), create the source drops with
```
git archive -o cweb-4.10.tar.gz cweb-4.10
git archive -o cwebbin-2023.tar.gz cwebbin-2023.2
```
respectively, put these two tarballs and the original `ctwill.tar.gz` in the
*SOURCES* directory, add the patch files
* `0001-Support-extended-syntax-for-numeric-literals.patch`
* `0002-Purge-redundant-TeX-macro.patch`
* `0003-Adapt-to-CWEB-4.5.patch`
* `0004-Add-silent-datecontentspage-macro.patch`
* `0005-Update-CTWILL-macros-for-CWEB-4.9.patch`

to *SOURCES* also, and place `cwebbin.spec` in the *SPECS* directory of your
build arena.

the five patch files upgrade the *ctwill* macros for modern cweb. originally,
they come from branch
[update-macros-for-cweb-4](https://github.com/ascherer/ctwill/tree/update-macros-for-cweb-4)
and can be recreated by `git format-patch master` in the archived
[ctwill project](https://github.com/ascherer/ctwill).

depending on your preferences run the magic incantation
```
{deb|rpm}build -ba SPECS/cwebbin.spec
```

## cweb for texlive

the extended sources and the build system were modified to smoothly integrate
with the [texlive build system](https://github.com/TeX-Live/texlive-source).
by invoking
```
{deb|rpm}build -bi SPECS/cwebbin.spec --with texlive
```
you receive a small tarball `cweb-texlive.tar.gz`, which should be extracted in
texlive's source directory
[`texlive-source`](https://github.com/TeX-Live/texlive-source) (or the
[subversion equivalent](https://tug.org/svn/texlive/trunk/Build/source)) with
```
cd /path/to/texlive-source
pax -rzf /path/to/cweb-texlive.tar.gz
```

this tarball contains `*-w2c.ch` files that modify the original cweb sources
for the texlive ecosystem.  additionally, it contains language catalogs, tex
macros, and cweb include files.

updated versions of **cweb** are added to the texlive source tree with
```
cd /path/to/texlive-source/texk/web2c/cwebdir
pax -rzf /path/to/cweb-4.10.tar.gz
```
