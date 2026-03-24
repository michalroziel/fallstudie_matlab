
% wir möchten die bisherigen regressionen auch in den plot einzeichnen 
% somit können wir die verschiedenen regressionen vergleichen
function plotVergleichRegressionen(x, y, gradHistory, yFitHistory)

    % same as before : 
    % alle vektoren in spaltenvektoren umwandeln
    x = x(:);
    y = y(:);

    % wir sortieren die x werte aufsteigend
    % index merkt sich die ursprüngliche position der x werte, damit xFit in der richtignen reihenfolge 
    % grundsätzlich sortieren, damit die lines von links nach rechts verlaufen
    [xSort, index] = sort(x);

    % % lines erzeugt verschiedene Farben für jede vorhandene Regression
    farben = lines(length(gradHistory));

    figure;
    % wir plotten die DP als schwarze Kreise
    plot(x, y, 'ko', 'MarkerFaceColor', 'k');

    % Anforderung : nur einmal zeichnen
    hold on;

    % wir iterieren über alle vorhandenen Regressionen und plotten sie
    %  farben(i, :) -> i-te Zeile und alle Spalten
    for i = 1:length(gradHistory)
        plot(xSort, yFitHistory(index, i), 'LineWidth', 2.0, 'Color', farben(i, :));
    end

    % Plot beschriftung
    grid on;  
    xlabel('x');
    ylabel('y');
    title('Vergleich der bisherigen Regressionsfunktionen');

    % https://de.mathworks.com/help/matlab/ref/legend.html
    legenden = {'Datenpunkte'};

    % der erste eintrag gehört zu : plot(x, y, 'ko', )

    % wir itereieren über alle vorhandenen Regressionen um die Legende zu erstellen
    for i = 1:length(gradHistory)
        
        % für jede geplottete Regressions Kurve kommt 
        % am ende von legenden ein Eintrag hinzu
        % sprintf um anzuzeigen, aber nicht direkt in die console printen
        legenden{end + 1} = sprintf('Regression %d (Grad %d)', i, gradHistory(i));
    end


        % an ende kann legenden so aussehen : 
    %{
  %'Datenpunkte'
  %'Regression 1 (Grad 1) ' 
  %'Regression 2 (Grad 2) ' 
  %'Regression 3 (Grad 3) '
   %}

   % wir übergeben die Legende an die Funktion, damit sie im Plot angezeigt wird
   % best wählt platz mit wenigsten überlappung
    legend(legenden, 'Location', 'best');
end
