Changes for CTANGLE.W by Andreas Scherer, December 4, 2018.

This set of changes provides support for installing CWEB on MS/DOS systems
with Borland C++ 3.1.  Arrays larger than 64 KB are allocated with a
system-dependent routine `farcalloc'.  For this, several pointer variables
have to be declared as `huge'.  Care has been taken to avoid conflicts with
other operating systems which are not restricted to the limitations of DOS.
(DOS isn't restricted to the 64 KB limit either, or else this full sized
patch would not be possible.  But instead of `farcalloc' a `non-ANSI' sized
`malloc' would be much more convenient.)  For other MS/DOS compilers than
Borland C++ 3.1 you'll have to replace this file by other changes.

This change file requires CTANG-PATCH.CH, CTANG-ANSI.CH, CTANG-EXTENSIONS.CH,
CTANG-OUTPUT.CH, CTANG-MEMORY.CH, CTANG-TRANSLATIONS.CH to be applied as well.

For a complete history of the changes made to CTANGLE.W see CTANG-PATCH.CH.

@x l.154
  eight_bits *tok_start; /* pointer into |tok_mem| */
@y
  eight_bits HUGE *tok_start; /* pointer into |tok_mem| */
@z

@x l.33 of CTANG-MEMORY.CH
eight_bits *tok_mem;
eight_bits *tok_mem_end;
eight_bits *tok_ptr; /* first unused position in |tok_mem| */
@y
eight_bits HUGE *tok_mem;
eight_bits HUGE *tok_mem_end;
eight_bits HUGE *tok_ptr; /* first unused position in |tok_mem| */
@z

@x l.44 of CTANG-MEMORY.CH
alloc_object(tok_mem,max_toks,eight_bits);
@y
#ifdef __TURBOC__
#undef max_toks
#define max_toks 170000
tok_mem=(eight_bits HUGE *)allocsafe(max_toks,sizeof(*tok_mem));
#else
alloc_object(tok_mem,max_toks,eight_bits);
#endif
@z

@x l.97 of CTANG-ANSI.CH
    node->equiv=(void *)text_info;
@y
    node->equiv=(void HUGE *)text_info;
@z

@x l.298
  eight_bits *end_field; /* ending location of replacement text */
  eight_bits *byte_field; /* present location within replacement text */
@y
  eight_bits HUGE *end_field; /* ending location of replacement text */
  eight_bits HUGE *byte_field; /* present location within replacement text */
@z

@x l.147 of CTANG-ANSI.CH
  if ((a+name_dir)->equiv!=(void *)text_info) push_level(a+name_dir);
@y
  if ((a+name_dir)->equiv!=(void HUGE *)text_info) push_level(a+name_dir);
@z

@x l.656
  char *j, *k; /* pointer into |byte_mem| */
@y
  char HUGE *j;
  char HUGE *k; /* pointer into |byte_mem| */
@z

@x l.295 of CTANG-ANSI.CH
else if (p->equiv==(void *)text_info) p->equiv=(void *)cur_text;
@y
else if (p->equiv==(void HUGE *)text_info) p->equiv=(void HUGE *)cur_text;
@z
