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
#define MSG_ERROR_CO9_STR "! Eingabezeile zu lang"

#define MSG_ERROR_CO13 1
#define MSG_ERROR_CO13_STR "! Fehlendes @x in der Änderungsdatei"

#define MSG_ERROR_CO14 2
#define MSG_ERROR_CO14_STR "! Änderungsdatei endete nach @x"

#define MSG_ERROR_CO16_1 3
#define MSG_ERROR_CO16_1_STR "! Änderungsdatei endete vor @y"

#define MSG_ERROR_CO16_2 4
#define MSG_ERROR_CO16_2_STR "! CWEB-Datei endete während einer Änderung"

#define MSG_ERROR_CO17_1 5
#define MSG_ERROR_CO17_1_STR "! Wo ist das zugehörige @y?"

#define MSG_ERROR_CO17_2 6
#define MSG_ERROR_CO17_2_STR "der vorangegangenen Zeilen stimmen nicht überein"

#define MSG_FATAL_CO19_1 7
#define MSG_FATAL_CO19_1_STR "! Kann Eingabedatei nicht öffnen: "

#define MSG_FATAL_CO19_2 8
#define MSG_FATAL_CO19_2_STR "! Kann Änderungsdatei nicht öffnen: "

#define MSG_ERROR_CO21_1 9
#define MSG_ERROR_CO21_1_STR "! Name der Einfügedatei nicht angegeben"

#define MSG_ERROR_CO21_2 10
#define MSG_ERROR_CO21_2_STR "! Zu viele verschachtelte Einfügungen"

#define MSG_ERROR_CO22 11
#define MSG_ERROR_CO22_STR "! Name der Einfügedatei zu lang"

#define MSG_ERROR_CO23 12
#define MSG_ERROR_CO23_STR "! Kann Einfügedatei nicht öffnen"

#define MSG_ERROR_CO25_1 13
#define MSG_ERROR_CO25_1_STR "! Änderungsdatei endete ohne @z"

#define MSG_ERROR_CO25_2 14
#define MSG_ERROR_CO25_2_STR "! Wo ist das zugehörige @z?"

#define MSG_ERROR_CO26 15
#define MSG_ERROR_CO26_STR "! Eintrag in der Änderungsdatei stimmt nicht überein"

#define MSG_OVERFLOW_CO39_1 16
#define MSG_OVERFLOW_CO39_1_STR "Byte-Speicher"

#define MSG_OVERFLOW_CO39_2 17
#define MSG_OVERFLOW_CO39_2_STR "Bezeichner"

#define MSG_ERROR_CO50_1 18
#define MSG_ERROR_CO50_1_STR "\n! Mehrdeutiger Präfix: paßt zu <"

#define MSG_ERROR_CO50_2 19
#define MSG_ERROR_CO50_2_STR ">\n und <"

#define MSG_ERROR_CO52_1 20
#define MSG_ERROR_CO52_1_STR "\n! Neuer Name ist Präfix von <"

#define MSG_ERROR_CO52_2 21
#define MSG_ERROR_CO52_2_STR "\n! Neuer Name erweitert <"

#define MSG_ERROR_CO52_3 22
#define MSG_ERROR_CO52_3_STR "\n! Abschnittname paßt nicht zu <"

#define MSG_ERROR_CO52_4 23
#define MSG_ERROR_CO52_4_STR ">,\n einer Abkürzung von <"

#define MSG_ERROR_CO59_1 24
#define MSG_ERROR_CO59_1_STR ". (Zeile %d der Änderungsdatei)\n"

#define MSG_ERROR_CO59_2 25
#define MSG_ERROR_CO59_2_STR ". (Zeile %d)\n"

#define MSG_ERROR_CO59_3 26
#define MSG_ERROR_CO59_3_STR ". (Zeile %d der Einfügedatei %s)\n"

#define MSG_HAPPINESS_CO62 27
#define MSG_HAPPINESS_CO62_STR "(Keine Fehler gefunden.)\n"

#define MSG_WARNING_CO62 28
#define MSG_WARNING_CO62_STR "(Hast du die obige Warnung gesehen?)\n"

#define MSG_ERROR_CO62 29
#define MSG_ERROR_CO62_STR "(Entschuldige bitte, aber ich glaube, etwas stimmt nicht.)\n"

#define MSG_FATAL_CO62 30
#define MSG_FATAL_CO62_STR "(Mensch, das war ein böser Fehler.)\n"

#define MSG_FATAL_CO65 31
#define MSG_FATAL_CO65_STR "\n! Tut mir leid, Kapazität für %s überschritten"

#define MSG_FATAL_CO66 32
#define MSG_FATAL_CO66_STR "! Das kann nicht sein: "

#define MSG_FATAL_CO73 33
#define MSG_FATAL_CO73_STR "! Name der Ausgabedatei sollte mit .tex enden\n"

#define MSG_FATAL_CO75_1 34
#define MSG_FATAL_CO75_1_STR "! Aufruf: ctangle [Optionen] webfile[.w] " \
	"[{changefile[.ch]|-} [outfile[.c]]]\n" \
	"Optionen sind (+ schaltet ein, - schaltet aus, Vorgabe in Klammern):\n" \
	"b [+] Gib eine Startmeldung aus\n" \
	"h [+] Bestätige einen fehlerfreien Lauf\n" \
	"m [-] Aktiviere die ARexx-Kommunikation\n" \
	"p [+] Zeige einen Zwischenbericht\n" \
	"s [-] Melde die Verbrauchsstatistik\n"

#define MSG_FATAL_CO75_2 35
#define MSG_FATAL_CO75_2_STR "! Aufruf: ctangle [Optionen] webfile[.w] " \
	"[{changefile[.ch]|-} [outfile[.c]]]\n" \
	"Optionen sind (+ schaltet ein, - schaltet aus, Vorgabe in Klammern):\n" \
	"b [+] Gib eine Startmeldung aus\n" \
	"h [+] Bestätige einen fehlerfreien Lauf\n" \
	"p [+] Zeige einen Zwischenbericht\n" \
	"s [-] Melde die Verbrauchsstatistik\n"

#define MSG_FATAL_CO75_3 36
#define MSG_FATAL_CO75_3_STR "! Aufruf: cweave [Optionen] webfile[.w] " \
	"[{changefile[.ch]|-} [outfile[.tex]]]\nOptionen sind " \
	"(+ schaltet ein, - schaltet aus, Vorgabe in Klammern):\n" \
	"b [+] Gib eine Startmeldung aus\n" \
	"e [-] Schließe C-Material in \\PB-Klammern ein\n" \
	"f [+] Erzwinge Zeilenumbrüche nach jeder Anweisung\n" \
	"h [+] Bestätige einen fehlerfreien Lauf\n" \
	"i [+] Rücke Parameterdeklarationen ein\n" \
	"lX [ ] Verwende die Makros für Sprache X aus Xcwebmac.tex\n" \
	"m [-] Aktiviere die ARexx-Kommunikation\n" \
	"o [+] Trenne Deklarationen und Anweisungen\n" \
	"p [+] Zeige einen Zwischenbericht\n" \
	"s [-] Melde die Verbrauchsstatistik\n" \
	"x [+] Füge Indexe und Inhaltsverzeichnisse ein\n"

#define MSG_FATAL_CO75_4 37
#define MSG_FATAL_CO75_4_STR "! Aufruf: cweave [Optionen] webfile[.w] " \
	"[{changefile[.ch]|-} [outfile[.tex]]]\n" \
	"Optionen sind (+ schaltet ein, - schaltet aus, Vorgabe in Klammern):\n" \
	"b [+] Gib eine Startmeldung aus\n" \
	"e [-] Schließe C-Material in \\PB-Klammern ein\n" \
	"f [+] Erzwinge Zeilenumbrüche nach jeder Anweisung\n" \
	"h [+] Bestätige einen fehlerfreien Lauf\n" \
	"i [+] Rücke Parameterdeklarationen ein\n" \
	"lX [ ] Verwende die Makros für Sprache X aus Xcwebmac.tex\n" \
	"o [+] Trenne Deklarationen und Anweisungen\n" \
	"p [+] Zeige einen Zwischenbericht\n" \
	"s [-] Melde die Verbrauchsstatistik\n" \
	"x [+] Füge Indexe und Inhaltsverzeichnisse ein\n"

#define MSG_FATAL_CO76 38
#define MSG_FATAL_CO76_STR "! Dateiname zu lang\n"

#define MSG_FATAL_CO78 39
#define MSG_FATAL_CO78_STR "! Kann Ausgabedatei nicht öffnen: "

#define MSG_ERROR_CO82 40
#define MSG_ERROR_CO82_STR "! Einfügepfad zu lang"

#define MSG_FATAL_CO85 41
#define MSG_FATAL_CO85_STR "! Fehler bei der Speicherallokierung"

#define MSG_BANNER_CT1 42
#define MSG_BANNER_CT1_STR "Dies ist CTANGLE (Version 3.64 [CWEBbin 2018])\n"

#define MSG_OVERFLOW_CT26 43
#define MSG_OVERFLOW_CT26_STR "Token"

#define MSG_OVERFLOW_CT30 44
#define MSG_OVERFLOW_CT30_STR "Stack"

#define MSG_ERROR_CT34 45
#define MSG_ERROR_CT34_STR "\n! Nicht vorhanden: <"

#define MSG_OVERFLOW_CT40 46
#define MSG_OVERFLOW_CT40_STR "Ausgabedateien"

#define MSG_WARNING_CT42 47
#define MSG_WARNING_CT42_STR "\n! Kein Programmtext vorhanden."

#define MSG_PROGRESS_CT42_1 48
#define MSG_PROGRESS_CT42_1_STR "\nSchreibe die Ausgabedatei (%s):"

#define MSG_PROGRESS_CT42_2 49
#define MSG_PROGRESS_CT42_2_STR "\nSchreibe die Ausgabedateien:"

#define MSG_PROGRESS_CT42_3 50
#define MSG_PROGRESS_CT42_3_STR "\nFertig."

#define MSG_CONFUSION_CT47 51
#define MSG_CONFUSION_CT47_STR "Unpassendes Zeichen in einer Makrodefinition"

#define MSG_ERROR_CT60_1 52
#define MSG_ERROR_CT60_1_STR "! Eingabe endete mitten in einem Kommentar"

#define MSG_ERROR_CT60_2 53
#define MSG_ERROR_CT60_2_STR "! Abschnittname endete mitten in einem Kommentar"

#define MSG_ERROR_CT67_1 54
#define MSG_ERROR_CT67_1_STR "! Zeichenkette nicht beendet"

#define MSG_ERROR_CT67_2 55
#define MSG_ERROR_CT67_2_STR "! Eingabe endete mitten in einer Zeichenkette"

#define MSG_ERROR_CT67_3 56
#define MSG_ERROR_CT67_3_STR "\n! Zeichenkette zu lang: "

#define MSG_ERROR_CT68_1 57
#define MSG_ERROR_CT68_1_STR "! Verwende @l ausschließlich im Einführungsteil"

#define MSG_ERROR_CT68_2 58
#define MSG_ERROR_CT68_2_STR "! In Kontrolltexten sollten doppelte @ verwendet werden"

#define MSG_ERROR_CT69 59
#define MSG_ERROR_CT69_STR "! In ASCII Konstanten sollten doppelte @ verwendet werden"

#define MSG_ERROR_CT72_1 60
#define MSG_ERROR_CT72_1_STR "! Eingabe endete in einem Abschnittnamen"

#define MSG_ERROR_CT72_2 61
#define MSG_ERROR_CT72_2_STR "\n! Abschnittname zu lang: "

#define MSG_ERROR_CT73_1 62
#define MSG_ERROR_CT73_1_STR "! Abschnittname nicht beendet"

#define MSG_ERROR_CT73_2 63
#define MSG_ERROR_CT73_2_STR "! Verschachtelung von Abschnittnamen nicht erlaubt"

#define MSG_ERROR_CT74 64
#define MSG_ERROR_CT74_STR "! Verbatim-Zeichenkette nicht beendet"

#define MSG_OVERFLOW_CT76 65
#define MSG_OVERFLOW_CT76_STR "Text"

#define MSG_ERROR_CT78 66
#define MSG_ERROR_CT78_STR "! @d, @f und @c werden im C-Text ignoriert"

#define MSG_ERROR_CT79 67
#define MSG_ERROR_CT79_STR "! Fehlendes `@ ' vor einem Abschnittnamen"

#define MSG_ERROR_CT80 68
#define MSG_ERROR_CT80_STR "! In Zeichenketten sollten doppelte @ verwendet werden"

#define MSG_ERROR_CT81 69
#define MSG_ERROR_CT81_STR "! Unbekannte Escape-Sequenz"

#define MSG_ERROR_CT85 70
#define MSG_ERROR_CT85_STR "! Definition übergangen, muß mit einem Bezeichner anfangen"

#define MSG_ERROR_CT93 71
#define MSG_ERROR_CT93_STR "! Im Einführungsteil sollten doppelte @ verwendet werden"

#define MSG_ERROR_CT94_1 72
#define MSG_ERROR_CT94_1_STR "! Ungültige Hexadezimalzahl nach @l"

#define MSG_ERROR_CT94_2 73
#define MSG_ERROR_CT94_2_STR "! Ersetzungstext in @l zu lang"

#define MSG_STATS_CT95_1 74
#define MSG_STATS_CT95_1_STR "\nStatistik über den Speicherbedarf:\n"

#define MSG_STATS_CT95_2 75
#define MSG_STATS_CT95_2_STR "%ld Namen (von %ld)\n"

#define MSG_STATS_CT95_3 76
#define MSG_STATS_CT95_3_STR "%ld Ersetzungstexte (von %ld)\n"

#define MSG_STATS_CT95_4 77
#define MSG_STATS_CT95_4_STR "%ld Byte (von %ld)\n"

#define MSG_STATS_CT95_5 78
#define MSG_STATS_CT95_5_STR "%ld Token (von %ld)\n"

#define MSG_BANNER_CW1 79
#define MSG_BANNER_CW1_STR "Dies ist CWEAVE (Version 3.64 [CWEBbin 2018])\n"

#define MSG_OVERFLOW_CW21 80
#define MSG_OVERFLOW_CW21_STR "Querverweise"

#define MSG_ERROR_CW54 81
#define MSG_ERROR_CW54_STR "! Kontrollzeichen sind in Abschnittnamen verboten"

#define MSG_ERROR_CW56_1 82
#define MSG_ERROR_CW56_1_STR "! Kontrolltext nicht beendet"

#define MSG_ERROR_CW56_2 83
#define MSG_ERROR_CW56_2_STR "! Kontrollzeichen sind in Kontrolltexten verboten"

#define MSG_OVERFLOW_CW61 84
#define MSG_OVERFLOW_CW61_STR "Abschnittnummer"

#define MSG_ERROR_CW71_1 85
#define MSG_ERROR_CW71_1_STR "! Fehlender linker Bezeichner von @s"

#define MSG_ERROR_CW71_2 86
#define MSG_ERROR_CW71_2_STR "! Fehlender rechter Bezeichner von @s"

#define MSG_WARNING_CW75_1 87
#define MSG_WARNING_CW75_1_STR "\n! Nicht definiert: <"

#define MSG_WARNING_CW75_2 88
#define MSG_WARNING_CW75_2_STR "\n! Nicht benutzt: <"

#define MSG_WARNING_CW85 89
#define MSG_WARNING_CW85_STR "\n! Zeile mußte umgebrochen werden (Ausgabezeile %d):\n"

#define MSG_ERROR_CW92_1 90
#define MSG_ERROR_CW92_1_STR "! Fehlende } in Kommentar"

#define MSG_ERROR_CW92_2 91
#define MSG_ERROR_CW92_2_STR "! Zusätzliche } in Kommentar"

#define MSG_ERROR_CW94 92
#define MSG_ERROR_CW94_STR "! Unerlaubte Verwendung von @ in Kommentar"

#define MSG_WARNING_CW171 93
#define MSG_WARNING_CW171_STR "\nNichtreduzierbare Scrap-Folge in Abschnitt %d:"

#define MSG_WARNING_CW172 94
#define MSG_WARNING_CW172_STR "\nAnalyse nach Zeile %d:\n"

#define MSG_OVERFLOW_CW176 95
#define MSG_OVERFLOW_CW176_STR "Scrap/Token/Text"

#define MSG_ERROR_CW182 96
#define MSG_ERROR_CW182_STR "! Fehlendes `|' nach C-Text"

#define MSG_ERROR_CW201 97
#define MSG_ERROR_CW201_STR "\n! Unerlaubtes Kontrollzeichen in Abschnittname: <"

#define MSG_ERROR_CW202 98
#define MSG_ERROR_CW202_STR "\n! C-Text in Abschnittname nicht beendet: <"

#define MSG_OVERFLOW_CW202 99
#define MSG_OVERFLOW_CW202_STR "Puffer"

#define MSG_PROGRESS_CW204 100
#define MSG_PROGRESS_CW204_STR "\nSchreibe die Ausgabedatei..."

#define MSG_ERROR_CW209_1 101
#define MSG_ERROR_CW209_1_STR "! TeX-Zeichenkette sollte nur in C-Text stehen"

#define MSG_ERROR_CW209_2 102
#define MSG_ERROR_CW209_2_STR "! Das geht nicht im TeX-Text"

#define MSG_ERROR_CW213 103
#define MSG_ERROR_CW213_STR "! Ungültige Makrodefinition"

#define MSG_ERROR_CW214 104
#define MSG_ERROR_CW214_STR "! Ungültige Formatdefinition"

#define MSG_ERROR_CW217 105
#define MSG_ERROR_CW217_STR "! Hinter dem Abschnittnamen muß ein = Zeichen stehen"

#define MSG_ERROR_CW218 106
#define MSG_ERROR_CW218_STR "! Das geht nicht im C-Text"

#define MSG_PROGRESS_CW225 107
#define MSG_PROGRESS_CW225_STR "\nSchreibe den Index..."

#define MSG_FATAL_CW225_1 108
#define MSG_FATAL_CW225_1_STR "! Kann die Indexdatei nicht öffnen: "

#define MSG_FATAL_CW225_2 109
#define MSG_FATAL_CW225_2_STR "! Kann die Abschnittdatei nicht öffnen: "

#define MSG_OVERFLOW_CW237 110
#define MSG_OVERFLOW_CW237_STR "Sortieren"

#define MSG_STATS_CW248_1 111
#define MSG_STATS_CW248_1_STR "%ld Querverweise (von %ld)\n"

#define MSG_STATS_CW248_2 112
#define MSG_STATS_CW248_2_STR "Parsen:\n"

#define MSG_STATS_CW248_3 113
#define MSG_STATS_CW248_3_STR "%ld Scraps (von %ld)\n"

#define MSG_STATS_CW248_4 114
#define MSG_STATS_CW248_4_STR "%ld Texte (von %ld)\n"

#define MSG_STATS_CW248_5 115
#define MSG_STATS_CW248_5_STR "%ld Ebenen (von %ld)\n"

#define MSG_STATS_CW248_6 116
#define MSG_STATS_CW248_6_STR "Sortieren:\n"


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
