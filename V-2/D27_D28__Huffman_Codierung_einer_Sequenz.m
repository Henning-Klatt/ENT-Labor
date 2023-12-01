clc;
clear all;


%% binaere Quelle ---------------------------------------------------------

L = 2;        % Anzahl Quellensymbole. Binäre Quelle!

q = 100       % Länge der (binären) Quellsymbol-Sequenz 
%q = 1000
%q = 10000
%q = 100000

p = 0.2;       % p   = Wahrsch. des Quellsymbols x1='0'
               % 1-p = Wahrsch. des Quellsymbols x2='1'
            
% Vektor der Wahrscheinlichkeiten der binären Quellensymbole 0 und 1: 
pvec = [p 1-p];

%% Blockbildung -----------------------------------------------------------

% Blocklänge
B = 2         % D-2.7
%B = 4        % D-2.8
%B = 5        % D-2.8

% Anzahl mögliche Quellenwörter bzw. Hypersymbole (L_hyp-stufiges Alphabet).
% Berechnung in Abhängigkeit von L:
L_hyp = L^B; 

% Länge der Hypersymbol-Sequenz (zum Glück ist 100 teilbar durch 2, 4 und 5).
% Berechnung in Abhängigkeit von q:
q_hyp =  q / B

% Wahrscheinlichkeiten der einzelnen Hyperymbole:
pvec_hyp = pr_block(p, B)

%% Huffman-Encoder / Baum -------------------------------------------------

% Konstruktion des Codebaums:
code = huffman_construction(pvec_hyp);

% Darstellung des Codebaums:
if B==2 figure(7); else figure(8); end;
huffman_plottree( code );
suptitle( [Gruppe, ', ',Versuch, ', Codebaum für B=',int2str(B)] )


% Einzelne Wortlängen im Baum (tricky!):
l = cellfun( @length , code );

% Mittlere Codewortlänge gemäss Huffman-Baum (in bit pro Hypersymbol):
ml_tree_hyp = pvec_hyp*l

% MITTLERE CODEWORTLÄNGE gemäss Huffman-Baum (in bit pro BINAEREM Quellensymbol,
% also normiert):
ml_tree = ml_tree_hyp / B


% Hamminggewichte (= Anzahl Einsen) der einzelnen Codeworte.
% Welche Funktion wird hierzu benötigt?
w_code = cellfun( @sum , code );

% Auftritts-WAHRSCHEINLICHKEITEN der CODEsymbole 0 und 1 ("Was erwarten Sie?")
% Fur B=2 kann dies auch einmal anhand des Baumes von Hand ermittelt werden.
p1 = pvec_hyp * w_code / ml_tree_hyp
p0 = 1 - p1;
p_code = [p0 p1]


%% Huffman-Codierung von Beispiel-Sequenz ---------------------------------

for nr=1:10                     % "Wiederholen Sie den Versuch mehrfach..."

    % Binäre Info-Sequenz der Länge qx erzeugen:
    info = dms(pvec, q);

    % Blocking, Bildung von Quellenwoertern --> Sequenz von Hypersymbolen:
    info_hyp = binblock(info, B);

    
    % Huffman Encoding (der geblockten Sequenz):
    coded_sequence = huffman_encoder(info_hyp, code) ;

    % Laenge der binären Codesequenz:
    q_cod = length(coded_sequence);

    
    % tatsächliche mittlere Codewortlaenge (in bit pro Hypersymbol):
    ml_hyp = q_cod / q_hyp;

    % tatsächliche mittlere Codewortlaenge (in bit pro BINÄREM Quellensymbol):
    ml = q_cod / q;

    
    % Relative Häufigkeiten der CODEsymbole:
    h_code = hist( coded_sequence , 0:L-1 ) / q_cod;

    % Nur für eine kompaktere Ausgabe:
    text=sprintf('q_cod = %f,  ml_hyp = %f,  ml = %f,  h_code = [%f, %f]', ...
                  q_cod,       ml_hyp,       ml,       h_code );
    disp(text);
end

