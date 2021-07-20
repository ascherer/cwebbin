Section 111.

@x
\+& |exp| \altt|lbrace| |int_like| |decl|
@y
\+\dagit& |exp| \altt|lbrace| |int_like| |decl|
@z

@x
\+& |decl_head| \altt|int_like| |lbrace| |decl| & |fn_decl|
@y
\+\dagit& |decl_head| \altt|int_like| |lbrace| |decl| & |fn_decl|
@z

@x
\+& |decl| \alt|stmt| |function| & \alt|stmt| |function|
@y
\+\dagit& |decl| \alt|stmt| |function| & \alt|stmt| |function|
@z

@x
\+& |fn_decl| |stmt| & |function| \hfill $F\,|out|\,|out|\,|force|\,S$
@y
\+\dagit& |fn_decl| |stmt| & |function| \hfill $F\,|out|\,|out|\,|force|\,S$
@z

@x
\+& |catch_like| \alt|cast| |exp| & |fn_decl| \hfill
@y
\+\dagit& |catch_like| \alt|cast| |exp| & |fn_decl| \hfill
@z

@x
Rule 35: The |exp| must not be immediately followed by |lpar|, |lbrack|,
@y
Rules 1, 38, 52, and 73: The \\{din}s and \\{out}s are suppressed if
\.{CWEAVE} has been invoked with the \.{-i} option.

Rule 35: The |exp| must not be immediately followed by |lpar|, |lbrack|,
@z

@x
Rule 48: The |exp| or |int_like| must not be immediately followed by |base|.
@y
Rule 41: The |big_force| becomes |force| if \.{CWEAVE} has been invoked with the
\.{-o} option.

Rule 48: The |exp| or |int_like| must not be immediately followed by |base|.
@z

@x
been invoked with the \.{-f} option.
@y
been invoked with the \.{-f} option, and the |big_force| in the |decl| and
|function| lines becomes |force| if \.{CWEAVE} has been invoked with the
\.{-o} option.
@z
