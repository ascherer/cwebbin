Name: cwebbin
Version: 22p
Release: 6
Packager: Andreas Scherer <andreas@komputer.de>
Summary: The CWEBbin extension of the CWEB package
License: Public Domain
URL: http://www-cs-faculty.stanford.edu/~uno/cweb.html
Group: Productivity/Publishing/TeX/Base
Distribution: Kubuntu 12.04 (i386)
BuildRoot: %{_tmppath}/%{name}-%{version}-root
BuildArch: i386
#BuildRequires: texlive
# TeXlive comes with the 'tie' processor used in the build process
Source0: https://www.ctan.org/tex-archive/web/c_cpp/cweb/cweb-3.64ad.tar.gz
Source1: %{name}-%{version}.tar.bz2
Patch0: 0001-Makefile.unix-originates-from-Makefile.patch

%define texmf /opt/texlive/texmf-local

%description
The 'CWEBbin' package is an extension of the 'CWEB' package by Silvio Levy
and Donald Knuth for Literate Programming in C/C++.

%prep
%setup -c -q -a 1
%{__patch} -p1 -i %{PATCH0} -o Makefile.unix

%build
%{__touch} *.cxx
%{__ln_s} catalogs/dcweb.h cweb.h
%{__make} -f Makefile.unix boot cautiously all

%install
%{__rm} -rf $RPM_BUILD_ROOT
%{__mkdir_p} $RPM_BUILD_ROOT/%{texmf}/tex/generic/cweb
%{__cp} texinputs/* $RPM_BUILD_ROOT/%{texmf}/tex/generic/cweb
# cweb-3.65.tar.gz at least has an updated version number :-)
%{__cp} cwebmac.tex $RPM_BUILD_ROOT/%{texmf}/tex/generic/cweb
%{__mkdir_p} $RPM_BUILD_ROOT/usr/local/lib/cweb
%{__cp} c++lib.w $RPM_BUILD_ROOT/usr/local/lib/cweb
%{__mkdir_p} $RPM_BUILD_ROOT/usr/local/bin
%{__cp} ctangle cweave wmerge $RPM_BUILD_ROOT/usr/local/bin

%clean
%{__rm} -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%{texmf}/tex/generic/cweb/
%dir %{texmf}/tex/generic
%{_usr}/local/lib/cweb/c++lib.w
%{_usr}/local/bin/ctangle
%{_usr}/local/bin/cweave
%{_usr}/local/bin/wmerge

%post
%{__texhash}

%postun
%{__texhash}

%changelog
* Thu Oct 29 2015 Andreas Scherer <andreas_tex@freenet.de> 22p-6
- Fully parametrized specfile
* Mon Sep 28 2015 Andreas Scherer <andreas_tex@freenet.de> 22p-5
- Create Makefile.unix from Makefile
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
