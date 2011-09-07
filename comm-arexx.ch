Changes for COMMON.W by Andreas Scherer, May 7, 1995.

This set of changes introduces communication between CWEB and the message
browser of the SAS/C++ 6.55 development system.  You need not apply this
file if you use CWEB on a non-Amiga system or with a different C compiler.
Care has be taken to avoid any conflicts in these situations.

This change file requires COMM-PATCH.CH, COMM-ANSI.CH, COMM-EXTENSIONS.CH,
COMM-MEMORY.CH, COMM-TRANSLATION.CH to be applied as well.

For a complete history of the changes made to COMMON.W see COMM-PATCH.CH.

@x l.401
if ((change_file=fopen(change_file_name,"r"))==NULL)
@y
#ifdef __SASC
@<Set up the {\mc AREXX} communication@>;
#endif
if ((change_file=fopen(change_file_name,"r"))==NULL)
@z

@x l.1109
{if (changing && include_depth==change_depth)
  printf(". (l. %d of change file)\n", change_line);
else if (include_depth==0) printf(". (l. %d)\n", cur_line);
  else printf(". (l. %d of include file %s)\n", cur_line, cur_file_name);
@y
{if (changing && include_depth==change_depth)
  @<Report an error in the change file@>@;
else if (include_depth==0)
  @<Report an error in the web file@>@;
else
  @<Report an error in an include file@>@;

#ifdef __SASC
@<Put the error message in the browser@>@;
#endif
@z

@x l.1211
@d show_happiness flags['h'] /* should lack of errors be announced? */
@y
@d send_error_messages flags['m'] /* should {\mc AREXX} communication be used? */
@d show_happiness flags['h'] /* should lack of errors be announced? */
@z

@x l.248 of COMM-TRANSLATION.CH
if (program==ctangle)
  fatal(get_string(MSG_FATAL_CO75_2),"");
else fatal(get_string(MSG_FATAL_CO75_4),"");
@y
#ifdef __SASC
if (program==ctangle)
  fatal(get_string(MSG_FATAL_CO75_1),"");
else fatal(get_string(MSG_FATAL_CO75_3),"");
#else
if (program==ctangle)
  fatal(get_string(MSG_FATAL_CO75_2),"");
else fatal(get_string(MSG_FATAL_CO75_4),"");
#endif
@z

@x l.1415
@** Index.
@y
@** AREXX communication.  In case of an error we want to have a common
interface used by \.{CWEB} and the \CEE/ compiler in the same way.  For
the {\mc AMIGA} this is \.{SCMSG}, the message browser of the {\mc SAS/C}
development system.  This program has an {\mc AREXX} port and can be
addressed by other applications like \.{CTANGLE} and \.{CWEAVE} with
the help of the routines described in this part of the program.
(I admit to have shamelessly borrowed code from the Pas\TEX/
implementation of \.{dvips}~5.47 by Georg He{\ss}mann.)
To make use of this feature it is necessary (besides having an
{\mc AMIGA}) to include a few system dependent header files.
@^system dependencies@>

@<Include files@>=
#ifdef __SASC
#include <proto/dos.h>
#include <proto/rexxsyslib.h>
#endif

@ A list of declarations and variables is added.  Most of these are
globally defined because the initialization of the message port is done
outside these local routines.
@^system dependencies@>

@<Other...@>=
#ifdef __SASC
long result = RETURN_FAIL;
char msg_string[BUFSIZ];
char pth_buffer[BUFSIZ];
char cur_buffer[BUFSIZ];
@#
struct RexxMsg *rm;
struct MsgPort *rp;
@#
#define MSGPORT  "SC_SCMSG"
#define PORTNAME "CWEBPORT"
#define RXEXTENS "rexx"
#endif

@ This function addresses the message browser of the {\mc SAS/C} system by
means of its {\mc AREXX} communication port.
@^system dependencies@>

@c
#ifdef __SASC
static int PutRexxMsg(struct MsgPort *mp, long action,@|
  STRPTR arg0, struct RexxMsg *arg1)
  {
  if ((rm = CreateRexxMsg(mp, (unsigned char *)RXEXTENS, @|
      (unsigned char *)mp->mp_Node.ln_Name)) != NULL) {
    rm->rm_Action  = action;
    rm->rm_Args[0] = arg0;
    rm->rm_Args[1] = (STRPTR)arg1;

    Forbid(); /* Disable multitasking. */
    if ((rp = FindPort((unsigned char *)MSGPORT)) != NULL)
      PutMsg(rp, (struct Message *)rm);
    Permit(); /* Enable multitasking. */

    if (rp == NULL) /* Sorry, message browser not found. */
      DeleteRexxMsg(rm);
  }
  return(rm != NULL && rp != NULL);
}
#endif

@ This function is the ``interface'' between \.{CWEB} and {\mc AREXX}\null.
The first argument is a string containing a full line of text to be sent to
the browser.  The second argument returns the transmission result.
@^system dependencies@>

@c
#ifdef __SASC
int __stdargs call_rexx(char *str, long *result)
{
  char *arg;
  struct MsgPort *mp;
  struct RexxMsg *rm, *rm2;
  int ret = FALSE;
  int pend;

  if (!(RexxSysBase = OpenLibrary((unsigned char *)RXSNAME, 0L)))
    return(ret);

  Forbid(); /* Disable multitasking. */
  if (FindPort((unsigned char *)PORTNAME) == NULL)
    mp = CreatePort(PORTNAME, 0L);
  Permit(); /* Enable multitasking. */

  if (mp != NULL) {
    if ((arg = (char *)CreateArgstring(
        (unsigned char *)str, strlen(str))) != NULL) {
      if (PutRexxMsg(mp, RXCOMM | RXFF_STRING, arg, NULL)) {
        for (pend = 1; pend != 0; )
          if (WaitPort(mp) != NULL)
            while ((rm = (struct RexxMsg *)GetMsg(mp)) != NULL)
              if (rm->rm_Node.mn_Node.ln_Type == NT_REPLYMSG) {
                ret = TRUE;
                *result = rm->rm_Result1;
                if ((rm2 = (struct RexxMsg *)rm->rm_Args[1]) != NULL) {
                  rm2->rm_Result1 = rm->rm_Result1;
                  rm2->rm_Result2 = 0;
                  ReplyMsg((struct Message *)rm2);
                }
                DeleteRexxMsg(rm);
                pend--;
              }
              else {
                rm->rm_Result2 = 0;
                if (PutRexxMsg(mp, rm->rm_Action, rm->rm_Args[0], rm))
                  pend++;
                else {
                  rm->rm_Result1 = RETURN_FAIL;
                  ReplyMsg((struct Message *)rm);
                }
              }
      }
      DeleteArgstring((unsigned char *)arg);
    }
    DeletePort(mp);
  }

  CloseLibrary((struct Library *)RexxSysBase);

  return(ret);
}
#endif

@ The prototypes for these two new functions are added to the common list.
@^system dependencies@>

@<Predecl...@>=
#ifdef __SASC
static int PutRexxMsg(struct MsgPort *,long,STRPTR,struct RexxMsg *);
int __stdargs call_rexx(char *,long *);
#endif

@ Before we can send any signal to the message browser we have to make sure
that the receiving port is active.  Possibly a call to \.{scmsg} will
suffice.  If it is not there, any attempt to send a message will fail.

You can control the behaviour of \.{scmsg} via the external environment
variable \.{SCMSGOPT} which may contain any legal command line options as
described in the documentation provided by {\mc SAS}~Institute.
The display window with the error messages will not appear if you supply
\.{scmsg} with its \.{rexxonly} option.  If you want to see every message
on your screen, replace this option with \.{hidden}.  The first error
message received by \.{scmsg} will open the output window.  The very first
message for the browser initializes its database for the current web file.
Any pending entries will be destroyed before new ones are added.
@^system dependencies@>

@<Set up the {\mc AREXX} communication@>=
if(send_error_messages) {
  Forbid(); /* Disable multitasking. */
  if ((rp = FindPort((unsigned char *)MSGPORT)) != NULL);
    /* Check for browser port. */
  Permit(); /* Enable multitasking. */

  if(!rp) { /* Make sure, the browser is active. */
    strcpy(msg_string,"run <nil: >nil: scmsg ");
    strcat(msg_string,getenv("SCMSGOPT")); /* Add browser options. */
    system(msg_string);
    }

  if(GetCurrentDirName(cur_buffer,BUFSIZ) && @|
    AddPart(cur_buffer,web_file_name,BUFSIZ)) {
    sprintf(msg_string,"newbld \"%s\"",cur_buffer);
    call_rexx(msg_string,&result); /* Ignore the results. */
    }
  }

@ There are three types of \.{CWEB} errors reported to the message browser.
For completeness we give them the numbers~997 to~999.  The first one refers
to errors in the active change file.  If you click on the error line in the
browser window, your system editor will take you to the offending line in
the change file (given the communication between the browser and your
editor is properly set up).  There is a slight difficulty when entering
file names into the error message; the browser expects complete path names
and we have to add them more or less by~hand.
@^system dependencies@>

@<Report an error in the change file@>={
  printf(get_string(MSG_ERROR_CO59_1), change_line);
#ifdef __SASC
  if(send_error_messages) {

    if(GetCurrentDirName(cur_buffer,BUFSIZ) && @|
      AddPart(cur_buffer,web_file_name,BUFSIZ) && @|

      GetCurrentDirName(pth_buffer,BUFSIZ) && @|
      AddPart(pth_buffer,change_file_name,BUFSIZ))

      sprintf(msg_string,"newmsg \"%s\" \"%s\" %d 0 \"\" 0 Error 997 %s",@|
        cur_buffer,pth_buffer,change_line,s);

    else strcpy(msg_string,"\0");
    }
#endif
  }

@ The next type of error occurs in the web file itself, so the current file
is the same as the offending file.  We have to create the full name only once.
@^system dependencies@>

@<Report an error in the web file@>={
  printf(get_string(MSG_ERROR_CO59_2), cur_line);
#ifdef __SASC
  if(send_error_messages) {

    if(GetCurrentDirName(cur_buffer,BUFSIZ) && @|
      AddPart(cur_buffer,cur_file_name,BUFSIZ))

      sprintf(msg_string,"newmsg \"%s\" \"%s\" %d 0 \"\" 0 Error 998 %s",@|
        cur_buffer,cur_buffer,cur_line,s);

    else strcpy(msg_string,"\0");
    }
#endif
  }

@ The error with the highest number is also the most subtle type.  It
occurs inside an include file, so we have to distinguish between the web
file and the offending file.
@^system dependencies@>

@<Report an error in an include file@>={
  printf(get_string(MSG_ERROR_CO59_3), cur_line, cur_file_name);
#ifdef __SASC
  if(send_error_messages) {

    if(GetCurrentDirName(cur_buffer,BUFSIZ) && @|
      AddPart(cur_buffer,cur_file_name,BUFSIZ) && @|

      GetCurrentDirName(pth_buffer,BUFSIZ) && @|
      AddPart(pth_buffer,web_file_name,BUFSIZ))

      sprintf(msg_string,"newmsg \"%s\" \"%s\" %d 0 \"\" 0 Error 999 %s",@|
        pth_buffer,cur_buffer,cur_line,s);

    else strcpy(msg_string,"\0");
    }
#endif
  }

@ In the three sections above we simply created a string holding the full
entry line which is handed over to the message browser by calling our
|call_rexx| routine.  The boolean return value is ignored.
@^system dependencies@>

@<Put the error message in the browser@>=
  if(send_error_messages && msg_string)
    call_rexx(msg_string,&result); /* Ignore the results. */

@** Index.
@z
