# 'make fullmanual' requires TeX (pdflatex).
# use '--without doc' to exclude this step; default is 'with'.
%bcond_without doc
# By default CWEB and CWEBBIN are compiled and linked with optimization
# switched on. Use '--with debuginfo' to switch debugging on.
%bcond_with debuginfo
# Apply only the set of ANSI changes.
%bcond_with ansi_only
# Prepare CWEBbin as base for TeXLive.
%bcond_with texlive

Name: cwebbin
Summary: The CWEBbin extension of the CWEB package
License: Public Domain
URL: http://www-cs-faculty.stanford.edu/~uno/cweb.html
Packager: Andreas Scherer <https://ascherer.github.io>

%if %{_vendor} == "debbuild"
Group: tex
Distribution: Kubuntu 16.04 (x86_64)
Requires: texlive
%if %{with doc}
BuildRequires: texlive
%endif
%else
Group: Productivity/Publishing/TeX/Base
Distribution: openSUSE 42 (x86_64)
%global __touch /usr/bin/touch
%endif
BuildRoot: %{_tmppath}/%{name}-%{version}-root

Source0: https://www.ctan.org/tex-archive/web/c_cpp/cweb/cweb-3.64c.tar.gz
Source1: %{name}-2018.tar.gz

Patch: 0001-Update-CWEBbin-manpage.patch

%if %{with ansi_only}
Version: 3.64c
Release: ansi
%else
Version: 2018
Release: 13
%endif

%define texmf /opt/texlive/texmf-local

%global texlive_source %{getenv:HOME}/Work/tmp/texlive-source/
%global cwebdir %{?texlive_source}texk/web2c/cwebdir

%global __make %{__make} -f Makefile.unix \\\
	-e PDFTEX=pdftex \\\
	-e TEXMFDIR=%{texmf} \\\
	-e CWEBINPUTS=%{_libdir}/cweb

%description
The 'CWEBbin' package is an extension of the 'CWEB' package by Silvio Levy
and Donald Knuth for Literate Programming in C/C++.

%package texlive
Summary: Integrate %{name} with Web2c/TeXLive.
BuildArch: noarch

%description texlive
The 'CWEBbin' package is used as an interface layer between the original CWEB
sources and the TeXLive ecosystem. By collecting all active changefiles in a
small set of '*-w2c.ch' files, almost no changes to the texlive-sources are
necessary. Only a few extra files are added. Infrastructure adaptions are made
upstream, i.e., in 'texlive-source'.

%prep
%autosetup -c -a1

%if %{with texlive}
%{__make} -e CCHANGES=comm-w2c.ch comm-w2c.ch
%{__make} -e TCHANGES=ctang-w2c.ch ctang-w2c.ch
%{__make} -e WCHANGES=cweav-w2c.ch cweav-w2c.ch
%else
%{__sed} -e "s/lation.ch .*-texlive.ch/lation.ch/" -i Makefile.unix
%{__sed} -e "s/lation.hch .*-texlive.hch/lation.hch/" -i Makefile.unix
%endif

%{!?with_doc:%{__sed} -e "s/wmerge fullmanual/wmerge # fullmanual/" -i Makefile.unix}

%if ! %{with debuginfo}
%{__sed} -e "s/CFLAGS = -g/CFLAGS = -O/" -i Makefile.unix
%{__sed} -e "s/LINKFLAGS = -g/LINKFLAGS = -s/" -i Makefile.unix
%endif

%if %{with ansi_only}
%{__sed} -i Makefile.unix -e \
"/CHANGES):/{N;s/\(.*: [a-z.\/]*\)\( .*\)\? \(.*ansi[.ch]*\).*/\1 \3/}"
%{?with_doc:%{__sed} -e "s/wmerge fullmanual/wmerge docs/" -i Makefile.unix}
%endif

%build
%{__touch} *.cxx
%{__make} boot cautiously all

%install
%{__rm} -rf %{buildroot}

%make_install

%{__install} -d %{buildroot}%{_datadir}/locale/de/LC_MESSAGES \
	%{buildroot}%{_datadir}/locale/it/LC_MESSAGES
%{__install} -m 644 po/de/cweb.mo %{buildroot}%{_datadir}/locale/de/LC_MESSAGES
%{__install} -m 644 po/it/cweb.mo %{buildroot}%{_datadir}/locale/it/LC_MESSAGES

%if %{with texlive}
%{__install} -d %{buildroot}%{cwebdir}/catalogs
%{__install} -m 644 *-w2c.ch %{buildroot}%{cwebdir}
%{__install} -m 644 comm-foo.h %{buildroot}%{cwebdir}
%{__install} -m 644 catalogs/cweb.h %{buildroot}%{cwebdir}/catalogs
%{__install} -m 644 texinputs/* %{buildroot}%{cwebdir}
%{__install} -m 644 cwebinputs/* %{buildroot}%{cwebdir}
%endif

%files
%defattr(-,root,root,-)
%{_bindir}/*
%{_datadir}/emacs/site-lisp/cweb.el
%{_libdir}/cweb/*
%{_mandir}/man1/*
%{texmf}/tex/plain/cweb/*
%{_datadir}/locale/de/LC_MESSAGES/cweb.mo
%{_datadir}/locale/it/LC_MESSAGES/cweb.mo

%if %{with texlive}
%files texlive
%{cwebdir}/catalogs/cweb.h
%{cwebdir}/comm-foo.h
%{cwebdir}/comm-w2c.ch
%{cwebdir}/ctang-w2c.ch
%{cwebdir}/cweav-w2c.ch
%{cwebdir}/c++1xlib.w
%{cwebdir}/iso_types.w
%{cwebdir}/Xcwebmac.tex
%{cwebdir}/dcwebmac.tex
%{cwebdir}/fcwebmac.tex
%{cwebdir}/icwebmac.tex
%endif

%post
%{__texhash}

%postun
%{__texhash}

%changelog
* Fri Nov 09 2018 Andreas Scherer <https://ascherer.github.io>
- Add internationalization (i18n)

* Mon Nov 05 2018 Andreas Scherer <https://ascherer.github.io>
- Create package 'texlive' for integration with TeXLive

* Sun Feb 19 2017 Andreas Scherer <https://ascherer.github.io>
- Update for the 2017 sources

* Tue Mar 08 2016 Andreas Scherer <https://ascherer.github.io>
- Prepare release for CTAN/Web2c/TeX Live

* Tue Feb 23 2016 Andreas Scherer <https://ascherer.github.io>
- Update for the updated 2016 sources

* Sun Jan 31 2016 Andreas Scherer <https://ascherer.github.io>
- Update for the 2016 sources

* Sat Jan 09 2016 Andreas Scherer <https://ascherer.github.io>
- Conditional Build Stuff for non-TeX systems

* Thu Oct 29 2015 Andreas Scherer <andreas_tex@freenet.de> 22p-5
- Fully parametrized specfile

* Sat Aug 22 2015 Andreas Scherer <andreas_tex@freenet.de> 22p-4
- Put the TeX stuff into the correct 'local texmf tree'

* Sat Aug 15 2015 Andreas Scherer <andreas_tex@freenet.de> 22p-3
- Provide consistent information in URL and Source0

* Mon Jul 06 2015 Andreas Scherer <andreas_tex@freenet.de> 22p-2
- Use a simpler %prep section

* Thu Aug 18 2011 Andreas Scherer <andreas_tex@freenet.de> 22p-1
- Compile the package on Kubuntu 10.04

* Sat Apr 21 2007 Andreas Scherer <andreas_tug@freenet.de> p21-4
- Update for the 2006 sources

* Sun Dec 18 2005 Andreas Scherer <andreas_tug@freenet.de> p21-3
- Install (and hide) cwebmac.tex

* Fri Nov 04 2005 Andreas Scherer <andreas_tug@freenet.de> p21-2
- Build from two source archives (CWEBbin + cweb)

* Sat Oct 29 2005 Andreas Scherer <andreas_tug@freenet.de> p21-1
- Initial build
