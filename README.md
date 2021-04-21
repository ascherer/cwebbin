# literate programming in ansi-c/c++

*cwebbin* is an extension of silvio levy's and donald e. knuth's
[cweb system](http://www-cs-faculty.stanford.edu/~uno/cweb.html)
and donald e. knuth's [ctwill program](ftp://ftp.cs.stanford.edu/pub/ctwill).
it requires the contents of [the original *cweb* source
drop](https://github.com/ascherer/cweb/releases/download/cweb-4.3/cweb-4.3.tar.gz)
and [the secondary *ctwill* source
drop](http://ftp.cs.stanford.edu/pub/ctwill/ctwill.tar.gz), to which it applies
a set of change files to introduce advanced features. see the extensive
[readme](README.txt) for the full story.

extract `cwebbin-2021.3.tar.gz` and add the contents of `cweb-4.3.tar.gz` and
`ctwill.tar.gz` for the full set of source files.  unix/linux users should work
with [`make -f Makefile.unix`](Makefile.unix) exclusively (targets `boot`,
`cautiously`, and `all`).

## feature list

* includes **ctwill** and its utilities;
* **internationalization** with the “GNU `gettext` utilities”;
* **temporary file output**: output is only written when different to former run; can be suppressed with new option `-c`;
* [only `cweave` and `ctwill`] option `-l` to change the first line in the tex output; options `-i` and `-o` for slightly customizable code layout;
* [only `ctangle`] output can be redirected to `@(/dev/{stdout,stderr,null}@>`;
* [only in “tex live”] file lookup with the **kpathsea** library.

## advanced packaging

alternatively, you may want to use *rpmbuild* or *debbuild* for compiling the
sources and for creating installable packages in *rpm* and *deb* format. clone
[cweb](https://github.com/ascherer/cweb) and
[cwebbin](https://github.com/ascherer/cwebbin), create the source drops with
```
git archive -o cweb-4.3.tar.gz cweb-4.3
git archive -o cwebbin-2021.3.tar.gz cwebbin-2021.3
```
respectively, put these two tarballs and the original `ctwill.tar.gz` in the
*SOURCES* directory and `cwebbin.spec` in the *SPECS* directory of your build
arena, and run
```
{deb|rpm}build -ba SPECS/cwebbin.spec
```
depending on your preferences.

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
[subversion equivalent](https://tug.org/svn/texlive/trunk/Build/source)).
this tarball contains `*-w2c.ch` files that modify the original cweb sources
for the texlive ecosystem.  additionally, it contains language catalogs, tex
macros, and cweb include files.
