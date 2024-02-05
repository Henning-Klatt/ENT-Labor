% DECODIERUNG DES WIEDERHOLUNGSCODES
%
% D-5.2
% 
% TEST des SOFT-Decision Decoders "dec_wdh_soft" fuer Wdh.-Codes
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
Versuch = 'Versuch: D-5.2';

%--------------------------------------------------------------------------

disp(SEP)
disp(Gruppe)
disp(Versuch)
disp(SEP)

%% Vorgegebene Tests:

% Test 1:

y = [ -0.8 0.2 1.1 -0.4 -0.6 ]
c_est_soft = dec_wdh_soft(y)

r = y < 0
c_est_hard = dec_wdh_hard(r)

disp(SEP)

% Test 2:

y = [ -0.8 0.2 1.1 -0.4 0.6 ]
c_est_soft = dec_wdh_soft(y)

r = y < 0
c_est_hard = dec_wdh_hard(r)

disp(SEP)

%% Zusätzliche Aufgabenstellung:
%  Finde mindestens einen Empfangsvektor für den Hard- und Soft-Decision
%  ein unterschiedliches Decodierergebnis liefern:

% Test 3:

y = [ -0.1 0.9 -0.1 -0.1 0.9 ]
c_est_soft = dec_wdh_soft(y)

r = y < 0
c_est_hard = dec_wdh_hard(r)

disp(SEP)
