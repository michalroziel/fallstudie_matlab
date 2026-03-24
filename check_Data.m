function ok = check_Data(x, y)

    % In dieser Funktion möchten wir die Korrektheit
    % der eigegebenen Daten prüfen
    
    % wir setzen am anfang die korrektheit 
    % auf true 

    ok = true;
    
    if ~isvector(x) || ~isvector(y)
        disp('Fehler: x und y müssen Vektoren sein.');
        ok = false;
        return;
    end
    
    if length(x) ~= length(y)
        disp('Fehler: x und y müssen gleich lang sein.');
        ok = false;
        return;
    end
    
    if length(x) < 2
        disp('Fehler: Es müssen mindestens 2 Datenpaare vorhanden sein.');
        ok = false;
        return;
    end
    
    if any(~isnumeric(x)) || any(~isnumeric(y))
        disp('Fehler: x und y müssen numerisch sein.');
        ok = false;
        return;
    end
    
    if length(unique(x)) < length(x)
        disp('Fehler: Die x-Werte dürfen nicht doppelt vorkommen.');
        ok = false;
        return;
    end
end