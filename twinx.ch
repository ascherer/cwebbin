@x l.10
#include <stdio.h>
@y
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
@z

@x l.15
main(argc,argv)
  int argc;
  char *argv[];
@y
int main(
  int argc,
  char *argv[])
@z

@x l.102
  char *id;
@y
  const char *id;
@z

@x l.115
char *save_string(s)
  char *s;
@y
char *save_string(
  char *s)
@z

@x l.145
node *new_node()
@y
node *new_node(void)
@z

@x l.216
    if (*p=='{') bal++;
    else if (*p=='}') bal--;
@y
    switch (*p) {
    case '\\': *q++=*p++; break;
    case '{': bal++; break;
    case '}': bal--; break;
    }
@z

@x l.347
int compare(p,q)
  node *p,*q;
@y
int compare(
  node *p, node *q)
@z

@x l.379
  for (j=1;collate[j];j++) ord[collate[j]]=j;
@y
  for (j=1;collate[j];j++) ord[(int)collate[j]]=j;
@z

@x l.390
collapse(p,q)
  node *p,*q;
@y
void collapse(
  node *p, node *q)
@z

@x l.414
{@+register char *p=x->id;
@y
{@+register const char *p=x->id;
@z

@x l.434
    if (*p=='_') putchar('\\');
@y
    if (*p=='_'&&*(p-1)!='\\') putchar('\\');
@z
