
% Die Regression selbst welche wir berechnen möchten soll nicht interpolieren
% wir zeichnen aber als vergleich ein Interpolationspolynom ein

% x - die vorhandenen x werte
% y - die vorhandenen y werte
% xPlot - die x werte an denen wir das Interpolationspolynom auswerten

% RE : koeffizientenInterp - Koeffizienten des Interpolationspolynoms
% RE : yInterpPlot - interpolationswerte an den Stellen xPlot
function [koeffizientenInterp, yInterpPlot] = calculate_interpolation(x, y, xPlot)

    % wie davor : wir wandeln alle vectors spaltenvektoren 
    x = x(:);
    y = y(:);
    xPlot = xPlot(:);

    % n ist die number of Data Points
    % Bei n Punkten hat das Interpolationspolynom den Grad n-1
    n = length(x);

    % Interpolationsmatrix erzeugen
    %  n X n weil wir bei n Datenpunkten auch n coeffizients brauchen

    % x^(n-1)
    % x^(n-2)
    % ...
    % x 
    % 1

    % unterschied zur Regression : hier soll das Polynom durch
    % genau alle Punkte gehen.
    A = zeros(n, n);

    % wir füllen die Matrix A 
    % Beispiel : 
    % für n = 4 :
    %      k=3    k=2  k=1  k=0
    % A = [x.^3   x.^2   x   1]
    for k = 0:n-1
        A(:, n-k) = x.^k;
    end

    % A von oben ist die korrespondierende Matrix zu :
    %p(x) = a*x^3 + b*x^2 + c*x + d

    % Koeffizienten des Interpolationspolynoms
    koeffizientenInterp = A \ y;

    % Das löst das lineare Gleichungssystem 
    % A * koeffizientenInterp = y


    % - - - - - - - - -  - - - - - - - - - -  -
    % wir kennen die Werte des Polynoms an den Datenpunkten x
    % wir möchten aber auch die Werte an den Stellen xPlot wissen 
    % somit können wir eine schöne Kurve einzeichnen 

    % Polynom an den Plot-Stellen auswerten

    % wir erstellen eine Matrix mit jeweils einer ZEile für jeden Wert aus xPlot
    % und einer Spalte für jeden Koeffizienten des Interpolationspolynoms

    % wenn das Polynom grad n-1 hat, dann hat es n Koeffizienten
    B = zeros(length(xPlot), n);

    % ähnlicher aufbau wie bei A, aber jetzt für xPlot

    % Beispiel : 
    % B = [xPlot.^3   xPlot.^2   xPlot   1]

    % ist die passende Matrix für das Polynom : 
    % p(x) = a*x^3 + b*x^2 + c*x + d
    for k = 0:n-1
        B(:, n-k) = xPlot.^k;
    end

    % grundsätzlich : 
    % A - wird benutzt um coefficients zu bestimmen
    % B - wird benutzt um das fertige Polynom an neuen Plot stellen auszuwerten

    yInterpPlot = B * koeffizientenInterp;
end
