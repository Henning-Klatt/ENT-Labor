clc;
clear all;


% Binäre Quelle, also L=... mögliche Quellsymbole:
L = 2;

% p   ist die Wahrscheinlichkeit für das Sympol x1 = '0'  (= 'A')
% p-1 ist die Wahrscheinlichkeit für das Sympol x2 = '1'  (= 'B')
p = 0.2;

% Vektor mit Wahrscheinlichkeiten der bin. Quellsymbole (0 und 1)
% (Darstellung in Abhängigkeit von p):
pvec = [p 1-p];

% Zum Vergleich: Berechnung der Entropie der binären Quelle (mit pvec):
H = entropy(pvec);


% Länge der binären Zufallssequenz:
%q = 100
%q = 1000
q = 10000

% Jeweils "Mehrfache Durchführung" (4x). Was beobachten Sie?
for wiederholung = 1:4
    
    % Erzeugung einer binären Zufallssequenz mit der gegebenen Funktion
    % "dms", der Implementierung einer diskreten gedächtnislosen
    % Quelle (discrete memoryless source, DMS).
    % Diese Quelle liefert eine Sequenz aus den Buchstaben 'A' und 'B':
    info = dms(pvec, q);
    
    % Relative Häufigkeiten der Quellsymbole 'A' und 'B' bzw. 0 und 1:
    h = hist( info-'A', 0:L-1) / q
    
    % Berechnung der Entropie aus den relativen Häufigkeiten:
    H_h  = entropy(h)
    
end
