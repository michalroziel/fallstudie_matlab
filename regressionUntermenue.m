
function [gradHistory, yFitHistory] = regressionUntermenue(x, y, gradHistory, yFitHistory)


    maxGrad = length(x) - 2;

    % while loop zur programm ausführung
    while true

        fprintf('\n XXX Regressionsmenue XXX \n\n');

        % print aktuelle Daten 
        fprintf(' \n Daten aktuell : \n');
        fprintf(' \n x = \n');
        disp(x);
        fprintf(' \n y = \n');
        disp(y);

        % print menu mit optionen
        fprintf(' \n Maximal erlaubter Grad: %d \n', maxGrad);
        fprintf(' \n A - Grad manuell waehlen \n');
        fprintf(' \n B - Optimalen Grad automatisch bestimmen \n');
        fprintf(' \n C - Bisherige Regressionen vergleichen \n');
        fprintf(' \n D - Zurueck zum Hauptmenue \n');

        % variable wahl bekommt die eingabe des users
        wahl = input('Bitte waehlen Sie eine Option: ', 's');

        % upper wie String.toUpperCase()
        % strtrim entfernt Leerzeichen vor und nach der Eingabe
        wahl = upper(strtrim(wahl));

        % Fall untershceidung über die eingabe des users
        switch wahl

            % Fall 1  : User gibt den Grad manuell an
            case 'A'
                grad = input('Bitte geben Sie den Grad ein: ');

                % Grad muss eine nichtnegative ganze Zahl sein
                % isempty und isscalar verhindern Fehler bei leerer oder mehrfacher Eingabe
                if grad < 0 || floor(grad) ~= grad


                    fprintf(' \n Der Grad muss eine nichtnegative ganze Zahl sein. \n ');

                % grad darf maximal length(x) - 2 sein, da wir sonst interpolation haben
                elseif grad > maxGrad

                    fprintf(' \n Der Grad darf maximal %d sein. \n ', maxGrad);

                else
                    % falls alles okay könen wir mit der Berechnung beginnen
                    [koeffizienten, yFit, fehlerQuadratisch] = calculate_regression(x, y, grad);

                    zeigeRegressionErgebnis(grad, koeffizienten, yFit, fehlerQuadratisch);

                    plotRegression(x, y, yFit);

                    gradHistory(end + 1) = grad;
                    if isempty(yFitHistory)
                        yFitHistory = yFit(:);
                    else
                        yFitHistory(:, end + 1) = yFit(:);
                    end
                end

            case 'B'

                [grad, koeffizienten, yFit, fehlerQuadratisch] = optimalenGradFinden(x, y);

                fprintf(' \n Automatisch gewaehlter Grad: %d \n', grad);

                zeigeRegressionErgebnis(grad, koeffizienten, yFit, fehlerQuadratisch);

                plotRegression(x, y, yFit);

                gradHistory(end + 1) = grad;
                if isempty(yFitHistory)
                    yFitHistory = yFit(:);
                else
                    yFitHistory(:, end + 1) = yFit(:);
                end

            case 'C'
                if isempty(gradHistory)
                    fprintf(' \n Es wurden noch keine Regressionen gespeichert. \n ');
                else
                    plotVergleichRegressionen(x, y, gradHistory, yFitHistory);
                end

            case 'D'
                break;

            otherwise
                fprintf(' \n Bitte A, B, C oder D waehlen. \n ');
        end
    end
end


% helper function um besten grad zu finden
% bester grad ist da wo der fehler am kleinsten ist
% fehler ist quadriertm damit nicht cancel out  
function [besterGrad, besteKoeffizienten, bestesYFit, besterFehler] = optimalenGradFinden(x, y)

    % wir definierenden maximalen grad
    maxGrad = length(x) - 2;
    besterGrad = 0;
    besterFehler = inf;
    besteKoeffizienten = [];
    bestesYFit = [];

    % wir iterieren von0 bis maximalen Grad 
    % für jeden Grad berechnen wir die Regression und den Fehler
    % falls fehler kleiner als der aktuelle error -> update variables
    for grad = 0:maxGrad
        [koeffizienten, yFit, fehlerQuadratisch] = calculate_regression(x, y, grad);

        if fehlerQuadratisch < besterFehler
            besterGrad = grad;
            besterFehler = fehlerQuadratisch;
            besteKoeffizienten = koeffizienten;
            bestesYFit = yFit;
        end
    end
end
 

    % Funktion zur Anzeige der Regressionsergebnisse
function zeigeRegressionErgebnis(grad, koeffizienten, yFit, fehlerQuadratisch)

    fprintf(' \n Hallo! \n die Regression wurde berechnet. \n ');
    fprintf(' Grad: %d\n', grad);
    fprintf(' %s\n', polynomAlsText(koeffizienten));
    disp(' Koeffizienten = ');
    disp(koeffizienten);
    disp(' yFit = ');
    disp(yFit);
    fprintf(' Quadratischer Fehler: %.6f\n ', fehlerQuadratisch);
end
