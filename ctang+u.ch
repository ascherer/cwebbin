Changes for CTANGLE.W by Andreas Scherer.

This set of changes extends CTANGLE's transliteration mechanism to ``poor man's
UTF-8'' by stripping all but the last of a sequence of high-bit bytes
representing a multi-byte character.

Section 59.

@x l.696
@ @<Case of an identifier@>=@t\1\quad@>
@y
@ Nowadays, most computer files are encoded in some form of ``Unicode''. A very
convenient special case is ``UTF-8'', a variable-length multi-byte encoding. In
order to avoid major surgery for the transliteration feature---as tempting as
the extended notation \.{@@l c3bc ue} might be---, \.{CTANGLE}
accepts the \.{+u} option to activate a ``poor man's UTF-8'' mechanism. The
first in a sequence of up to four high-bit bytes (amounting to more than
$2^{20}$~possible character representations) determines the number of bytes
used to represent the next character. Instead of extending the |translit| table
to this multi-byte scenario, we simply strip all but the last byte and use this
as the transliteration index.

% Exercise 11.6 from the TeXbook:
\def\frac#1/#2{\leavevmode\kern.1em\raise.5ex\hbox{\the\scriptfont0 #1}
  \kern-.1em/\kern-.15em\lower.25ex\hbox{\the\scriptfont0 #2}}

\&{Example:} While in ``classic ASCII'' the German word {\it gr\"un\/} could be
treated with transliteration \.{@@l fc ue} (from codepage ISO/IEC~8859-1) to
get \.{gruen} as suggested above, in UTF-8 you'd be advised to use \.{@@l bc
ue} instead, because character {\it \"u\/} (latin small letter u with
diaeresis) is encoded as the two-byte sequence \.{c3 bc}, indicated by the
initial three bits of byte \.{c3} (\.{1100 0011}). Note that this simple
approach leads to the collision with character $\frac1/4$ (vulgar fraction one
quarter) with its two-byte encoding \.{c2 bc}.

@d transliterate_utf_eight flags['u']

@<Case of an identifier@>=@t\1\quad@>
@z

@x l.701
    if ((eight_bits)(*j)<0200) C_putc(*j);
@^high-bit character handling@>
    else C_printf("%s",translit[(eight_bits)(*j)-0200]);
@y
    if (ishigh(*j)) {
@^high-bit character handling@>
      if (transliterate_utf_eight) {
        if ((eight_bits)(*j)>=0360) j+=3;
        else if ((eight_bits)(*j)>=0340) j+=2;
        else if ((eight_bits)(*j)>=0300) j+=1;
      }
      C_printf("%s",translit[(eight_bits)(*j)-0200]);
    }
    else C_putc(*j);
@z
