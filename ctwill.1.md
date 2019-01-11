% CTWILL(1) Web2c @VERSION@ | General Commands Manual
% Don Knuth wrote **ctwill** based on **cweave** by Silvio Levy and Knuth
% January 11, 2019

# NAME

ctwill, refsort, twinx -- translate CWEB to TeX with mini-indexes

# SYNOPSIS

**ctwill** [_options_] _webfile_[.w] [{_changefile_[.ch]|-} [_outfile_[.tex]]]

**refsort** < _indexfile_.ref > _indexfile_.sref

**twinx** _outfile_.tex [_outfile_.tex ...] > index.tex

# DESCRIPTION

The **ctwill** program converts a CWEB source document into a TeX file that may
be formatted and printed in the usual way.  It takes appropriate care of
typographic details like page layout and the use of indentation, _italics_,
**boldface**, etc., and it supplies extensive cross-index information that it
gathers automatically.

CWEB allows you to prepare a single document containing all the information
that is needed both to produce a compilable C program and to produce a
well-formatted document describing the program in as much detail as the writer
may desire.  The user of CWEB ought to be familiar with TeX as well as C.

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

**ctwill** is exactly like **cweave** except that it produces much better
documentation, for which you must work harder.  You should run **ctwill**
twice, once to prime the pump and once to get decent answers.  Moreover, you
must run the output twice through TeX.

After **tex foo** you will have output that looks like final pages except that
the entries of mini-indexes won't be alphabetized.  The first run produces a
weird file called **foo.ref**.  Say **refsort < foo.ref > foo.sref** and then
another **tex foo** will produce alphabetized output.

The **twinx** program compiles a master index for a set of related programs
that have been processed by **ctwill**.  The individual programs should define
their names with a line of the form **\\def\\title{NAME}**.

The mini-indexes list identifiers that are used but not defined on each
two-page spread.  At the end of each section, **ctwill** gives TeX a list of
identifiers used in that section and information about where they are defined.

The current meaning of every identifier is initially **\\uninitialized**.
Then **ctwill** reads the **.aux** file for your job, if any.

Before reading the **.aux** file, **ctwill** actually looks for a file called
**system.bux**, which will be read if present.  And after **foo.aux**, a third
possibility is **foo.bux**.  The general convention is to put definitions of
system procedures such as _printf_ into **system.bux**, and to put definitions
found in specifically foo-ish header files into **foo.bux**. Like the **.aux**
files, **.bux** files should contain only **@$** specifications.

The meaning specified by **@$...@>** generally has four components:
an identifier (followed by space), a program name (enclosed in braces),
a section number (followed by space), and a TeX part.

A special _proofmode_ is provided so that you can check **ctwill**'s
conclusions about cross-references. Run **ctwill** with the flag **+P**, and
TeX will produce a specially formatted document (_without_ mini-indexes) in
which you can check that your specifications are correct.

More details how to use **ctwill** can be found in the first sections of its
source code, respectively the change file **cweav-twill.ch** applicable to the
**cweave.w** source.

# OPTIONS

Options on the command line may be either turned off with '**-**' (if they
are on by default) or turned on with '**+**' (if they are off by default).
In fact, the options are processed from left to right, so a sequence like
**--verbose -h** will only show the **banner line** (**+b**) and the
**progress report** (**+p**), but leave out the **happy message** (**-h**).

* **+b**:
  print banner line on terminal
* **+h**:
  print success message on completion
* **+p**:
  print progress report messages
* **+q**/**-q**:
  shortcut for **-bhp**; also **--quiet** (default)
* **+v**/**-v**:
  shortcut for **+bhp**; also **--verbose**
* **-e**:
  do not enclose C material in **\PB{...}**
* **-f**:
  do not force a newline after every C statement in output
* **-i**:
  suppress indentation of parameter declarations
* **-o**:
  suppress separation of declarations and statements
* **-x**:
  omit indices, section names, table of contents
* **+P**:
  **\input proofmac.tex** instead of **ctwimac.tex**
* **+lX**/**-lX**:
  use macros for language _X_ as of _X_**ct**{**wi**|**proof**}**mac.tex**
* **+s**:
  print usage statistics
* **--help**:
  display help message and exit
* **--version**:
  output version information and exit

# ENVIRONMENT

The environment variable CWEBINPUTS is used to search for the input files,
or the system default if CWEBINPUTS is not set.  See tex(1) for the details
of the searching.

# FILES

The location of the files mentioned below varies from system to system.
Use the **kpsewhich** utility to find their locations.

* **ctwimac.tex**:
  The default TeX macros **\\input** in the first line of the output file.
* **ctproofmac.tex**:
  If **ctwill** is invoked with the **+P** option, it will change the first
  line of the output file to **\\input ctproofmac.tex**.

In both cases you can request some prefix _X_ with the **+lX** option,
e.g., **+ld** will **\input dctwimac.tex** and **+Pld** will
**\input dctproofmac.tex**.

* _webfile_**.bux**:
  Reference definitions to resolve from other modules.
* **system.bux**:
  Reference definitions to resolve from C standard library header files like
  **<stdio.h>**.

Other **aux**iliary files with references are created automatically by
**ctwill** and the actual index files are created by TeX.

* **cwebman.tex**:
  The CWEB user manual.

# SEE ALSO

* The CWEB System of Structured Documentation:
  by Donald E. Knuth and Silvio Levy (hardcopy version of **cwebman.tex**
  and the source code listings of **common.w**, **ctangle.w**, and
  **cweave.w**).
* Literate Programming:
  by D. E. Knuth.
* Weaving a Program:
  by Wayne Sewell.

cweb(1), tex(1), cc(1)

As of 2019, **ctwill** and its utilities **refsort** and **twinx** have been
fully integrated with the extended CWEBbin system that serves as the basis for
CWEB in TeX Live; see https://github.com/ascherer/cwebbin.
