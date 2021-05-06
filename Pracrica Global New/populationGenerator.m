function generatedPopulation = populationGenerator(N, M, populationSize)
%populationSize= number of individuals
%N= number of satelites
%M= number of representants
    
generatedPopulation = zeros(populationSize, M);
n = 1;
while n <= populationSize
    generatedPopulation(n,:) = randperm(N,M);
    n = n+1;
end
end