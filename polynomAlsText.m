
function polynom = polynomAlsText(koeffizienten)

    % wir möchten das polynom in einem readable format ausgeben
    % grad ist höchste potenz des polynoms
    grad = length(koeffizienten) - 1;
    polynom = 'p(x) = ';

    % wir iterieren über alle Koeffizienten um die Terms des Polynomials zu erstellen
    for i = 1:length(koeffizienten)

        a = koeffizienten(i);
    
        % beim ersten durchlauf potenz = grad, 
        % beim zweiten durchlauf potenz = grad - 1
        potenz = grad - (i - 1);

        if potenz == 0

            % beim grad 0 keine x variable, nur der Koeffizient
            % % ist placeholder
            % + das Vorzeichen immer angezeigen
            term = sprintf('%+.4f', a);

        elseif potenz == 1

            % beim grad 1 nur x ohne hochzahl
            term = sprintf('%+.4f*x', a);
        else

            term = sprintf('%+.4f*x^%d', a, potenz);
        end
 
        % wir appenden die terme für alle Koeffizienten zum polynom string
        polynom = [polynom term];
    end

end

