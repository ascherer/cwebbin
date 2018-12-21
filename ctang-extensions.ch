Changes for CTANGLE.W by Andreas Scherer, November 6, 2018.

This set of changes adapts the buffer sizes to those in COMM-FOO.H

For a complete history of the changes made to CTANGLE.W see CTANG-PATCH.CH.

Section 4.

@x l.112
@d max_bytes 90000 /* the number of bytes in identifiers,
@y
@d max_bytes 1000000 /* the number of bytes in identifiers,
@z

@x l.114
@d max_toks 270000 /* number of bytes in compressed \CEE/ code */
@d max_names 4000 /* number of identifiers, strings, section names;
@y
@d max_toks 1000000 /* number of bytes in compressed \CEE/ code */
@d max_names 10239 /* number of identifiers, strings, section names;
@z

@x l.117
@d max_texts 2500 /* number of replacement texts, must be less than 10240 */
@d hash_size 353 /* should be prime; used in |"common.w"| */
@y
@d max_texts 10239 /* number of replacement texts, must be less than 10240 */
@d hash_size 8501 /* should be prime; used in |"common.w"| */
@z

@x l.121
@d buf_size 100 /* for \.{CWEAVE} and \.{CTANGLE} */
@y
@d buf_size 1000 /* for \.{CWEAVE} and \.{CTANGLE} */
@z

@x l.925
    else if (c=='\'' || c=='"' || (c=='L'&&(*loc=='\'' || *loc=='"')))
@y
    else if (c=='\'' || c=='"'@|
           || ((c=='L' || c=='u' || c=='U')&&(*loc=='\'' || *loc=='"'))@|
           || ((c=='u' && *loc=='8')&&(*(loc+1)=='\'' || *(loc+1)=='"')))
@z

@x l.1010
  if (delim=='L') { /* wide character constant */
    delim=*loc++; *++id_loc=delim;
  }
@y
  if (delim=='L' || delim=='u' || delim=='U') { /* wide character constant */
    if (delim=='u' && *loc=='8') { *++id_loc=*loc++; }
    delim=*loc++; *++id_loc=delim;
  }
@z
