@x
#include <stdio.h>
@y
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
@z

@x
main(argc,argv)
  int argc;
  char *argv[];
@y
int main(
  int argc,
  char *argv[])
@z

@x
  char *id;
@y
  const char *id;
@z

@x
char *save_string(s)
  char *s;
@y
char *save_string(
  char *s)
@z

@x
node *new_node()
@y
node *new_node(void)
@z

@x
int compare(p,q)
  node *p,*q;
@y
int compare(
  node *p, node *q)
@z

@x
  for (j=1;collate[j];j++) ord[collate[j]]=j;
@y
  for (j=1;collate[j];j++) ord[(int)collate[j]]=j;
@z

@x
collapse(p,q)
  node *p,*q;
@y
void collapse(
  node *p, node *q)
@z

@x
{@+register char *p=x->id;
@y
{@+register const char *p=x->id;
@z
