clc;
clear all;

p = 0.2     % p   = Wahrscheinlichkeit des Quellensymbols x1='0'
            % 1-p = Wahrscheinlichkeit des Quellensymbols x2='1'

B = 2       % B   = Länge der Hypersymbole
%B = 3
%B = 4
%B = 5

% Wahrscheinlichkeiten der einzelnen Quellenwörter bzw. Hypersymbole:
pvec_hyp = pr_block(p, B);

disp(SEP)

% Konstruktion des Code(baum)s:
code = huffman_construction(pvec_hyp);

% Darstellung des Codebaums:
if B==2 figure(4); else figure(5); end;
huffman_plottree( code );
suptitle( [Gruppe, ', ',Versuch, ', Codebaum für B=',int2str(B)] )

% Alle Wortlängen als (Spalten-)Vektor
% (mit cellfun oder notfalls in einer Schleife).
% Welche Funktion wird benötigt?
l = cellfun( @length , code );

% Mittlere Wortlänge gemäss Codebaum (in bit pro Hypersymbol):
% liefert Skalar zurück
ml_hyp = pvec_hyp*l

% Mittlere Wortlänge gemäss Codebaum (in bit pro BINÄREM Quellensymbol,
% also normiert):
ml = ml_hyp / B

%% D-2.5  (Zum Vergleich: Entropie der Quelle)

% Entropie (in bit pro Hypersymbol):
H_hyp = entropy(pvec_hyp)

% Entropie (in bit pro BINÄREM Quellensymbol), also normiert:
H = H_hyp / B

% Entropie der urspruenglichen binaeren Quelle (zur Kontrolle): 
H_bin = e2(p)

