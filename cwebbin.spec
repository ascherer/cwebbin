# 'make fullmanual' requires TeX (pdflatex).
# use '--without tex' to exclude this step; default is 'with'.
%bcond_without tex
# By default CWEB and CWEBBIN are compiled and linked with optimization
# switched on. Use '--with debuginfo' to switch debugging on.
%bcond_with debuginfo
# Apply only the set of ANSI changes.
%bcond_with ansi_only

Name: cwebbin
Summary: The CWEBbin extension of the CWEB package
License: Public Domain
URL: http://www-cs-faculty.stanford.edu/~uno/cweb.html
Packager: Andreas Scherer <https://ascherer.github.io>

%if %{_vendor} == "debbuild"
Group: tex
Distribution: Kubuntu 16.04 (x86_64)
%if %{with tex}
BuildRequires: texlive
Requires: texlive
%endif
%else
Group: Productivity/Publishing/TeX/Base
Distribution: openSUSE 42 (x86_64)
%global __touch /usr/bin/touch
%endif
BuildRoot: %{_tmppath}/%{name}-%{version}-root

Source0: https://www.ctan.org/tex-archive/web/c_cpp/cweb/cweb-3.64ai.tgz
%if %{with ansi_only}
Version: 3.64ai
Release: ansi
Source1: %{name}-22p.tar.gz
%else
Version: 22p
Release: 10
Source1: %{name}-%{version}.tar.gz
%endif

%define texmf /opt/texlive/texmf-local

%description
The 'CWEBbin' package is an extension of the 'CWEB' package by Silvio Levy
and Donald Knuth for Literate Programming in C/C++.

%prep
%autosetup -c -a1
%{!?with_tex:%{__sed} "s/wmerge fullmanual/wmerge # fullmanual/" -i Makefile.unix}
%if ! %{with debuginfo}
%{__sed} "s/CFLAGS = -g/CFLAGS = -O/" -i Makefile.unix
%{__sed} "s/LINKFLAGS = -g/LINKFLAGS = -s/" -i Makefile.unix
%endif
%if %{with ansi_only}
%{__sed} -i Makefile.unix -e \
"/CHANGES):/{N;s/\(.*: [a-z.\/]*\)\( .*\)\? \(.*ansi[.ch]*\).*/\1 \3/}"
%endif

%build
%{__touch} *.cxx
%{__ln_s} catalogs/dcweb.h cweb.h
%{__make} -f Makefile.unix -e PDFTEX=pdftex boot cautiously all

%install
%{__rm} -rf %{buildroot}
%if %{with tex}
%{__mkdir_p} %{buildroot}%{texmf}/tex/generic/cweb
%{__cp} texinputs/* %{buildroot}%{texmf}/tex/generic/cweb
# cweb-3.65.tar.gz at least has an updated version number :-)
%{__cp} cwebmac.tex %{buildroot}%{texmf}/tex/generic/cweb
%endif
%{__mkdir_p} %{buildroot}%{_libdir}/cweb
%{__cp} c++lib.w %{buildroot}%{_libdir}/cweb
%{__mkdir_p} %{buildroot}%{_bindir}
%{__cp} ctangle cweave wmerge %{buildroot}%{_bindir}

%clean

%files
%defattr(644,root,root,755)
%{?with_tex:%{texmf}/tex/generic/cweb/}
%{_libdir}/cweb/c++lib.w
%attr(755,root,root) %{_bindir}/ctangle
%attr(755,root,root) %{_bindir}/cweave
%attr(755,root,root) %{_bindir}/wmerge

%post
%{?with_tex:%{__texhash}}

%postun
%{?with_tex:%{__texhash}}

%changelog
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
