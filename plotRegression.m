function plotRegression(x, y, yFit)

    % wieder umwandeln / checken ob die eigaben auch
    % Spalten vectors sind  
    x = x(:);
    y = y(:);
    yFit = yFit(:);

    % wir sortieren fuer den oberen Plot nach x
    % damit regression line korrekt dargestellt wird
    
    [xSort, index] = sort(x);

    % index um yFit auch si anzuordnen 
    yFitSort = yFit(index);

    % Interpolation an den vorhandenen x-Werten
    % ~ -> ignore return value 
    [~, yInterpPlot] = calculate_interpolation(x, y, x);
    yInterpSort = yInterpPlot(index);

    figure;

    % wir teilen die figure in 2 zeilen und 1 spalte auf, damit wir in der oberen zeile die datenpunkte und das polynom plotten können
    % und in der unteren zeile die abstände zwischen den datenpunkten und den regress
    % wir wählen den oberen bereich


    % Im oberen Bereich zeigen wir : 
    %  die echten Datenpunkte
    %  die Regressionskurve
    %  die Interpolationskurve
    subplot(2, 1, 1);

    % jetzt plotten 
    % b - blue
    % o - circles
    % 
    plot(x, y, 'bo', 'MarkerFaceColor', 'b');
    hold on;

    % r - red
    % - - lines
    plot(xSort, yFitSort, 'r-', 'LineWidth', 1.5);
    plot(xSort, yInterpSort, 'g--', 'LineWidth', 1.5);
    
    grid on;
    xlabel('x');
    ylabel('y');

    title('Datenpunkte, Regression und Interpolation');
    legend('Datenpunkte', 'Regression', 'Interpolation', 'Location', 'best');

    % jetzt wechseln wir zu dem unteren Bereich der figure

    % Im unteren Bereich zeigen wir :

    %  die echten Datenpunkte
    %  die Regressionswerte an denselben x
    %  die senkrechten schwarzen Linien zwischen beiden
    subplot(2, 1, 2);

    plot(x, y, 'bo', 'MarkerFaceColor', 'b');
    hold on;

    % wir plotten die regressionswerte als rote crosses
    plot(x, yFit, 'rx', 'LineWidth', 1.5);

    % wir plooten jeweils den abstand 
    % zwischen echten Data Points und den regressionswerten als schwarze Linien
    % diese liegen übereinander, deshalb x gleich 
    for i = 1:length(x)
        plot([x(i) x(i)], [y(i) yFit(i)], 'k-');
    end

    % so können wir die abstände zwischen den datenpunkten
    % und den regressionswerten visualisieren

    grid on;
    xlabel('x');
    ylabel('y');
    
    title('Abstaende zwischen Datenpunkten und Regression');
    legend('Datenpunkte', 'Regressionswerte', 'Abstaende', 'Location', 'best');
end
