% DECODIERUNG DES WIEDERHOLUNGSCODES
%
% D-5.1
%
% FUNKTION zur HARD Decision Decodierung von Wiederholungscodes
%
% (C) NT / Uni Ulm

%--------------------------------------------------------------------------
% ERGÄNZEN SIE DIESE FUNKTION AN ALLEN STELLEN, AN DENEN SIE DIE VARIABLE
% "HIER_ERGAENZEN" FINDEN, D.H. ERSETZEN SIE DIESE JEWEILS GEEIGNET!
%--------------------------------------------------------------------------


function [ c_est ] = dec_wdh_hard( r )
% r:     binaerer Empfangsvektor NACH dem Entscheider!
% c_est: binäres Codewort als Ergebnis der Decodierung

HIER_ERGAENZEN = 0;                % Hilfsvariable. BITTE HIER SO BELASSEN!


% Codewortlänge
N = size(r,2);

% Berechne die Anzahl Einsen in r...
NumberOnes = sum(r);

% ... und pruefe ob sie groesser als die halbe CW-Laenge ist.
% Das Ergebnis ist ...(0 oder 1?) falls wahr, und ...(?) falls falsch:
if NumberOnes >= (N/2)
    Decision = 1;
else
    Decision = 0;
end

    
% Erzeuge damit des wahrscheinlichere Codewort der Länge N:
c_est = repelem(Decision, N);

end

