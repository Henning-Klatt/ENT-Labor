function [ H ] = entropy( p_vector )

    % Index für alle Vektorelemente (Wahrcheinlichkeiten) ungleich Null: 
    non_zero = find(p_vector);
    
    % Entropie:
    % Aufsummieren aller Anteile mit Wahrscheinlichkeiten ungleich Null:
    % (nutzen Sie Vektoroperationen, keine Schleife!)
    H = -sum(p_vector(non_zero) .* log2(p_vector(non_zero)));

end