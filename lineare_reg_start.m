function lineare_reg_start()
    
    % die Konsole und die Variablen in dem Workspace clearen.
    clc;
    clear;
    
    x = [];
    y = [];

    % einfache Historie:
    % gradHistory speichert die bisher gewaehlten Grade
    % yFitHistory speichert zu jedem Grad die zugehoerigen Regressionswerte
    gradHistory = [];
    yFitHistory = [];

    % variablen um zu checken ob unsere data geloaded ist
    dataLoaded = false;
    
    % while(1) Schleife um das Programm nutzen zu können
    while true

        fprintf('\n XXX Lineare Regression - Main Menu XXX \n\n');
        fprintf('A - Daten punktweise eingeben \n');
        fprintf('B - Daten aus vorhandenen Vektoren laden \n');
        fprintf('C - Mit bereits geladenen Daten weiterarbeiten \n');
        fprintf('D - Programm beenden \n');
        
        wahl = input(' \nBitte waehlen Sie eine Option: ' , 's');
        wahl = upper(strtrim(wahl));
        
        % wir machen eine fall unterscheidung über die Eingabe
        switch wahl

            % Fall 1 : User gibt Daten Punktweise an
            case 'A'
                [xNeu, yNeu, datenNeuGeladen] = datenPunktWeise();

                if datenNeuGeladen
                    x = xNeu;
                    y = yNeu;
                    dataLoaded = true;

                    % bei neuen Daten setzen wir die alte Historie zurueck,
                    % weil die gespeicherten Regressionen nur zu den alten Daten passen
                    gradHistory = [];
                    yFitHistory = [];
                end
                
            % Fall 2 : User nimmt vorhandene Daten aus Vektoren
            case 'B'
                [xNeu, yNeu, datenNeuGeladen] = datenAusVektoren();

                if datenNeuGeladen
                    x = xNeu;
                    y = yNeu;
                    dataLoaded = true;

                    % auch hier: neue Daten bedeuten neue Historie
                    gradHistory = [];
                    yFitHistory = [];
                end
                
            % Fall 3 : User macht weiter mit bereits geladenen Daten
            case 'C'
                if dataLoaded

                    % Untermenue bekommt die aktuelle Historie
                    % und gibt die erweiterte Historie wieder zurueck
                    [gradHistory, yFitHistory] = regressionUntermenue(x, y, gradHistory, yFitHistory);
                else
                    % Message dass noch keine Daten geladen sind
                    fprintf(' \n Es sind noch keine Daten geladen. \n ');
                end
            
                % Fall 4 : quit programm 
            case 'D'
                fprintf(' \n Programm wird beendet. \n');
                break;
                
            otherwise
                fprintf(' \n Falsches Input. Bitte A bis D wählen. \n');
        end
    end
end
