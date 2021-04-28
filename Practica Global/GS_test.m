CMax = 4500;
Nveces = 1;
N = 300;
M = 60;
Max_Iterations = 1000;

for i = 1:Nveces
    %Random Coordinates of possible Satelite Positions
    stations = randi([0 500],300,2);
    
    %Random selected Installation Costs for possible Positions
    sCost = randi([10,100],300,1);
    
    %Random selected Positions as Representatives
    satelites = randperm(300)';
    satelites = satelites(1:60);
    
    displaySatelites(stations,satelites);

    %Generative Search    
    [bestCost_Generative, iterations_Generative, SolutionGenerative] = GenerativSearch(stations,sCost,satelites,Max_Iterations,M);    
    
    displaySatelites(stations, SolutionGenerative);
end