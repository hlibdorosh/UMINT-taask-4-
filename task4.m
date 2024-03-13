Space = [];
for i = 1:5
    Space = [Space, [0; 10000000]];
end
gens = 1000;
popsize = 50;
pop = genrpop(popsize, Space);

x = [];
y = [];
   
hold on;
    
for i = 1:gens
    Fit = pokuta_Umierna_Miere_Porusenia(pop, popsize);
    Fit = mrtva_Pokuta(pop, popsize);
    Fit = Stupnova_Pokuta(pop, popsize);
    minvalue = -min(Fit);
    x = [x, i];
    y = [y, minvalue];
     
     best = selbest(pop, Fit, [2 1 1]);

    work = seltourn(pop, Fit, popsize - 4);
    work = mutx(work, 0.25, Space);
    work = muta(work, 0.25, [200000*ones(1,5)], Space);
    work = crossov(work, 1, 0);

        
    pop = [best; work];
end
disp(minvalue);
disp(selbest(pop, Fit, 1));
plot(x, y);
xlabel('Generations');
ylabel('Profit');
title(['Minimum Value: ', num2str(minvalue)]);
hold off;
