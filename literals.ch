@x
    else if (c=='\'' || c=='"' || (c=='L'&&(*loc=='\'' || *loc=='"'))@|
@y
    else if (c=='\'' || c=='"'@|
           || ((c=='L' || c=='u' || c=='U')&&(*loc=='\'' || *loc=='"'))@|
           || ((c=='u' && *loc=='8')&&(*(loc+1)=='\'' || *(loc+1)=='"'))@|
@z

@x
  if (delim=='L') { /* wide character constant */
    delim=*loc++; *++id_loc=delim;
  }
@y
  if (delim=='L' || delim=='u' || delim=='U') { /* wide character constant */
    if (delim=='u' && *loc=='8') { *++id_loc=*loc++; }
    delim=*loc++; *++id_loc=delim;
  }
@z
