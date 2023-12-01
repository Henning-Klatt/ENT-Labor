clc;
clear all;


p = 0:0.01:1; % p   = Wahrscheinlichkeiten des Quellensymbols x1='0'
              % p-1 = Wahrscheinlichkeiten des Quellensymbols x2='1'

B = 1:1:6;    % B   = Längen der Hypersymbole

% Anzahl der Wahrscheinlichkeiten und Blocklängen bzw. Längen der Vektoren:
lp = length(p);
lB = length(B);

% Initialisierung leerer Matrizen für die unten ermittelten Werte:
ml = zeros(lp,lB);
H  = zeros(lp,lB);

% Konstruktion der Legende für den Plot:
leg = cell(lB+1,1);
leg{lB+1} = sprintf('H');

% Ermittlung der Wortlängen und Berechnung der Entropien:

% Laufvariable zur Indizierung der Blocklänge 
for iB=1:lB
    
    % Laufvariable zur Indizuerung der Wahrscheinlichkeit
    for ip=1:lp
        
        % Wahrscheinlichk. der einzelnen Quellenwörter bzw. Hypersymbole:
        pvec_hyp = pr_block(p(ip), B(iB));

        % Konstruktion Code(baum):
        code = huffman_construction(pvec_hyp);

        % Alle Wortlaengen als (Spalten-) Vektor:
        l = cellfun( @length , code );
        
        % Mittlere Wortlaenge (in bit pro BINÄREM Quellensymbol):
        ml(ip,iB) = pvec_hyp * l / B(iB) ;
        
        % Entropie (in bit pro BINÄREM Quellensymbol):
        H(ip,iB) = entropy(pvec_hyp)/ B(iB) ;
    end
    
    % Legende fuer diese Kurve:
    leg{iB} = sprintf('ml(B=%d)',B( iB ));
end

figure(6)

% Darstellung der mittleren Wortlängen über p:
plot( p , ml       ,'-','LineWidth',2);
hold on;
    
% Darstellung der Entropien über p:
plot( p              , H ,'k--','LineWidth',2);
hold off;

% Beschriftungen und Skalierung:
legend(leg);
axis([0 1 0 1.1]);
grid on;
xlabel('p = Wahrscheinlichkeit fuer Quellensymbol "0"')
ylabel('ml(B) , H')
title('Mittlere Codewortlängen ml und Entropie der Quelle H (jeweils in bit/Quellensymbol)')
