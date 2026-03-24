function [x, y, datenGeladen] = datenPunktWeise()

    % Wenn wir unsere x und y Daten Punktweise angeben 
    % liegen uns noch keine Daten vor 
    datenGeladen = false;
   
    % Arrays für x und y 
    x = [];
    y = [];
    
    n = input('Wie viele Datenpaare sollen Eingegeben werden?');
    
    % Eingabe muss eine ganze, positive Zahl > 0 sein
    % isempty und isscalar verhindern Fehler bei leerer oder mehrfacher Eingabe
    if n <= 0 || floor(n) ~= n
        disp( ' Die Anzahl muss eine positive ganze Zahl sein. ' );
        return;
    end
    
    x = zeros(1, n);
    y = zeros(1, n);
    
    % Printe zum Visualisieren alle Datenpaare nacheinander
    for i = 1:n
        fprintf('\nDatenpaar %d:\n', i);
        x(i) = input('  x = ');
        y(i) = input('  y = ');
    end
    
    if check_Data(x, y)
        datenGeladen = true;
        disp( ' Daten wurden erfolgreich gespeichert. ' );
    else
        x = [];
        y = [];
        disp( ' Daten sind ungültig und wurden verworfen. ' );
    end
end
