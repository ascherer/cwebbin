# Microsoft Developer Studio Project File - Name="wmerge" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=wmerge - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "wmerge.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "wmerge.mak" CFG="wmerge - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wmerge - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "wmerge - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "wmerge - Win32 Release"

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
# ADD CPP /nologo /MD /W3 /GX /O2 /I "catalogs" /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D _DEV_NULL=\"NUL\" /FD /D SEPARATORS=\":\\/\" /c
# SUBTRACT CPP /YX
# ADD BASE RSC /l 0x407 /d "NDEBUG"
# ADD RSC /l 0x407 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "wmerge - Win32 Debug"

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

# Name "wmerge - Win32 Release"
# Name "wmerge - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat;for;f90"
# Begin Source File

SOURCE=wmerge.cxx
# End Source File
# End Group
# Begin Group "Change Files"

# PROP Default_Filter "ch"
# Begin Source File

SOURCE=".\wmerg-ansi.ch"
# End Source File
# Begin Source File

SOURCE=".\wmerg-extensions.ch"
# End Source File
# Begin Source File

SOURCE=".\wmerg-memory.ch"
# End Source File
# Begin Source File

SOURCE=".\wmerg-output.ch"
# End Source File
# Begin Source File

SOURCE=".\wmerg-patch.ch"
# End Source File
# End Group
# Begin Group "CWEB Files"

# PROP Default_Filter "w"
# Begin Source File

SOURCE=.\examples\wmerge.w

!IF  "$(CFG)" == "wmerge - Win32 Release"

# Begin Custom Build
InputPath=.\examples\wmerge.w

"wmerge.cxx" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	tie -c wmerg-p20.ch examples/wmerge.w wmerg-patch.ch wmerg-ansi.ch wmerg-extensions.ch wmerg-memory.ch wmerg-output.ch 
	ctangle examples/wmerge.w wmerg-p20.ch wmerge.cxx 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "wmerge - Win32 Debug"

# Begin Custom Build
InputPath=.\examples\wmerge.w

"wmerge.cxx" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	tie -c wmerg-p20.ch examples/wmerge.w wmerg-patch.ch wmerg-ansi.ch wmerg-extensions.ch wmerg-memory.ch wmerg-output.ch 
	ctangle examples/wmerge.w wmerg-p20.ch wmerge.cxx 
	
# End Custom Build

!ENDIF 

# End Source File
# End Group
# End Target
# End Project
