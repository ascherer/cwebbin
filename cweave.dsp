# Microsoft Developer Studio Project File - Name="cweave" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=cweave - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "cweave.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "cweave.mak" CFG="cweave - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cweave - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "cweave - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "cweave - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\Release"
# PROP Intermediate_Dir ".\Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MD /W3 /GX /Od /I "catalogs" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D _DEV_NULL=\"NUL\" /FD /D SEPARATORS=\":\\/\" /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "cweave - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\Debug"
# PROP Intermediate_Dir ".\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /I "catalogs" /D "_DEBUG" /D "WIN32" /D "_CONSOLE" /D _DEV_NULL=\"NUL\" /FD /D SEPARATORS=\":\\/\" /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x407 /d "_DEBUG"
# ADD RSC /l 0x407 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386

!ENDIF 

# Begin Target

# Name "cweave - Win32 Release"
# Name "cweave - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat;for;f90"
# Begin Source File

SOURCE=common.cxx
# End Source File
# Begin Source File

SOURCE=cweave.cxx
# End Source File
# End Group
# Begin Group "Change Files"

# PROP Default_Filter "ch"
# Begin Source File

SOURCE="cweav-ansi.ch"
# End Source File
# Begin Source File

SOURCE="cweav-extensions.ch"
# End Source File
# Begin Source File

SOURCE="cweav-memory.ch"
# End Source File
# Begin Source File

SOURCE="cweav-output.ch"
# End Source File
# Begin Source File

SOURCE="cweav-patch.ch"
# End Source File
# Begin Source File

SOURCE="cweav-translation.ch"
# End Source File
# End Group
# Begin Group "CWEB Files"

# PROP Default_Filter "w"
# Begin Source File

SOURCE=cweave.w

!IF  "$(CFG)" == "cweave - Win32 Release"

# Begin Custom Build
InputPath=cweave.w

"cweave.cxx" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	tie -c comm-p21.hch common.h comm-ansi.hch comm-extensions.hch comm-memory.hch comm-translation.hch comm-output.hch 
	tie -m comm-p21.h common.h comm-p21.hch 
	tie -c cweav-p21.ch cweave.w cweav-patch.ch cweav-ansi.ch cweav-extensions.ch cweav-memory.ch cweav-translation.ch cweav-output.ch 
	ctangle cweave.w cweav-p21.ch cweave.cxx 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "cweave - Win32 Debug"

# Begin Custom Build
InputPath=cweave.w

"cweave.cxx" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	tie -c comm-p21.hch common.h comm-ansi.hch comm-extensions.hch comm-memory.hch comm-translation.hch comm-output.hch 
	tie -m comm-p21.h common.h comm-p21.hch 
	tie -c cweav-p21.ch cweave.w cweav-patch.ch cweav-ansi.ch cweav-extensions.ch cweav-memory.ch cweav-translation.ch cweav-output.ch 
	ctangle cweave.w cweav-p21.ch cweave.cxx 
	
# End Custom Build

!ENDIF 

# End Source File
# End Group
# End Target
# End Project
