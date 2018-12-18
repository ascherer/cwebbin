Changes for WMERGE.W by Andreas Scherer, May 10, 1995.

This set of changes provides support for installing CWEB on MS/DOS systems
with Borland C++ 3.1.  A mysterious bug in a multiple `return' situation is
fixed.  Care has been taken to avoid conflicts with other operating
systems.  For other MS/DOS compilers than Borland C++ 3.1 you may not need
to apply this change file.

This change file requires WMERG-PATCH.CH, WMERG-ANSI.CH,
WMERG-EXTENSIONS.CH, WMERG-MEMORY.CH to be applied as well.

For a complete history of the changes made to WMERGE.W see WMERG-PATCH.CH.

@x l.119 lf WMERG-EXTENSIONS.CH
made sensitive to these conditions.
@y
made sensitive to these conditions.

|__TURBOC__| has another shitty ``feature'' that has to be fixed.
|return|ing from several |case|s crashes the system.  Either always the
first case is used, or the system is crashed completely.  Really funny.
@z

@x l.132 of WMERG-EXTENSIONS.CH
  switch(history) {
  case harmless_message: return(RETURN_WARN); break;
  case error_message: return(RETURN_ERROR); break;
  case fatal_message: return(RETURN_FAIL); break;
  default: return(RETURN_OK);
  }
@y
#ifdef __TURBOC__
  {
  int return_val;

  switch(history) {
  case harmless_message: return_val=RETURN_WARN; break;
  case error_message: return_val=RETURN_ERROR; break;
  case fatal_message: return_val=RETURN_FAIL; break;
  default: return_val=RETURN_OK;
    }
  return(return_val);
  }
#else
  switch(history) {
  case harmless_message: return(RETURN_WARN); break;
  case error_message: return(RETURN_ERROR); break;
  case fatal_message: return(RETURN_FAIL); break;
  default: return(RETURN_OK);
    }
#endif
@z
