% DECODIERUNG DES WIEDERHOLUNGSCODES
%
% D-5.1
%
% TEST des HARD-Decision Decoders "dec_wdh_hard" fuer Wdh.-Codes
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
Versuch = 'Versuch: D-5.1';

%--------------------------------------------------------------------------

disp(SEP)
disp(Gruppe)
disp(Versuch)
disp(SEP)

%% Ergänzend zur Aufgabenstellung: Einfache Tests:

% Test a:

r = [ 0 0 1 1 1 ]
c_est_hard = dec_wdh_hard(r)

disp(SEP)

% Test b:

r = [ 0 0 0 1 1 ]
c_est_hard = dec_wdh_hard(r)

disp(SEP)

%% Vorgegebene Tests aus D-5.2

% Test 1:

y = [ -0.8 0.2 1.1 -0.4 -0.6 ]

r = y < 0
c_est_hard = dec_wdh_hard(r)

disp(SEP)

% Test 2:

y = [ -0.8 0.2 1.1 -0.4 0.6 ]

r = y < 0
c_est_hard = dec_wdh_hard(r)

disp(SEP)
