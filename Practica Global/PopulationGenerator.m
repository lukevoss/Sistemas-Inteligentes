function generatedPopulation = PopulationGenerator(N, M, populationSize)
%populationSize: ilość osobników w populacji
%N: ilość satelit
%M: ilość reprezentantów
    
generatedPopulation = zeros(populationSize, M);
n = 1;
while n <= populationSize
    generatedPopulation(n,:) = randperm(N,M);
    n = n+1;
end
end