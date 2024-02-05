% SIMULATION DER BITFEHLERRATE                 
%
% D-5.3  Simulation mit Wiederholungscodes  
% D-5.6  Simulation mit SPC-Codes           
% D-5.7  Simulation mit RM-Codes            
%
% SKRIPT-Vorlage für die auszuführenden Simulationen
%
% Sie können dieses Skript für alle drei Versuche verwenden und Schritt
% für Schritt ergänzen, sollten aber nicht vergessen jeweils die Variable
% "Versuch" korrekt zu definieren!
%
% (C) NT / Uni Ulm

%--------------------------------------------------------------------------
% ERGÄNZEN SIE DIESES SKRIPT AN ALLEN STELLEN, AN DENEN SIE DIE VARIABLE
% "HIER_ERGAENZEN" FINDEN, D.H. ERSETZEN SIE DIESE JEWEILS GEEIGNET!
%--------------------------------------------------------------------------

clear;
clc;

HIER_ERGAENZEN = 0;                % Hilfsvariable. BITTE HIER SO BELASSEN!
GRUPPENNAME = getenv('USERNAME');

Versuch     = 5.3                       % BITTE ANPASSEN: 5.3, 5.6 bzw. 5.7

%% Codeparameter

switch Versuch  
            
    case 5.3  % Wiederholungscodes

        N = 3;
        %N = 5;
        %N = 11;
        %N = 31;

        K = 1;
            
        % Berechnung der restlichen Codeparameter abhängig von N:
        dmin = N;
            
    case 5.6  % SPC-Codes
            
        N = 3;
        %N = 5;
        %N = 11;
        %N = 31;
            
        % Berechnung der restlichen Codeparameter abhängig von N:
        K = HIER_ERGAENZEN;
        dmin = HIER_ERGAENZEN;         

    case 5.7  % RM-Codes

        rho_m = [ 0 1 ];
        %rho_m = [ HIER_ERGAENZEN HIER_ERGAENZEN ];
        %rho_m = [ HIER_ERGAENZEN HIER_ERGAENZEN ];
        %...
        
        rho = rho_m(1);
        m   = rho_m(2);

        % Berechnung der restlichen Codeparameter abh. von rho und m:
        N = HIER_ERGAENZEN;
        K = 0; for i=0:rho, K=K+nchoosek(m,i); end;
        dmin = HIER_ERGAENZEN;   
        
    end     

%% Simulationsparameter
EbN0_dB = 0:1:10;

loop    = 200;      % NUR zum ersten (schnellen) Testen
%loop    = 20000;   % für die eigentlichen Simulationen!

% Coderate und asymptotischer Gewinn
R    = K/N;
Ginf = 10*log10( R*dmin );

% Initialisierung Fehlerzaehler
BER_hard = zeros(1,length(EbN0_dB));
BER_soft = zeros(1,length(EbN0_dB));

%% Schleife Codewort

for l = 1:loop,

    % K zufaellige Informationsbits
    i = (rand(1, 1) > 0.5); %rand(1,1) = 1x1 Matrix

    % Encodierung
    switch Versuch  
        
        case 5.3  % Encodierung Wiederholungscode
            c = i * ones(1,N);
            
        case 5.6  % Encodierung SPC-Code
            c = [ i mod(sum(i), 2) ];
    
        case 5.7  % Encodierung RM-Code
            c = HIER_ERGAENZEN;             
    end     
  
    % Mapping (BPSK)
    x = (-1).^c;

    % Gauss'sches Rauschen
    n = randn(1,N);

    %% Schleife Eb/N0
    
    for s = 1:length(EbN0_dB),

        % AWGN-Kanal:
        sigma_n = sqrt( 10^(-EbN0_dB(s)/10)/R/2 );

        % verrauschte Empfangswerte
        y = x + sigma_n*n;

        % Decodierung
        switch Versuch  

            case 5.3
                % Entscheidungen (für hard decision)
                r = (y < 0 );
            
                % Decodierung - HARD (Wdh-Code)
                c_est_hard = dec_wdh_hard( r );  
                i_est_hard = c_est_hard( 1 ); % erstes Element von c_est_hard ausgeben
            
                % Fehler zählen
                BER_hard(s) = BER_hard(s) + sum( abs( i_est_hard - i ) ); 

                % Decodierung - SOFT (Wdh-Code)
                c_est_soft = dec_wdh_soft(y);   
                i_est_soft = c_est_soft(1);
           
            case 5.6
                % Decodierung - SOFT (SPC-Code)
                c_est_soft = HIER_ERGAENZEN;   
                i_est_soft = HIER_ERGAENZEN;
        
            case 5.7
                % Decodierung - SOFT (RM-Code)
                c_est_soft = HIER_ERGAENZEN;   
                i_est_soft = HIER_ERGAENZEN;
        end   
   
        % Fehler zaehlen
        BER_soft(s) = BER_soft(s) + sum( abs( i_est_soft -i ) ); % Script Seite 143

    end;    % for s 

end;        % for l

%% Normierung
%  Berechnung der Bitfehlerrate (aus der absoluten Fehlerzahl)

BER_hard = BER_hard / (K*loop);
BER_soft = BER_soft / (K*loop);

%% Theorie
%  Berechnung der theoretischen Bitfehlerwahscheinlichkeiten

EbN0 = 10 .^ ( EbN0_dB / 10 );

% BER uncodierte Übertragung
BER_theo_uncod = 1/2 * erfc((sqrt(EbN0)));

% Die Definition einer Hilfsvariable könnte u.U. hilfreich sein:
% EbN0_shifted = EbN0 + Ginf;

% BER codierte Übertragung (asymptotischer Verlauf)
BER_theo_cod   = 0.5 * erfc((sqrt(EbN0 + Ginf)));
%% Plot

switch Versuch  
    
    case 5.3  % Wiederholungscode
        figure_nr = Versuch*1000 + N;
        TitleStr = sprintf('GRUPPE %s: Wdh.-Code K=%i, N=%i, dmin=%i, R=%0.3f, Ginf=%0.3f', ...
                            GRUPPENNAME, K,N,dmin, R,Ginf);       
    case 5.6  % SPC-Code
        figure_nr = Versuch*1000 + N;
        TitleStr = sprintf('GRUPPE %s: SPC Code K=%i, N=%i, dmin=%i, R=%0.3f, Ginf=%0.3f', ...
                            GRUPPENNAME, K,N,dmin, R,Ginf);                      
    case 5.7  % RM-Code
        figure_nr = Versuch*1000 + 10*rho + m;
        TitleStr = sprintf('GRUPPE %s: RM Code (rho=%i, m=%i), K=%i, N=%i, dmin=%i, R=%0.3f, Ginf=%0.3f', ...
                            GRUPPENNAME, rho,m, K,N,dmin, R,Ginf); 
end

figure(figure_nr)
semilogy( EbN0_dB, BER_theo_uncod, 'k*', ...
          EbN0_dB, BER_theo_cod,   'b--', ...
          EbN0_dB, BER_soft,       'r-' );
legend('theo uncod','theo cod','sim soft');     

% Hard decision nur für Wiederholungscodes
if Versuch == 5.3
    hold on;
    semilogy( EbN0_dB, BER_hard,       'r-');      
    legend('theo uncod','theo cod','sim soft','sim hard'); 
    hold off;
end  

grid on;
axis([min(EbN0_dB) max(EbN0_dB) 1e-5 1]);
xlabel('10 log_{10}(E_b/N_0) [dB] -->');
ylabel('BER -->');     
title(TitleStr);
