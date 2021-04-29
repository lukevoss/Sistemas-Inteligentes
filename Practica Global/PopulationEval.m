function fitpob = PopulationEval(population, stations)
%population: osobniki populacji
%stations: wszystkie stacje

S=size(population,1);
fitpob = zeros(S,1);
for n=1:S    
    fitpob(n) = fEval(stations, population(n,:));   
end
end