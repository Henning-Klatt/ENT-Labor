% ENCODIERUNG UND DECODIERUNG DES SINGLE-PARITY-CHECK-CODES
%
% D-5.4
%
% TEST für den Encoder / die Codiervorschrift für SPC-Codes
%
% (C) NT / Uni Ulm

%--------------------------------------------------------------------------
% ERGÄNZEN SIE DIESES SKRIPT AN ALLEN STELLEN, AN DENEN SIE DIE VARIABLE
% "HIER_ERGAENZEN" FINDEN, D.H. ERSETZEN SIE DIESE JEWEILS GEEIGNET!
%--------------------------------------------------------------------------

clear;
clc;

HIER_ERGAENZEN = 0;             % Hilfsvariable. BITTE HIER SO BELASSEN!
SEP = repmat('-',[1 60]);       % Trennstrich für die strukturierte Ausgabe
Gruppe = ['Gruppe: ',getenv('USERNAME')];       % Gruppen- bzw. Username
Versuch = 'Versuch: D-5.4';

%--------------------------------------------------------------------------

disp(SEP)
disp(Gruppe)
disp(Versuch)
disp(SEP)

%% Test der Codiervorschrift für verschiedene Anzahl Informationsbits:
for K = 1:5
    
    K                           % Nur fuer Ausgabe-Zwecke
    i    = ( rand(1,K) > 0.5 )  % zufaelliger Info-Vektor der Länge K
    
    c    = [ i mod(sum(i), 2) ] % Generierung des zugehoerigen Codewortes!!!
    
    wt_c = sum(c)       % Hamming-Gewicht des Codewortes (zur Kontrolle)
    
    disp(SEP)

end

