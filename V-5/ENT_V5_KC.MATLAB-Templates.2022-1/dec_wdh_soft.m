% DECODIERUNG DES WIEDERHOLUNGSCODES
%
% D-5.2
% V-5.5 (siehe ENT-Buch Bossert, S. 192)
%
% FUNKTION zur SOFT Decision Decodierung von Wiederholungscodes
%
% (C) NT / Uni Ulm

%--------------------------------------------------------------------------
% ERGÄNZEN SIE DIESE FUNKTION AN ALLEN STELLEN, AN DENEN SIE DIE VARIABLE
% "HIER_ERGAENZEN" FINDEN, D.H. ERSETZEN SIE DIESE JEWEILS GEEIGNET!
%--------------------------------------------------------------------------


function [ c_est ] = dec_wdh_soft( y )
% y:     Empfangsvektor
% c_est: binäres Codewort als Ergebnis der Decodierung

HIER_ERGAENZEN = 0;                % Hilfsvariable. BITTE HIER SO BELASSEN!


% Codewortlänge:
N = size(y, 2);

% Berechne die Summe der Vektorelemente aus y:
SumY = sum(y);

% Falls die Summe < 0, Entscheidung auf ...(?) sonst auf ...(?):
Decision = (SumY/N) < 0;
    
% Erzeuge damit das wahrscheinlichere Codewort der Länge N.
c_est = repelem(Decision, N);

end

