clc;
clear all;

%% binäre Quelle ---------------------------------------------------------

L = 2;         % Anzahl Quellensymbole

%% Bild -------------------------------------------------------------------

% Das Bild wird geladen:
pic = image_load('smiley.bmp') ;

% Die Dimensionen der Bildmatrix werden bestimmt:
[ny,nx] = size(pic);

% Darstellung des Bildes (links):
figure(9);

subplot(1,2,1);
image_plot(pic);

% Umwandlung des Bildes in einen Zeilenvektor:
picS = pic'; picS = picS(:)';

%% Binärsequenz ----------------------------------------------------------

% Binäre Info-Sequenz (dargestellt mit "Buchstaben A" und "B"):
info = picS;

% Länge der binären Sequenz:
q = length( info )

% Relative Häufigkeiten der Quellensymbole in der binären Sequenz:
h = hist( info-'A', 0:L-1 ) / q

% a) 

% Entropie, bestimmt aus Häufigkeiten der Quellensymbole:
H_h = entropy(h)


%% Blockbildung -----------------------------------------------------------

% Blocklänge:
B = 2          
%B = 4
%B = 8

% Anzahl mögliche Quellwoerter bzw. Hypersymbole:
L_hyp = L^B ;    

% Blocking der Infosequenz, Bildung von Quellenwörtern der Länge B,
% Ergebnis: Sequenz von Hypersymbolen:
info_hyp = binblock(info, B);

% Länge der geblockten Sequenz, Anzahl Hypersymbole:
q_hyp = length(info_hyp);

% b)

% Relative Häufigkeiten der einzelnen Hypersymbole:
h_hyp = hist( info_hyp-'A', 0:L_hyp-1 ) / q_hyp;

% Entropie, bestimmt aus rel. Häufigkeiten der Hypersymbole:
H_h_hyp     = entropy(h_hyp) ;

% Entropie, auf ein Quellensymbol normiert (in bit/Quellensymbol):
H_h = H_h_hyp / B

disp(SEP)
%% Huffman Encoder --------------------------------------------------------

% Konstruktion Huffman Code(baum), aus rel. Häufigkeiten des Hypersymbole:
code = huffman_construction( h_hyp );
%huffman_plottree( code );

% Huffman Encoding:
coded_sequence = huffman_encoder(info_hyp, code);

% Länge der Codesequenz = Anzahl Codebits insgesamt:
q_cod = length(coded_sequence)

% Mittlere Codewortlänge = Anzahl Codebits je Hypersymbol:
ml_hyp = q_cod / q_hyp;

% c)

% Mittlere Wortlänge normiert, also Codebits je BINÄREM Quellensymbol (Bildpunkt):
ml = q_cod / q

% Kompressionsfaktor: Anzahl Codebits / ursprüngliche Anzahl Infobits:
kompressionsfaktor = q_cod/q

%% Decodierung des (komprimierten) Bildes ---------------------------------

% d)

% Huffman-Decodierung:
info_hyp_dec = huffman_decoder( coded_sequence , code );

% Umwandeln in Binärsequenz:
info_dec = blockbin( info_hyp_dec , B );

% Umstrukturierung des Zeilenvector in eine Matrix (Bild):
pic_dec = reshape( info_dec(:)' , nx , ny )';

% Darstellung des rekonstruierten Bildes (rechts):
subplot(1,2,2);
image_plot(pic_dec);
