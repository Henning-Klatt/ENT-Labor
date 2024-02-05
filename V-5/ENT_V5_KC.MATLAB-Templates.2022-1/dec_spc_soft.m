% ENCODIERUNG UND DECODIERUNG DES SINGLE-PARITY-CHECK-CODES
%
% D-5.5
% V-5.6 (siehe ENT-Buch Bossert, S. 192)
%
% FUNKTION zur SOFT Decision Decodierung von Single Parity Check Codes
%
% (C) NT / Uni Ulm

%--------------------------------------------------------------------------
% ERGÄNZEN SIE DIESE FUNKTION AN ALLEN STELLEN, AN DENEN SIE DIE VARIABLE
% "HIER_ERGAENZEN" FINDEN, D.H. ERSETZEN SIE DIESE JEWEILS GEEIGNET!
%--------------------------------------------------------------------------


function [ c_est ] = dec_spc_soft( y )
% y:     Empfangsvektor
% c_est: binäres Codewort als Ergebnis der Decodierung

HIER_ERGAENZEN = 0;                % Hilfsvariable. BITTE HIER SO BELASSEN!


% Vektor aus hart entschiedenen Codebits:
c_est = HIER_ERGAENZEN;

if mod( HIER_ERGAENZEN, 2) > HIER_ERGAENZEN
   % Falls c_est KEIN gueltiges Codewort ist:
    
    [ MinAbs MinIndex ] = HIER_ERGAENZEN; % unsicherste Stelle (kleinster
                                          % Betrags und seine Position)
                                          
    c_est( HIER_ERGAENZEN ) = HIER_ERGAENZEN; % "Flippe" das unsicherste Bit
    
end

end

