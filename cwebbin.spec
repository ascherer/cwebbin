Name: cwebbin
Version: 22p
Release: 4
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

%define texlive /opt/texlive/current/bin/i386-linux
%define texmf /opt/texlive/texmf-local

%description
The 'CWEBbin' package is an extension of the 'CWEB' package by Silvio Levy
and Donald Knuth for Literate Programming in C/C++.

%prep
%setup -c -q
%setup -D -q -T -a 1

%build
touch *.cxx
ln -s catalogs/dcweb.h cweb.h
make -f Makefile.unix boot cautiously all

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{texmf}/tex/generic/cweb
cp texinputs/* $RPM_BUILD_ROOT/%{texmf}/tex/generic/cweb
# cweb-3.65.tar.gz at least has an updated version number :-)
cp cwebmac.tex $RPM_BUILD_ROOT/%{texmf}/tex/generic/cweb
mkdir -p $RPM_BUILD_ROOT/usr/local/lib/cweb
cp c++lib.w $RPM_BUILD_ROOT/usr/local/lib/cweb
mkdir -p $RPM_BUILD_ROOT/usr/local/bin
cp ctangle cweave wmerge $RPM_BUILD_ROOT/usr/local/bin

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%{texmf}/tex/generic/cweb/
%dir %{texmf}/tex/generic
/usr/local/lib/cweb/c++lib.w
/usr/local/bin/ctangle
/usr/local/bin/cweave
/usr/local/bin/wmerge

%post
%{texlive}/texhash

%postun
%{texlive}/texhash

%changelog
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
