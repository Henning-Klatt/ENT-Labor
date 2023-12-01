function [ H ] = e2( p )

    %H = entropy([p 1-p]);
    
    % Index aller Wahrscheinlickeitswerte ungleich Null oder Eins:
    n01 = find(p<1 & p>0);

    % Initialisierung, da wir Ergebnisse für alle Werte von p brauchen:
    H = zeros( size(p) );

    % Berechnung (für alle Wahrsch. ungleich Null oder Eins)):
    H(n01) = -p(n01).*log2(p(n01))-(1-p(n01)).*log2(1-p(n01));

end
