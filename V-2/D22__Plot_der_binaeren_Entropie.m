clc;
clear all;

% Vektor der Wahrscheinlichkeiten:
p = [0:0.01:1];

% Berechnung der Entropiewerte mit Hilfe der Funktion e2 (aus Teil 1):
H = e2(p);

% Grafische Ausgabe der Entropie H über p:
figure(2);
plot(p, H);
grid on;
xlabel('p');
ylabel('H(X)');
title(['Binäre Entropiefunktion e2(p)'])
