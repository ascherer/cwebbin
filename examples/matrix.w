%
% CWEB $VER: matrix.w 1.5 (09.06.2000)
%
% BESCHREIBUNG:
%    Dieses CWEB Programm soll als Beispiel f�r einige Erweiterungen
%    dienen, die erst mit der neuen Version 3 des CWEB-Systems verf�gbar
%    sind.  Es liest die Datei `Matrix.input', die in vier Zeilen jeweils
%    vier Eintr�ge der Form `(Realteil,Imagin�rteil)' enthalten, und
%    berechnet zu der so definierten komplexen Matrix die Inverse.  Ist
%    die Eingabedatei nicht vorhanden, werden die entsprechenden Werte vom
%    Benutzer angefordert.  Als Besonderheiten f�r CWEB-Interessierte m�chte
%    ich zwei Punkte anf�hren.  Zuerst und vor allem ist es ein deutsches
%    Programm, sowohl die Ein- als auch die Ausgabe ist f�r diese Sprache
%    gedacht.  F�r die TeXnische Weiterverarbeitung wird also `dcwebmac.tex'
%    ben�tigt, da dort die entsprechende Anpassung bez�glich der Umlaute
%    und Anf�hrungszeichen enthalten ist.  Zweitens ist es ein C++ Programm
%    und mu� deshalb mit CWEB 3.0 verarbeitet werden; �ltere Versionen ohne
%    die Change-Datei von Hans-Hermann Bode werden ihre Schwierigkeiten
%    haben.  Au�erdem mu� zur �bersetzung ein C++-Compiler benutzt werden.
%
% ERSTELLUNGSDATUM: 21.11.1993 (V1.0)
%
% AUTOR: Andreas Scherer
%
% URHEBERRECHT: (c) 1993 Andreas Scherer
%
% Die Anfertigung und Verteilung von unver�nderten Kopien der
% elektronischen Form dieses Dokumentes ist erlaubt, sofern der
% Urheberrechtshinweis und dieser Berechtigungshinweis bei allen
% Kopien erhalten bleibt.
%
% Die Anfertigung und Verteilung von ver�nderten Versionen dieses
% Dokumentes ist erlaubt unter den Bedingungen f�r unver�nderte Kopien,
% sofern das gesamte hiervon abgeleitete Werk unter den Bedingungen eines
% mit diesem vergleichbaren Berechtigungshinweises verteilt wird.
%
% �NDERUNGEN:
%    26.11.1993: <stdlib.h> mu� *nach* <complex.h> eingebunden
%                werden, sonst meckert SAS/C++ 6.50 (V1.1)
%    03.01.1994: Version als konstanter Zeiger (V1.2)
%    16.03.1995: Kleinere Korrekturen (V1.3)
%    08.06.2000: Include-Struktur verbessert (V1.4)
%    09.06.2000: `Matrix' l��t sich mit g++ �bersetzen (V1.5)

% Spezielle Fonts f�r Teile der Dokumentation.
%
\font\ams=msbm10

% Ein kleiner Trick zur Darstellung der Determinantenschreibweise, da
% der senkrechte Strich in \.{CWEB} eine besondere Bedeutung besitzt.
%
\def\leftbar{\left|}
\def\rightbar{\right|}

% Wir brauchen kein Inhaltsverzeichnis, da nur zwei Kapitel existieren.
%
\nocon

@i ../cwebinputs/ecma94.w % For the sake of CWEB and TeX

\input german.sty \originalthree % Redefine `\3' from `dcwebmac.tex'.

@* Matrizeninversion. Dieses Programm dient zur Invertierung einer
vorgegebenen $4$-reihigen |Matrix|
$$
  A=\left(
    \matrix{
      a_{11}&\cdots&a_{14}\cr
      \vdots&\ddots&\vdots\cr
      a_{41}&\cdots&a_{44}\cr}
  \right)
$$
mit Eintr�gen $a_{ij}$ aus dem K�rper der komplexen Zahlen~{\ams C}.
Urspr�nglich wurde es auf einem {\mc PC} mit dem Borland~\CPLUSPLUS/
Compiler entwickelt.  Ein Vorteil dieses Sprachdialektes ist die
Bereitstellung des Datentypes "`komplexe Zahl"'.  Nach einem
Zwischenstadium als {\mc ANSI-C}-Programm, das ich mit dem {\mc
SAS/C}-6.3 aus der urspr�nglichen Form entwickelte, erfolgt nun die
R�ckportierung nach \CPLUSPLUS/ mit der neuen Version~6.50 des {\mc
SAS/C}-Systems.  Der Aufbau des Programmes selbst gliedert sich in
folgende Teile:

@c
@<Globale \#|include|s@>@/
@<Versionsnummer      @>@/
@<Funktionsprototypen @>@/
@<Funktionen          @>@/
@<Die |main|-Funktion @>

@ Den mathematischen Hintergrund f�r das angewandte Verfahren liefert
das "`Taschenbuch der Mathematik"' von I.~N.~Bronstein und
K.~A.~Semendjajew (B.~G.~Teubner Verlagsgesellschaft Stuttgart und
Leipzig, 25.~Auf\-lage 1991, {\mc ISBN}~3--8154--2000--8).
Auf Seite~154 wird die Berechnung einer inversen Matrix nach der Formel
$$
  Inverse = Matrix^{-1} = {1\over\det Matrix}\left(\matrix{
    A_{11}&\cdots&A_{1n}\cr
          &\cdots&      \cr
    A_{n1}&\cdots&A_{nn}\cr}\right)^{T}
$$
hergeleitet.  Ausgangspunkt ist eine |Dimension|-reihigen |Matrix|, zu der
in den folgenden Schritten die |Determinante| und die |Adjunkte| berechnet
werden.  Bei der Berechnung der |Inverse|n anhand dieser Formel ist zu
beachten, da� die Transposition der |Adjunkte|n einfach durch
Vertauschung der Zeilen- und Spaltenindizes geschieht.
@^Taschenbuch der Mathematik@>
@^Bronstein, Ilja N.@>
@^Semendjajew, K. A.@>

@<Berechne die |Inverse|@>=
   for(i=0; i<Dimension; i++) {
      for(j=0; j<Dimension; j++)
         Inverse[i][j] = Adjunkte[j][i]/Determinante;
      }

@ Der aufwendigste Teil dieser Formel steckt in der Berechnung der
|Adjunkte|n zur $4$-reihigen komplexen |Matrix|.  (Die Dimension spielt
mathematisch keine Rolle, programmtechnisch mu� aber f�r andere
|Dimension|en eine Anpassung vorgenommen werden.)  Diese setzt sich zusammen
aus den algebraischen Komplementen~$A_{ij}$ der Elemente~$a_{ij}$ der
|Matrix|, die sich nach der Formel
$$
  A_{ij} = (-1)^{i+j}\leftbar\matrix{
    a_{11}   &\cdots&a_{1,j-1}  &a_{1,j+1}  &\cdots&a_{1n}   \cr
    \ldots   &      &\ldots     &\ldots     &      &\ldots   \cr
    a_{i-1,1}&\cdots&a_{i-1,j-1}&a_{i-1,j+1}&\cdots&a_{i-1,n}\cr
    a_{i+1,1}&\cdots&a_{i+1,j-1}&a_{i+1,j+1}&\cdots&a_{i+1,n}\cr
    \ldots   &      &\ldots     &\ldots     &      &\ldots   \cr
    a_{n1}   &\cdots&a_{n,j-1}  &a_{n,j+1}  &\cdots&a_{nn}  \cr}
  \rightbar
$$
berechnen (Bronstein, Seite~149, |n==Dimension|).  F�r die
Implementierung ben�tigen wir die $3$-reihige |Hilfsmatrix| und die
Variable |Faktor|, die die Potenz von $-1$ repr�sentiert.
@^Taschenbuch der Mathematik@>
@^Beschr�nkung der Allgemeinheit@>

@s complex int

@<Funktionen@>=
void AdjunkteMatrix(complex<double> **Matrix,complex<double> **Adjunkte)
   {
   int i,j,corralloc = 1;
   complex<double> **Hilfsmatrix,Faktor;

   @<Allokiere die |Hilfsmatrix|@>@;

   if(corralloc) {
      for(i=0; i<4; i++) {
         @<Setze den Vorfaktor f�r die adjunkte Determinante@>@;

         for(j=0; j<4; j++) {
            @<Streiche Zeile |i| und Spalte |j|               @>@;
            @<Berechne die Determinante der |Hilfsmatrix|     @>@;
            @<Multipliziere die Determinante mit dem Vorfaktor@>@;

            Faktor *= complex<double>(-1.); /* |Faktor| wechselt spaltenweise */
            }
         }
      }

   @<Gib den Speicher der |Hilfsmatrix| wieder frei@>@;
   }

@ Der Vorfaktor in dieser allgemeinen Formel bestimmt sich aus der Potenz
von~$-1$ nach der Summe aus Spaltennummer und Zeilennummer des gerade
betrachteten |Matrix|elementes~$a_{ij}$.  Zu beachten ist dabei, da� in
\CEE/ Vektoren und damit auch Matrizen nicht bei~$1$ sondern bei~$0$ beginnend
indiziert werden.  Da es sich aber um ein zweidimensionales Objekt handelt,
hebt sich die quadratische Potenz von~$-1$ wieder auf.

@<Setze den Vorfaktor f�r die adjunkte Determinante@>=
   for(Faktor=complex<double>(1.),j=0; j<i; j++)
      Faktor *= complex<double>(-1.);

@ Die angegebene Determinantendarstellung besagt, da� man die
Ausgangsmatrix um die Zeile~|i| und die Spalte~|j| des gerade betrachteten
Elementes "`reduzieren"' mu�, bevor man die Determinante
berechnen darf.  Im Programm wird dazu aus der Ausgangsmatrix die
entsprechend verkleinerte |Hilfsmatrix| gebildet.

 @<Streiche Zeile |i| und Spalte |j|@>=
   MatrixReduktion(4,Matrix,Hilfsmatrix,i,j);

@ Die Reduktion der |Matrix| zur |Dimension-1|-reihigen |Hilfsmatrix|
geschieht durch Streichen der Zeile~|i| und der Spalte~|j|.  Da dieser
Vorgang f�r jedes der |Dimension|$^2$ Elemente der |Matrix|
durchgef�hrt werden mu�, wird dazu eine elementare Funktion
definiert, die sogar mit einer anderen |Dimension| als~$4$ eingesetzt
werden kann.  Die Z�hlvariablen |k| und~|l| bezeichnen die
Zeilen beziehungsweise die Spalten der Ausgangs-|Matrix|, |m|~und~|n|
die der |Hilfsmatrix|.

@<Funktionen@>=
void MatrixReduktion(int Dimension,complex<double> **Matrix,@|
complex<double> **Hilfsmatrix,int i,int j)
   {
   int k,l,m,n;

   for(k=0,m=0; k<Dimension; k++) {
      if(k!=i) { /* Zeile wird ausgelassen f�r |k==i| */
         for(l=0,n=0; l<Dimension; l++) {
            if(l!=j) { /* Spalte wird ausgelassen f�r |l==j| */
               Hilfsmatrix[m][n] = Matrix[k][l];
               n++; /* N�chste Spalte der |Hilfsmatrix| */
               }
            }
         m++; /* N�chste Zeile der |Hilfsmatrix| */
         }
      }
   }

@ Als Zwischenschritt folgt nun die Berechnung der Determinante der
|Hilfsmatrix|.  Diese wird bereits in das entsprechende Feld der
|Adjunkte|n gestellt, das aber noch mit dem getrennt berechneten Faktor
multipliziert werden mu�.

@<Berechne die Determinante der |Hilfsmatrix|@>=
   Adjunkte[i][j] = ComplexDet(Hilfsmatrix);

@ Im vorliegenden Programm zur Berechnung einer |Inverse|n der
|Dimension|~$4$ haben wir es stets mit einer $3$-dimensionalen
|Hilfsmatrix| zu tun.  Deren Determinante (beachte die Schreibweise) wird
nach der Beispielformel~2 von Seite~149 aus Bronstein berechnet (Regel von
Sarrus)
$$
  \leftbar\matrix{
    a_{11}&a_{12}&a_{13}\cr
    a_{21}&a_{22}&a_{23}\cr
    a_{31}&a_{32}&a_{33}\cr}\rightbar=
  (a_{11}a_{22}a_{33} + a_{12}a_{23}a_{31} + a_{13}a_{21}a_{32})-
  (a_{13}a_{22}a_{31} + a_{11}a_{23}a_{32} + a_{12}a_{21}a_{33}).
$$
@^Taschenbuch der Mathematik@>
@^Beschr�nkung der Allgemeinheit@>

@d ComplexDet(H) @/
  (H[0][0]*H[1][1]*H[2][2]+H[0][1]*H[1][2]*H[2][0]+H[0][2]*H[1][0]*H[2][1])-@/
  (H[0][2]*H[1][1]*H[2][0]+H[0][0]*H[1][2]*H[2][1]+H[0][1]*H[1][0]*H[2][2])

@ Der berechnete Zwischenwert mu� noch mit dem vorher definierten 
|Faktor| multipliziert werden, damit das endg�ltige algebraische
Komplement~$A_{ij}$ entsteht.

@<Multipliziere die Determinante mit dem Vorfaktor@>=
   Adjunkte[i][j] *= Faktor;

@ Nach der Aufstellung der |Adjunkte|n zur |Matrix| ben�tigen wir jetzt
noch die |Determinante|.  Erfreulicherweise ist dazu nun kein gro�er
Aufwand mehr n�tig, da diese nach dem Laplaceschen Entwicklungssatz
$$
  Determinante=\sum_{i=1}^{n}a_{ij}A_{ij}=\sum_{j=1}^{n}a_{ij}A_{ij}
$$
aus den Elementen der |Matrix| und der zugeh�rigen |Adjunkte|n berechnet
werden kann (Bronstein, Seite~150).  Dabei ist es egal, nach welcher Zeile
oder Spalte die Entwicklung durchgef�hrt wird.  Wir verwenden die erste
Spalte.
@^Taschenbuch der Mathematik@>

@<Laplace-Entwicklung der |Determinante|n@>=
   Determinante = complex<double>(0.);
   for(i=0; i<Dimension; i++)
      Determinante += Matrix[i][0]*Adjunkte[i][0];

@ Nach der Darlegung des mathematischen Formelwerkes und dessen Umsetzung
in \CEE/-Routinen folgt nun das Hauptprogramm, das den Rahmen f�r die
Anwendung der beschriebenen Funktionen bildet.  Zus�tzlich verwendet es
weitere Unterroutinen, die rein programmiertechnischer Natur sind und
im folgenden unabh�ngig vom mathematischen Problem beschrieben werden.

@<Die |main|-Funktion@>=
int main()
   {
   complex<double> **Matrix,**Adjunkte,**Inverse;
   complex<double> Determinante;
   int i,j,Dimension=4,corralloc=1;

   @<Allokiere die zu invertierende |Matrix|@>@;
   @<Allokiere die |Adjunkte|               @>@;
   @<Allokiere die |Inverse|                @>@;

   if(corralloc) {
      MatrixInit(Dimension,Matrix);
      MatrixDisplay(Dimension,Matrix);
      AdjunkteMatrix(Matrix,Adjunkte);
      @<Laplace-Entwicklung der |Determinante|n@>@;
      @<Berechne die |Inverse|                 @>@;
      MatrixDisplay(Dimension,Inverse);
      }

   @<Gib den Speicher wieder frei@>@;
   return(corralloc);
   }

@ F�r die formatierte Ein- und Ausgabe, die dynamische Speicherverwaltung
sowie die mathematischen Funktionen ben�tigen wir die
Standarddeklarationen, wie sie in den Include-Dateien zu finden sind.

@<Globale \#|include|s@>=
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <complex>
using std::complex;
@<Zus�tzliche Deklarationen f�r den Coprozessor@>

@ Bei der Benutzung des mathematischen Coprozessors sollten zus�tzlich zu
{\tt math.h} die speziellen Funktionsdeklarationen eingebunden werden.
Dies gilt in diesem Fall speziell f�r den Commodore Amiga und den {\mc
ANSI-C}-Compiler von {\mc SAS}~Institute, Cary (North Carolina).

@<Zus�tzliche Deklarationen f�r den Coprozessor@>=
#ifdef _M68881
#include <m68881.h>
#endif
@^Systemabh�ngigkeiten@>

@ Die aktuelle Versionsnummer dieses Programmes wird nach dem "`Style
Guide"' von Commodore in einer globalen Formatzeichenkette abgelegt und
kann mit der Systemroutine {\tt version Matrix} abgefragt werden.

@<Versionsnummer@>=
const char *Version = "$VER: MATRIXINVERTIERUNG 2.0 (20.11.1993)";
@^Systemabh�ngigkeiten@>

@ Die meisten Routinen dieses Programmes sind unabh�ngig von der
gew�hlten |Dimension| des Problems.  Alle aber stellen nur minimale
Forderungen an die Gestalt der verwendeten Matrizen, da sie lediglich mit
Zeigern auf entsprechende Felder versorgt werden m�ssen.  Damit
l��t sich aber auch die Eingabe des Ausgangsproblems fast beliebig
gestalten.  Bei dieser allgemeinen Implementierung kann dies auf zwei
verschiedene Weisen geschehen.  Standardeingabe ist die Datei
"`{\tt Matrix.input}"', falls diese im aktuellen Verzeichnis vorhanden
ist.  Falls nicht, wird der Benutzer zur elementweisen Eingabe der
komplexen Elemente der |Matrix| aufgefordert.  Wird eine andere
Verfahrensweise gew�nscht, so mu� lediglich diese Funktion zur Eingabe
und die weiter unten beschriebene Funktion zur Ausgabe der Problemstellung
ge�ndert oder angepa�t werden.

@<Funktionen@>=
void MatrixInit(int Dimension,complex<double> **Matrix)
   {
   int i,j;
   double Realteil,Imagteil;
   FILE *fp;

   if(fp = fopen("Matrix.input","r")) {
      for(i=0; i<Dimension; i++) {
         for(j=0; j<Dimension; j++) {
            fscanf(fp,"(%lf,%lf)",&Realteil,&Imagteil);
            Matrix[i][j] = complex<double>(Realteil,Imagteil);
            }
         }
      fclose(fp);
      }
   else {
      for(i=0; i<Dimension; i++) {
         for(j=0; j<Dimension; j++) {
            printf("Real A[%d][%d] = ",i+1,j+1);
            scanf("%lf",&Realteil);
            printf("Imag A[%d][%d] = ",i+1,j+1);
            scanf("%lf",&Imagteil);
            Matrix[i][j] = complex<double>(Realteil,Imagteil);
            }
         fputc('\n',stdout);
         }
      }
   }
@^Beschr�nkung der Allgemeinheit@>
@^Systemabh�ngigkeiten@>

@ Ebenso einfach wie die Eingabe ist auch die Ausgaberoutine gestaltet.
Sie zeigt eine quadratische |Dimension|-reihige |Matrix| mit komplexen
Eintr�gen zum einen am Bildschirm an und schreibt gleichzeitig das
Ergebnis im gleichen Format in die Datei "`{\tt Matrix.output}"', das
beim Einlesen aus "`{\tt Matrix.input}"' erwartet wird.

@<Funktionen@>=
void MatrixDisplay(int Dimension,complex<double> **Matrix)
   {
   int i,j;
   FILE *fp;

   fp = fopen("Matrix.output","w");
   for(i=0; i<Dimension; i++) {
      for(j=0; j<Dimension; j++) {
         if(fp) fprintf(fp,"(%lf,%lf)",real(Matrix[i][j]),imag(Matrix[i][j]));
         printf("(%lf,%lf) ",real(Matrix[i][j]),imag(Matrix[i][j]));
         }
      if(fp) fputc('\n',fp);
      fputc('\n',stdout);
      }
   fputc('\n',stdout);
   fclose(fp);
   }
@^Beschr�nkung der Allgemeinheit@>
@^Systemabh�ngigkeiten@>

@ Was ein echtes \CEE/-Programm sein will, das verwendet so wenig wie
m�glich feste Gr��en bei der Definition von Speicherfl�chen.
Zwar sind in diesem Fall alle Dimensionen bekannt und bei jedem Lauf immer
gleich, aber trotzdem ist es eine nette �bung, den ben�tigten
Speicherplatz "`dynamisch"' anzufordern und nach seiner Benutzung
wieder ordnungsgem�� freizugeben.  Die |Matrix|, ihre |Adjunkte| und
die zu berechnende |Inverse| werden lokal in |main| als Zeigervariablen
definiert und erhalten auch lokal ihren Speicherplatz zugewiesen.

@<Allokiere die zu invertierende |Matrix|@>=
   if(Matrix = (complex<double> **)calloc(Dimension,
         sizeof(complex<double> *))) {
      for(i=0; i<Dimension; i++)
         if(!(Matrix[i] = (complex<double> *)calloc(Dimension,
               sizeof(complex<double>))))
            corralloc = 0;
      }
   else corralloc = 0;

@ @<Allokiere die |Adjunkte|@>=
   if(Adjunkte = (complex<double> **)calloc(Dimension,
         sizeof(complex<double> *))) {
      for(i=0; i<Dimension; i++)
         if(!(Adjunkte[i] = (complex<double> *)calloc(Dimension,
               sizeof(complex<double>))))
            corralloc = 0;
      }
   else corralloc = 0;

@ @<Allokiere die |Inverse|@>=
   if(Inverse = (complex<double> **)calloc(Dimension,
         sizeof(complex<double> *))) {
      for(i=0; i<Dimension; i++)
         if(!(Inverse[i] = (complex<double> *)calloc(Dimension,
               sizeof(complex<double>))))
            corralloc = 0;
      }
   else corralloc = 0;

@ Nach der erfolgreichen Durchf�hrung aller Berechnungsschritte mu� vor
Beendigung des Programmes der angeforderte Speicher wieder freigegeben werden.
Dies geschieht in umgekehrter Reihenfolge zur Allokierung.

@d FreeObject(A) if(A) free(A);

@<Gib den Speicher wieder frei@>=
   for(i=Dimension-1; i>=0; i--) {
      FreeObject(Inverse[i]);
      FreeObject(Adjunkte[i]);
      FreeObject(Matrix[i]);
      }

   FreeObject(Inverse);
   FreeObject(Adjunkte);
   FreeObject(Matrix);

@ Noch radikaler als bei den genannten Matrizen erfolgt die Lokalisierung
der |Hilfsmatrix|.  Sie wird erst innerhalb der Funktion |AdjunkteMatrix|
definiert und mit Speicherplatz besorgt.

@<Allokiere die |Hilfsmatrix|@>=
   if(Hilfsmatrix = (complex<double> **)calloc(3,
         sizeof(complex<double> *))) {
      for(i=0; i<3; i++)
         if(!(Hilfsmatrix[i] = (complex<double> *)calloc(3,
               sizeof(complex<double>))))
            corralloc = 0;
      }
   else corralloc = 0;
@^Beschr�nkung der Allgemeinheit@>

@ @<Gib den Speicher der |Hilfsmatrix| wieder frei@>=
   for(i=0; i<3; i++) FreeObject(Hilfsmatrix[i]);
   FreeObject(Hilfsmatrix);
@^Beschr�nkung der Allgemeinheit@>

@ Als letztes Modul im Programmflu� angelegt, jedoch in der
endg�ltigen \CEE/-Quelldatei sehr weit vorne, stehen hier die Prototypen
aller verwendeten Funktionen.  Die Beschreibung der Parameterliste und die
Angabe des R�ckgabewertes erm�glicht es dem Compiler, eventuelle
Programmierfehler festzustellen und zu melden.

@<Funktionsprototypen@>=
void MatrixInit(int,complex<double> **);@/
void MatrixReduktion(int,complex<double> **,complex<double> **,int,int);@/
void MatrixDisplay(int,complex<double> **);@/
void AdjunkteMatrix(complex<double> **,complex<double> **);@/
int main(void);

@* Index.  Zum Abschlu� der Dokumentation folgen noch das
Stichwortverzeichnis mit s�mtlichen verwendeten Bezeichnern sowie eine
Zusammenfassung aller Programmodule.  Zu beachten sind insbesondere die
Eintr�ge "`Beschr�nkung der Allgemeinheit"' und "`Systemabh�ngigkeiten"'.
