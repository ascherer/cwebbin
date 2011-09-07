#ifndef CWEB_H
#define CWEB_H


/****************************************************************************/


/* This file was created automatically by CatComp.
 * Do NOT edit by hand!
 */


#ifndef EXEC_TYPES_H
#include <exec/types.h>
#endif


/****************************************************************************/


#define MSG_ERROR_CO9 0
#define MSG_ERROR_CO9_STR "! Linea in input troppo lunga"

#define MSG_ERROR_CO13 1
#define MSG_ERROR_CO13_STR "! Omesso @x nel change file"

#define MSG_ERROR_CO14 2
#define MSG_ERROR_CO14_STR "! Change file terminato dopo @x"

#define MSG_ERROR_CO16_1 3
#define MSG_ERROR_CO16_1_STR "! Change file terminato prima di @y"

#define MSG_ERROR_CO16_2 4
#define MSG_ERROR_CO16_2_STR "! File CWEB terminato durante un change"

#define MSG_ERROR_CO17_1 5
#define MSG_ERROR_CO17_1_STR "! Dov\'è il corrispondente @y?"

#define MSG_ERROR_CO17_2 6
#define MSG_ERROR_CO17_2_STR "delle linee precedenti, corrispondenza non trovata"

#define MSG_FATAL_CO19_1 7
#define MSG_FATAL_CO19_1_STR "! Non posso aprire il file di input "

#define MSG_FATAL_CO19_2 8
#define MSG_FATAL_CO19_2_STR "! Non posso aprire il change file "

#define MSG_ERROR_CO21_1 9
#define MSG_ERROR_CO21_1_STR "! Nome del file include assente"

#define MSG_ERROR_CO21_2 10
#define MSG_ERROR_CO21_2_STR "! Troppi include annidati"

#define MSG_ERROR_CO22 11
#define MSG_ERROR_CO22_STR "! Nome file include troppo lungo"

#define MSG_ERROR_CO23 12
#define MSG_ERROR_CO23_STR "! Non posso aprire il file include"

#define MSG_ERROR_CO25_1 13
#define MSG_ERROR_CO25_1_STR "! Change file terminato senza un @z"

#define MSG_ERROR_CO25_2 14
#define MSG_ERROR_CO25_2_STR "! Dov\'è il corrispondente @z?"

#define MSG_ERROR_CO26 15
#define MSG_ERROR_CO26_STR "! C\'è una voce nel change file che non corrisponde"

#define MSG_OVERFLOW_CO39_1 16
#define MSG_OVERFLOW_CO39_1_STR "byte di memoria"

#define MSG_OVERFLOW_CO39_2 17
#define MSG_OVERFLOW_CO39_2_STR "nome"

#define MSG_ERROR_CO50_1 18
#define MSG_ERROR_CO50_1_STR "\n! Prefisso ambiguo: corrispondenze trovate <"

#define MSG_ERROR_CO50_2 19
#define MSG_ERROR_CO50_2_STR ">\n e <"

#define MSG_ERROR_CO52_1 20
#define MSG_ERROR_CO52_1_STR "\n! Il nuovo nome è un prefisso per <"

#define MSG_ERROR_CO52_2 21
#define MSG_ERROR_CO52_2_STR "\n! Il nuovo nome estende <"

#define MSG_ERROR_CO52_3 22
#define MSG_ERROR_CO52_3_STR "\n! Nome sezione incompatibile con <"

#define MSG_ERROR_CO52_4 23
#define MSG_ERROR_CO52_4_STR ">,\n che abbrevia <"

#define MSG_ERROR_CO59_1 24
#define MSG_ERROR_CO59_1_STR ". (l. %d del change file)\n"

#define MSG_ERROR_CO59_2 25
#define MSG_ERROR_CO59_2_STR ". (l. %d)\n"

#define MSG_ERROR_CO59_3 26
#define MSG_ERROR_CO59_3_STR ". (l. %d del file include %s)\n"

#define MSG_HAPPINESS_CO62 27
#define MSG_HAPPINESS_CO62_STR "(Nessun errore trovato.)\n"

#define MSG_WARNING_CO62 28
#define MSG_WARNING_CO62_STR "(Hai visto i messaggi di warning sopra?)\n"

#define MSG_ERROR_CO62 29
#define MSG_ERROR_CO62_STR "(Scusa, ma credo che sia avvenuto qualcosa di errato.)\n"

#define MSG_FATAL_CO62 30
#define MSG_FATAL_CO62_STR "(Caro amico, si è verificato un errore importante.)\n"

#define MSG_FATAL_CO65 31
#define MSG_FATAL_CO65_STR "\n! Spiacente, %s capacità superata"

#define MSG_FATAL_CO66 32
#define MSG_FATAL_CO66_STR "! Questo non può avvenire: "

#define MSG_FATAL_CO73 33
#define MSG_FATAL_CO73_STR "! Il nome del file di output dovrebbe terminare con .tex\n"

#define MSG_FATAL_CO75_1 34
#define MSG_FATAL_CO75_1_STR "! Uso: ctangle [Opzioni] webfile[.w] " \
	"[{changefile[.ch]|-} [outfile[.c]]]\n" \
	"Opzioni (+ attiva, - disattiva, default indicato tra parentesi quadre):\n" \
	"b [+] stampa una riga di titoli\n" \
	"h [+] stampa un messaggio di \"buon fine\"\n" \
	"m [-] abilita comunicazioni ARexx\n" \
	"p [+] mostra andamento elaborazione\n" \
	"s [-] mostra statistiche\n"

#define MSG_FATAL_CO75_2 35
#define MSG_FATAL_CO75_2_STR "! Uso: ctangle [Opzioni] webfile[.w] " \
	"[{changefile[.ch]|-} [outfile[.c]]]\n" \
	"Opzioni (+ attiva, - disattiva, default indicato tra parentesi quadre):\n" \
	"b [+] stampa una riga di titoli\n" \
	"h [+] stampa un messaggio di \"buon fine\"\n" \
	"p [+] mostra andamento elaborazione\n" \
	"s [-] mostra statistiche\n"

#define MSG_FATAL_CO75_3 36
#define MSG_FATAL_CO75_3_STR "! Uso: cweave [Opzioni] webfile[.w] " \
	"[{changefile[.ch]|-} [outfile[.tex]]]\n" \
	"Opzioni (+ attiva, - disattiva, default indicato tra parentesi quadre):\n" \
	"b [+] stampa una riga di titoli\n" \
	"e [-] C material in \\PB parentesi\n" \
	"f [+] forza i line break\n" \
	"h [+] stampa un messaggio di \"buon fine\"\n" \
	"i [+] rientranza delle dichiarazioni\n" \
	"lX [ ] usa macro in lingua X contenute in Xcwebmac.tex\n" \
	"m [-] abilita comunicazioni ARexx\n" \
	"o [+] separa dichiarazioni e statement\n" \
	"p [+] mostra andamento elaborazione\n" \
	"s [-] mostra statistiche\n" \
	"x [+] include indici\n"

#define MSG_FATAL_CO75_4 37
#define MSG_FATAL_CO75_4_STR "! Uso: cweave [Opzioni] webfile[.w] " \
	"[{changefile[.ch]|-} [outfile[.tex]]]\n" \
	"Opzioni (+ attiva, - disattiva, default indicato tra parentesi quadre):\n" \
	"b [+] stampa una riga di titoli\n" \
	"e [-] C material in \\PB parentesi\n" \
	"f [+] forza i line break\n" \
	"h [+] stampa un messaggio di \"buon fine\"\n" \
	"i [+] rientranza delle dichiarazioni\n" \
	"lX [ ] usa macro in lingua X contenute in Xcwebmac.tex\n" \
	"o [+] separa dichiarazioni e statement\n" \
	"p [+] mostra andamento elaborazione\n" \
	"s [-] mostra statistiche\n" \
	"x [+] include indici\n"

#define MSG_FATAL_CO76 38
#define MSG_FATAL_CO76_STR "! Nome file troppo lungo\n"

#define MSG_FATAL_CO78 39
#define MSG_FATAL_CO78_STR "! Non posso aprire il file di output "

#define MSG_ERROR_CO82 40
#define MSG_ERROR_CO82_STR "! Path include troppo lungo"

#define MSG_FATAL_CO85 41
#define MSG_FATAL_CO85_STR "! Allocazione di memoria fallita"

#define MSG_BANNER_CT1 42
#define MSG_BANNER_CT1_STR "Questo è CTANGLE (Versione 3.62 [p19])\n"

#define MSG_OVERFLOW_CT26 43
#define MSG_OVERFLOW_CT26_STR "token"

#define MSG_OVERFLOW_CT30 44
#define MSG_OVERFLOW_CT30_STR "stack"

#define MSG_ERROR_CT34 45
#define MSG_ERROR_CT34_STR "\n! Non presente: <"

#define MSG_OVERFLOW_CT40 46
#define MSG_OVERFLOW_CT40_STR "file di output"

#define MSG_WARNING_CT42 47
#define MSG_WARNING_CT42_STR "\n! Nessun testo di programma è stato specificato."

#define MSG_PROGRESS_CT42_1 48
#define MSG_PROGRESS_CT42_1_STR "\nScrittura del file di output (%s):"

#define MSG_PROGRESS_CT42_2 49
#define MSG_PROGRESS_CT42_2_STR "\nScrittura dei file di output:"

#define MSG_PROGRESS_CT42_3 50
#define MSG_PROGRESS_CT42_3_STR "\nFatto."

#define MSG_CONFUSION_CT47 51
#define MSG_CONFUSION_CT47_STR "definizione macro contiene uno strano carattere"

#define MSG_ERROR_CT60_1 52
#define MSG_ERROR_CT60_1_STR "! Input terminato nel commento intermedio"

#define MSG_ERROR_CT60_2 53
#define MSG_ERROR_CT60_2_STR "! Nome sezione terminato all\'interno del commento intermedio"

#define MSG_ERROR_CT67_1 54
#define MSG_ERROR_CT67_1_STR "! Stringa non terminata"

#define MSG_ERROR_CT67_2 55
#define MSG_ERROR_CT67_2_STR "! Input terminato nel mezzo di una stringa"

#define MSG_ERROR_CT67_3 56
#define MSG_ERROR_CT67_3_STR "\n! Stringa troppo lunga: "

#define MSG_ERROR_CT68_1 57
#define MSG_ERROR_CT68_1_STR "! Usare @l solo nel limbo"

#define MSG_ERROR_CT68_2 58
#define MSG_ERROR_CT68_2_STR "! I doppi @ dovrebbero essere usati nel \"control text\""

#define MSG_ERROR_CT69 59
#define MSG_ERROR_CT69_STR "! I doppi @ dovrebbero essere usati nelle costanti ASCII"

#define MSG_ERROR_CT72_1 60
#define MSG_ERROR_CT72_1_STR "! Input terminato all\'interno del nome di una sezione"

#define MSG_ERROR_CT72_2 61
#define MSG_ERROR_CT72_2_STR "\n! Nome sezione troppo lungo: "

#define MSG_ERROR_CT73_1 62
#define MSG_ERROR_CT73_1_STR "! Nome sezione non terminato"

#define MSG_ERROR_CT73_2 63
#define MSG_ERROR_CT73_2_STR "! Nomi di sezioni l\'uno dentro l\'altro non consentiti"

#define MSG_ERROR_CT74 64
#define MSG_ERROR_CT74_STR "! Stringa verbatim non terminata"

#define MSG_OVERFLOW_CT76 65
#define MSG_OVERFLOW_CT76_STR "testo"

#define MSG_ERROR_CT78 66
#define MSG_ERROR_CT78_STR "! @d, @f e @c sono ignorati nella parte C"

#define MSG_ERROR_CT79 67
#define MSG_ERROR_CT79_STR "! Omesso `@ \' prima di una sezione con nome"

#define MSG_ERROR_CT80 68
#define MSG_ERROR_CT80_STR "! I doppi @ dovrebbero essere usati nelle stringhe"

#define MSG_ERROR_CT81 69
#define MSG_ERROR_CT81_STR "! Sequenza di escape non riconosciuta"

#define MSG_ERROR_CT85 70
#define MSG_ERROR_CT85_STR "! Definizione liberata (flushed), iniziare con un identificatore"

#define MSG_ERROR_CT93 71
#define MSG_ERROR_CT93_STR "! I doppi @ dovrebbero essere usati nel limbo"

#define MSG_ERROR_CT94_1 72
#define MSG_ERROR_CT94_1_STR "! Un numero decimale improprio segue @l"

#define MSG_ERROR_CT94_2 73
#define MSG_ERROR_CT94_2_STR "! Stringa sostitutiva in @l troppo lunga"

#define MSG_STATS_CT95_1 74
#define MSG_STATS_CT95_1_STR "\nStatistiche uso memoria:\n"

#define MSG_STATS_CT95_2 75
#define MSG_STATS_CT95_2_STR "%ld nomi (fuori da %ld)\n"

#define MSG_STATS_CT95_3 76
#define MSG_STATS_CT95_3_STR "%ld replacement text (fuori da %ld)\n"

#define MSG_STATS_CT95_4 77
#define MSG_STATS_CT95_4_STR "%ld byte (fuori da %ld)\n"

#define MSG_STATS_CT95_5 78
#define MSG_STATS_CT95_5_STR "%ld token (fuori da %ld)\n"

#define MSG_BANNER_CW1 79
#define MSG_BANNER_CW1_STR "Questo è CWEAVE (Versione 3.61 [p19])\n"

#define MSG_OVERFLOW_CW21 80
#define MSG_OVERFLOW_CW21_STR "referimento incrociato"

#define MSG_ERROR_CW54 81
#define MSG_ERROR_CW54_STR "! I codici di controllo sono vietati all\'interno dei nomi delle sezioni"

#define MSG_ERROR_CW56_1 82
#define MSG_ERROR_CW56_1_STR "! Control text non terminato"

#define MSG_ERROR_CW56_2 83
#define MSG_ERROR_CW56_2_STR "! I codici di controllo sono vietati nel testo di controllo"

#define MSG_OVERFLOW_CW61 84
#define MSG_OVERFLOW_CW61_STR "numero sezione"

#define MSG_ERROR_CW71_1 85
#define MSG_ERROR_CW71_1_STR "! Omesso identificatore sinistro di @s"

#define MSG_ERROR_CW71_2 86
#define MSG_ERROR_CW71_2_STR "! Omesso identificatore destro di @s"

#define MSG_WARNING_CW75_1 87
#define MSG_WARNING_CW75_1_STR "\n! Mai definito: <"

#define MSG_WARNING_CW75_2 88
#define MSG_WARNING_CW75_2_STR "\n! Mai usato: <"

#define MSG_WARNING_CW85 89
#define MSG_WARNING_CW85_STR "\n! La linea deve essere spezzata (output l. %d):\n"

#define MSG_ERROR_CW92_1 90
#define MSG_ERROR_CW92_1_STR "! Omesso } nel commento"

#define MSG_ERROR_CW92_2 91
#define MSG_ERROR_CW92_2_STR "! Extra } nel commento"

#define MSG_ERROR_CW94 92
#define MSG_ERROR_CW94_STR "! Uso illegale di @ nel commento"

#define MSG_WARNING_CW171 93
#define MSG_WARNING_CW171_STR "\nSequenza scrap irriducibile nella sezione %d:"

#define MSG_WARNING_CW172 94
#define MSG_WARNING_CW172_STR "\nTracing dopo l. %d:\n"

#define MSG_OVERFLOW_CW176 95
#define MSG_OVERFLOW_CW176_STR "scrap/token/text"

#define MSG_ERROR_CW182 96
#define MSG_ERROR_CW182_STR "! Omesso `|\' dopo il testo in C"

#define MSG_ERROR_CW201 97
#define MSG_ERROR_CW201_STR "\n! Codice di controllo illegale nella sezione: <"

#define MSG_ERROR_CW202 98
#define MSG_ERROR_CW202_STR "\n! Testo C nel nome di una sezione, non terminato: <"

#define MSG_OVERFLOW_CW202 99
#define MSG_OVERFLOW_CW202_STR "buffer"

#define MSG_PROGRESS_CW204 100
#define MSG_PROGRESS_CW204_STR "\nScrittura file di output..."

#define MSG_ERROR_CW209_1 101
#define MSG_ERROR_CW209_1_STR "! Stringa TeX dovrebbe stare solo nel testo in C"

#define MSG_ERROR_CW209_2 102
#define MSG_ERROR_CW209_2_STR "! Non puoi fare quello nel testo in TeX"

#define MSG_ERROR_CW213 103
#define MSG_ERROR_CW213_STR "! Definizione di macro impropria"

#define MSG_ERROR_CW214 104
#define MSG_ERROR_CW214_STR "! Definizione di formato impropria"

#define MSG_ERROR_CW217 105
#define MSG_ERROR_CW217_STR "! È necessario un segno di = dopo il nome della sezione"

#define MSG_ERROR_CW218 106
#define MSG_ERROR_CW218_STR "! Non puoi fare quello nella parte in C"

#define MSG_PROGRESS_CW225 107
#define MSG_PROGRESS_CW225_STR "\nScrittura dell\'indice..."

#define MSG_FATAL_CW225_1 108
#define MSG_FATAL_CW225_1_STR "! Non posso aprire il file per l\'indice"

#define MSG_FATAL_CW225_2 109
#define MSG_FATAL_CW225_2_STR "! Non posso aprire il section file "

#define MSG_OVERFLOW_CW237 110
#define MSG_OVERFLOW_CW237_STR "ordinamento"

#define MSG_STATS_CW248_1 111
#define MSG_STATS_CW248_1_STR "%ld riferimenti incrociati (fuori da %ld)\n"

#define MSG_STATS_CW248_2 112
#define MSG_STATS_CW248_2_STR "Analisi:\n"

#define MSG_STATS_CW248_3 113
#define MSG_STATS_CW248_3_STR "%ld scrap (fuori da %ld)\n"

#define MSG_STATS_CW248_4 114
#define MSG_STATS_CW248_4_STR "%ld text (fuori da %ld)\n"

#define MSG_STATS_CW248_5 115
#define MSG_STATS_CW248_5_STR "%ld livelli (fuori da %ld)\n"

#define MSG_STATS_CW248_6 116
#define MSG_STATS_CW248_6_STR "Ordinamento:\n"


/****************************************************************************/


#ifdef STRINGARRAY

struct AppString
{
    LONG   as_ID;
    STRPTR as_Str;
};

struct AppString AppStrings[] =
{
    {MSG_ERROR_CO9,MSG_ERROR_CO9_STR},
    {MSG_ERROR_CO13,MSG_ERROR_CO13_STR},
    {MSG_ERROR_CO14,MSG_ERROR_CO14_STR},
    {MSG_ERROR_CO16_1,MSG_ERROR_CO16_1_STR},
    {MSG_ERROR_CO16_2,MSG_ERROR_CO16_2_STR},
    {MSG_ERROR_CO17_1,MSG_ERROR_CO17_1_STR},
    {MSG_ERROR_CO17_2,MSG_ERROR_CO17_2_STR},
    {MSG_FATAL_CO19_1,MSG_FATAL_CO19_1_STR},
    {MSG_FATAL_CO19_2,MSG_FATAL_CO19_2_STR},
    {MSG_ERROR_CO21_1,MSG_ERROR_CO21_1_STR},
    {MSG_ERROR_CO21_2,MSG_ERROR_CO21_2_STR},
    {MSG_ERROR_CO22,MSG_ERROR_CO22_STR},
    {MSG_ERROR_CO23,MSG_ERROR_CO23_STR},
    {MSG_ERROR_CO25_1,MSG_ERROR_CO25_1_STR},
    {MSG_ERROR_CO25_2,MSG_ERROR_CO25_2_STR},
    {MSG_ERROR_CO26,MSG_ERROR_CO26_STR},
    {MSG_OVERFLOW_CO39_1,MSG_OVERFLOW_CO39_1_STR},
    {MSG_OVERFLOW_CO39_2,MSG_OVERFLOW_CO39_2_STR},
    {MSG_ERROR_CO50_1,MSG_ERROR_CO50_1_STR},
    {MSG_ERROR_CO50_2,MSG_ERROR_CO50_2_STR},
    {MSG_ERROR_CO52_1,MSG_ERROR_CO52_1_STR},
    {MSG_ERROR_CO52_2,MSG_ERROR_CO52_2_STR},
    {MSG_ERROR_CO52_3,MSG_ERROR_CO52_3_STR},
    {MSG_ERROR_CO52_4,MSG_ERROR_CO52_4_STR},
    {MSG_ERROR_CO59_1,MSG_ERROR_CO59_1_STR},
    {MSG_ERROR_CO59_2,MSG_ERROR_CO59_2_STR},
    {MSG_ERROR_CO59_3,MSG_ERROR_CO59_3_STR},
    {MSG_HAPPINESS_CO62,MSG_HAPPINESS_CO62_STR},
    {MSG_WARNING_CO62,MSG_WARNING_CO62_STR},
    {MSG_ERROR_CO62,MSG_ERROR_CO62_STR},
    {MSG_FATAL_CO62,MSG_FATAL_CO62_STR},
    {MSG_FATAL_CO65,MSG_FATAL_CO65_STR},
    {MSG_FATAL_CO66,MSG_FATAL_CO66_STR},
    {MSG_FATAL_CO73,MSG_FATAL_CO73_STR},
    {MSG_FATAL_CO75_1,MSG_FATAL_CO75_1_STR},
    {MSG_FATAL_CO75_2,MSG_FATAL_CO75_2_STR},
    {MSG_FATAL_CO75_3,MSG_FATAL_CO75_3_STR},
    {MSG_FATAL_CO75_4,MSG_FATAL_CO75_4_STR},
    {MSG_FATAL_CO76,MSG_FATAL_CO76_STR},
    {MSG_FATAL_CO78,MSG_FATAL_CO78_STR},
    {MSG_ERROR_CO82,MSG_ERROR_CO82_STR},
    {MSG_FATAL_CO85,MSG_FATAL_CO85_STR},
    {MSG_BANNER_CT1,MSG_BANNER_CT1_STR},
    {MSG_OVERFLOW_CT26,MSG_OVERFLOW_CT26_STR},
    {MSG_OVERFLOW_CT30,MSG_OVERFLOW_CT30_STR},
    {MSG_ERROR_CT34,MSG_ERROR_CT34_STR},
    {MSG_OVERFLOW_CT40,MSG_OVERFLOW_CT40_STR},
    {MSG_WARNING_CT42,MSG_WARNING_CT42_STR},
    {MSG_PROGRESS_CT42_1,MSG_PROGRESS_CT42_1_STR},
    {MSG_PROGRESS_CT42_2,MSG_PROGRESS_CT42_2_STR},
    {MSG_PROGRESS_CT42_3,MSG_PROGRESS_CT42_3_STR},
    {MSG_CONFUSION_CT47,MSG_CONFUSION_CT47_STR},
    {MSG_ERROR_CT60_1,MSG_ERROR_CT60_1_STR},
    {MSG_ERROR_CT60_2,MSG_ERROR_CT60_2_STR},
    {MSG_ERROR_CT67_1,MSG_ERROR_CT67_1_STR},
    {MSG_ERROR_CT67_2,MSG_ERROR_CT67_2_STR},
    {MSG_ERROR_CT67_3,MSG_ERROR_CT67_3_STR},
    {MSG_ERROR_CT68_1,MSG_ERROR_CT68_1_STR},
    {MSG_ERROR_CT68_2,MSG_ERROR_CT68_2_STR},
    {MSG_ERROR_CT69,MSG_ERROR_CT69_STR},
    {MSG_ERROR_CT72_1,MSG_ERROR_CT72_1_STR},
    {MSG_ERROR_CT72_2,MSG_ERROR_CT72_2_STR},
    {MSG_ERROR_CT73_1,MSG_ERROR_CT73_1_STR},
    {MSG_ERROR_CT73_2,MSG_ERROR_CT73_2_STR},
    {MSG_ERROR_CT74,MSG_ERROR_CT74_STR},
    {MSG_OVERFLOW_CT76,MSG_OVERFLOW_CT76_STR},
    {MSG_ERROR_CT78,MSG_ERROR_CT78_STR},
    {MSG_ERROR_CT79,MSG_ERROR_CT79_STR},
    {MSG_ERROR_CT80,MSG_ERROR_CT80_STR},
    {MSG_ERROR_CT81,MSG_ERROR_CT81_STR},
    {MSG_ERROR_CT85,MSG_ERROR_CT85_STR},
    {MSG_ERROR_CT93,MSG_ERROR_CT93_STR},
    {MSG_ERROR_CT94_1,MSG_ERROR_CT94_1_STR},
    {MSG_ERROR_CT94_2,MSG_ERROR_CT94_2_STR},
    {MSG_STATS_CT95_1,MSG_STATS_CT95_1_STR},
    {MSG_STATS_CT95_2,MSG_STATS_CT95_2_STR},
    {MSG_STATS_CT95_3,MSG_STATS_CT95_3_STR},
    {MSG_STATS_CT95_4,MSG_STATS_CT95_4_STR},
    {MSG_STATS_CT95_5,MSG_STATS_CT95_5_STR},
    {MSG_BANNER_CW1,MSG_BANNER_CW1_STR},
    {MSG_OVERFLOW_CW21,MSG_OVERFLOW_CW21_STR},
    {MSG_ERROR_CW54,MSG_ERROR_CW54_STR},
    {MSG_ERROR_CW56_1,MSG_ERROR_CW56_1_STR},
    {MSG_ERROR_CW56_2,MSG_ERROR_CW56_2_STR},
    {MSG_OVERFLOW_CW61,MSG_OVERFLOW_CW61_STR},
    {MSG_ERROR_CW71_1,MSG_ERROR_CW71_1_STR},
    {MSG_ERROR_CW71_2,MSG_ERROR_CW71_2_STR},
    {MSG_WARNING_CW75_1,MSG_WARNING_CW75_1_STR},
    {MSG_WARNING_CW75_2,MSG_WARNING_CW75_2_STR},
    {MSG_WARNING_CW85,MSG_WARNING_CW85_STR},
    {MSG_ERROR_CW92_1,MSG_ERROR_CW92_1_STR},
    {MSG_ERROR_CW92_2,MSG_ERROR_CW92_2_STR},
    {MSG_ERROR_CW94,MSG_ERROR_CW94_STR},
    {MSG_WARNING_CW171,MSG_WARNING_CW171_STR},
    {MSG_WARNING_CW172,MSG_WARNING_CW172_STR},
    {MSG_OVERFLOW_CW176,MSG_OVERFLOW_CW176_STR},
    {MSG_ERROR_CW182,MSG_ERROR_CW182_STR},
    {MSG_ERROR_CW201,MSG_ERROR_CW201_STR},
    {MSG_ERROR_CW202,MSG_ERROR_CW202_STR},
    {MSG_OVERFLOW_CW202,MSG_OVERFLOW_CW202_STR},
    {MSG_PROGRESS_CW204,MSG_PROGRESS_CW204_STR},
    {MSG_ERROR_CW209_1,MSG_ERROR_CW209_1_STR},
    {MSG_ERROR_CW209_2,MSG_ERROR_CW209_2_STR},
    {MSG_ERROR_CW213,MSG_ERROR_CW213_STR},
    {MSG_ERROR_CW214,MSG_ERROR_CW214_STR},
    {MSG_ERROR_CW217,MSG_ERROR_CW217_STR},
    {MSG_ERROR_CW218,MSG_ERROR_CW218_STR},
    {MSG_PROGRESS_CW225,MSG_PROGRESS_CW225_STR},
    {MSG_FATAL_CW225_1,MSG_FATAL_CW225_1_STR},
    {MSG_FATAL_CW225_2,MSG_FATAL_CW225_2_STR},
    {MSG_OVERFLOW_CW237,MSG_OVERFLOW_CW237_STR},
    {MSG_STATS_CW248_1,MSG_STATS_CW248_1_STR},
    {MSG_STATS_CW248_2,MSG_STATS_CW248_2_STR},
    {MSG_STATS_CW248_3,MSG_STATS_CW248_3_STR},
    {MSG_STATS_CW248_4,MSG_STATS_CW248_4_STR},
    {MSG_STATS_CW248_5,MSG_STATS_CW248_5_STR},
    {MSG_STATS_CW248_6,MSG_STATS_CW248_6_STR},
};


#endif /* STRINGARRAY */


/****************************************************************************/


#endif /* CWEB_H */
