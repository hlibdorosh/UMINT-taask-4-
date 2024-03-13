function [fit] = Stupnova_Pokuta(Pop, popsize)
    fit = zeros(50, 1);
    percent = [0.04, 0.07, 0.11, 0.06, 0.05];
    k = 1;
    pokuta = 100;
    for i = 1:popsize
        profit = 0;
        row = Pop(i, :);
        for j = 1:5
            profit = profit + row(j) * (percent(j) + 1);
        end
        p1 = sum(row);
        p2 = row(1) + row(2);
        p3 = -row(4) + row(5);
        p4 = -0.5 * row(1) - 0.5 * row(2) + 0.5 * row(3) + 0.5 * row(4) - 0.5 * row(5);
        

        if p1 > 10000000
            profit = profit - (p1 - 10000000);
            k = k+1;
        end
        
        
        if p2 > 2500000
            profit = profit - (p2 - 2500000);
            k = k+1;

        end
        
        if p3 > 0
            profit = profit - (p3 - 0);
            k = k+1;

        end
        
        
        if p4 > 0
            profit = profit - (p4 - 0);
            k = k+1;

        end

        profit = profit - k*pokuta;
        fit(i) = (-1) * (profit - sum(row));
    end
end
