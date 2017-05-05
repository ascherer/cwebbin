@x
    else if (c=='\'' || c=='"' || (c=='L'&&(*loc=='\'' || *loc=='"'))@|
@y
    else if (c=='\'' || c=='"'@|
           || ((c=='L' || c=='u' || c=='U')&&(*loc=='\'' || *loc=='"'))@|
           || ((c=='u' && *loc=='8')&&(*(++loc)=='\'' || *loc=='"'))@|
@z

@x
  if (delim=='L') { /* wide character constant */
@y
  if (delim=='L' || delim=='u' || delim=='U') { /* wide character constant */
@z
