function [iterations, foundSolution] = RouletteGenerational(Population,Pobulation_fitness, Max_Iter, Pmut) 
iterations = 0;
nNoImprovement = 0;
actual = 0;
bestCost = min(Pobulation_fitness);
while iterations < Max_Iter && bestCost ~=0 && nNoImprovement <20  
   Padres = Roulette(Pobulation_fitness); %% devuelve los indices de los padres que se cruzaran
   parejas = reshape(Padres,size(Padres,1)/2,2);
   tmpPob = PMXcrossover(parejas,Population); %%devuelve nueva poblacion cruzada
   newPob = Swap(tmpPob,Pmut);
   newFit = EvalPob(newPob); %%poblacion con mutaciones
   Population = newPob;
   Pobulation_fitness = newFit;
   actual = min(Pobulation_fitness);
   if actual < bestCost
       bestCost = actual;
       nNoImprovement = 0;
   else
       nNoImprovement = nNoImprovement+1;
   end
   iterations = iterations+1;
end
if (bestCost == 0)
    foundSolution = true;
else
    foundSolution = false;
end


