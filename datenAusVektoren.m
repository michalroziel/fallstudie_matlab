
function [x, y, datenGeladen] = datenAusVektoren()

    
    % Wenn wir Daten aus Vektoren Laden dann 
    % liegen uns noch keine Daten vor
    datenGeladen = false;

    % Frage den benutzer nach Vektoren
    
    nameX = input(' Name des x-Vektors: ', 's');
    nameY = input(' Name des y-Vektors: ', 's');

    % suche im base workspace nach nameX für X Vektor 
    % und nameY für Y Vektor 
    
    % zuerst pruefen wir, ob beide Namen im base workspace existieren
    % https://de.mathworks.com/help/matlab/ref/evalin.html
    try
        x = evalin('base', nameX);
        y = evalin('base', nameY);
    catch
        x = [];
        y = [];
        fprintf(' \n Einer oder beide Vektornamen wurden nicht gefunden. \n ');
        return;
    end

    % wenn beide Namen existieren, koennen wir die Vektoren laden
    x = evalin('base', nameX);
    y = evalin('base', nameY);


    % Wenn Daten gechecked 
    % variable datenGeladen auf true setzen
    if check_Data(x, y)

        datenGeladen = true;
        fprintf(' \n Vektoren wurden erfolgreich geladen. \n ');

    else
        % Falls fehlerhafte Daten vorliegen
        % Dann bleiben die Vektoren leer
        x = [];
        y = [];
        fprintf(' \n Geladene Daten sind ungültig. \n ');

    end

end

    
