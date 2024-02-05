% ENCODIERUNG UND DECODIERUNG DES SINGLE-PARITY-CHECK-CODES
%
% D-5.5
%
% TEST des Soft-Decision Decoders "dec_spc_soft" fuer SPC-Codes
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
Versuch = 'Versuch: D-5.5';

%--------------------------------------------------------------------------

disp(SEP)
disp(Gruppe)
disp(Versuch)
disp(SEP)

%% Vorgegebene Tests:
%  Handelt es sich bei c_dec_soft (und r) um gueltige Codeworte?
%  r wird nur zum Vergleich angegeben.

% Test 1:

y = [ HIER_ERGAENZEN ]
c_est_soft = HIER_ERGAENZEN

r = y < HIER_ERGAENZEN

disp(SEP)

% Test 2:

y = [ HIER_ERGAENZEN ]
c_est_soft = HIER_ERGAENZEN

r = y < HIER_ERGAENZEN

disp(SEP)