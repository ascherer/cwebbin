% CWEB(1) Web2c @VERSION@ | General Commands Manual
%
% June 20, 2019

# NAME

ctangle, cweave -- translate CWEB to C/C++ and/or \TeX

# SYNOPSIS

**ctangle** [_options_] _webfile_[.w] [{_changefile_[.ch]|-} [_outfile_[.c]]] \
**cweave** [_options_] _webfile_[.w] [{_changefile_[.ch]|-} [_outfile_[.tex]]]

# DESCRIPTION

The **ctangle** program converts a CWEB source document into a C/C++\ program
that may be compiled in the usual way.  The output file includes **#line**
specifications so that debugging can be done in terms of the CWEB source file.

The **cweave** program converts the same CWEB file into a \TeX\ file that may be
formatted and printed in the usual way.  It takes appropriate care of
typographic details like page layout and the use of indentation, _italics_,
**boldface**, etc., and it supplies extensive cross-index information that it
gathers automatically.

CWEB allows you to prepare a single document containing all the information
that is needed both to produce a compilable C/C++\ program and to produce a
well-formatted document describing the program in as much detail as the writer
may desire.  The user of CWEB ought to be familiar with \TeX\ as well as C/C++.

# USAGE

The command line should have one, two, or three names on it.  The first is
taken as the CWEB input file (and **.w** is added if there is no extension).
If there is a second name, it is a change file (and **.ch** is added if there
is no extension).  The change file overrides parts of the CWEB file, as
described in the documentation.
If there is a third name, it overrides the default name of the output file,
which is ordinarily the same as the name of the input file (but on the current
directory) with the extension **.tex**.
If you just want to change the output file name, but don't have a change file
to apply, you can use '**-**' as the second argument.

# DIFFERENCES TO ORIGINAL CWEB

CWEBbin tries hard to be a drop-in replacement for CWEB, so in general you
should not notice any differences in invoking the programs nor in the
resulting output.  There are, however, a few differences worth noting:

* Options **\-\-help**, **\-\-quiet**, **\-\-verbose**, **\-\-version**, and
  flags **-i**, **-o**, and **+lX** are new in CWEBbin and \TeX\ Live.
* Option **+lX** is accompanied by several wrapper files for **cwebmac.tex**
  with translated captions for German (**+ld**), French (**+lf**), and
  Italian (**+li**).
* CWEB in \TeX\ Live operates silently by default (as of 2019); use the
  **\-\-verbose** option to get the original behavior.
* File lookup with the environment variable `CWEBINPUTS` is extended to permit
  several, colon-separated, paths.
* If properly configured, the main programs **ctangle** and **cweave** are
  localized with the "GNU gettext utilities".

# OPTIONS

Options on the command line may be either turned off with '**-**' (if they
are on by default) or turned on with '**+**' (if they are off by default).
In fact, the options are processed from left to right, so a sequence like
**\-\-verbose -h** will only show the **banner line** (**+b**) and the
**progress report** (**+p**), but leave out the **happy message** (**-h**).

The first batch of options are common to both **ctangle** and **cweave**:

* **+b**:
  print banner line on terminal
* **+h**:
  print success message on completion
* **+p**:
  print progress report messages
* **+q**/**-q**:
  shortcut for **-bhp**; also **\-\-quiet** (default)
* **+v**/**-v**:
  shortcut for **+bhp**; also **\-\-verbose**
* **+s**:
  print usage statistics
* **\-\-help**:
  display help message and exit
* **\-\-version**:
  output version information and exit

There are six other options applicable to **cweave** only:

* **-e**:
  do not enclose C/C++\ material in **\\PB{...}**
* **-f**:
  do not force a newline after every C/C++\ statement in output
* **-i**:
  suppress indentation of parameter declarations
* **-o**:
  suppress separation of declarations and statements
* **-x**:
  omit indices, section names, table of contents
* **+lX**/**-lX**:
  use macros for language _X_ as of _X_**cwebmac.tex**

# ENVIRONMENT

The environment variable `CWEBINPUTS` is used to search for the input files,
or the system default if `CWEBINPUTS` is not set.  See tex(1) for the details
of the searching.

If prepared for NLS support, **ctangle** and **cweave** use the environment
variable `TEXMFLOCALEDIR` to configure the parent directory where the "GNU
gettext utilities" search for translation catalogs.

These variables are preconfigured in \TeX\ Live's **texmf.cnf**.

# FILES

The location of the files mentioned below varies from system to system.
Use the **kpsewhich** utility to find their locations.

* **cwebmac.tex**:
  The default \TeX\ macros **\\input** in the first line of the **cweave**
  output file.

* **cwebman.tex**:
  The CWEB user manual, available in PDF from
  [CTAN](https://ctan.org/pkg/cweb).

# SEE ALSO

* The CWEB System of Structured Documentation:
  by Donald E.\ Knuth and Silvio Levy (hardcopy version of **cwebman.tex**
  and the source code listings of **common.w**, **ctangle.w**, and
  **cweave.w**).
* Literate Programming:
  by D.\ E.\ Knuth.
* Weaving a Program:
  by Wayne Sewell.

cweb(1), tex(1), cc(1)

# AUTHORS

Don Knuth wrote WEB for \TeX\ and Pascal. \
Silvio Levy designed and developed CWEB by adapting the WEB conventions to C
and by recoding everything in CWEB.
Knuth began using CWEB and made further refinements.
Many other helpers are acknowledged in the CWEB manual. \
As of 2019, the CWEB system in \TeX\ Live is based on the CWEBbin extension
that collects ideas and improvements from numerous  contributors; see
[the project page](https://github.com/ascherer/cwebbin).
