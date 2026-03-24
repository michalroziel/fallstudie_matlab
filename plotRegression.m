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

    figure;

    % wir teilen die figure in 2 zeilen und 1 spalte auf, damit wir in der oberen zeile die datenpunkte und das polynom plotten können
    % und in der unteren zeile die abstände zwischen den datenpunkten und den regress
    % wir wählen den oberen bereich
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
    
    grid on;
    xlabel('x');
    ylabel('y');

    title('Datenpunkte und Regressionspolynom');
    legend('Datenpunkte', 'Regression', 'Location', 'best');

    % jetzt wechseln wir zu dem unteren Bereich der figure
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
