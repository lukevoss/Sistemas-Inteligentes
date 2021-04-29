function fitpob = populationEval(population, stations)
%population= list of individuals
%stations= list of posible satelites

S=size(population,1);
fitpob = zeros(S,1);
for n=1:S    
    fitpob(n) = fEval(stations, population(n,:));   
end
end