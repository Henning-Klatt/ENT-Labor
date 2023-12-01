function [ pvec_hyp ] = pr_block( p, B )

    % p   ist die Wahrscheinlichkeit für das Quellensymbol x1 = "0"
    % 1-p ist die Wahrscheinlichkeit für das Quellensymbol x2 = "1"HIER_ERGAENZEN
    %
    % B ist die Länge der Hypersymbole


    % Die Indizees aller B Hypersymbole 0 bis (2^B)-1 als SPALTENVEKTOR
    % (es ginge auch ein Zeilenvektor). In jeder Zeile steht ein Index:
    ind = ( [0:2^B-1]).';

    % Binärdarstellung aller Indizes als Matrix (bzw. als SPALTENVEKTOR von
    % binären Zeilenvektoren = Quellenwörtern). Eine Zeile entspricht bei
    % Verwendung der Matlab-Funktion "de2bi" IMMER einem Index (Quellenwort)
    % in Binaerdarstellung:
    ind_bin = de2bi(ind, B);

    % Anzahl "1"en je Hypersymbol (= Hammingewicht, wenn man so will).
    % Als SPALTENVEKTOR, also für alle Hypersymbole!
    % Tipp: Lesen Sie vorab mit "doc sum" die Anleitung des Kommandos "sum"!
    % Dimension: 2
    wt_s = sum(ind_bin,2);
    % Umwandlung in einen Zeilenvektor:
    wt_z = wt_s.';

    % Berechnung der Wahrscheinlichkeit fuer jedes Hypersymbole aus
    % p und wt_z (oder wt_s) als ZEILENVEKTOR in korrekter Reihenfolge:
    pvec_hyp = p.^(B-wt_z).*(1-p).^(wt_z)

end
