function [bestCost, i] = TabuSearch(Tenure, Max_Itarations, stations, sCost, satelites, Cmax)
%% Tabu Search Algorithm 
%Tenure = number of remembered states
%Max_Iterations = number of times Tabu executes
%stations = Random Coordinates of possible Satelite Positions
%sCost = Random selected Installation Costs for possible Positions
%satelites = Random selected Positions as Representatives
%Cmax = maximal installations costs (constraint)s

N = length(satelites);
current = satelites;
best = current;
bestCost = fEval(stations, current);
i = 1;
Tabu = zeros(Tenure,N); %create Tabu table
noImprovements= 0;
nSuccessors = 20;
while (i <= Max_Itarations && noImprovements<100)
    %insert current in Tabu table
    %if table is full: discard oldest entry and insert new state:
    positionTabu = 1+mod(i, Tenure);
    Tabu(positionTabu, :) = current;
    %find possible Successors:
    listSuccessors = SuccessorTabu(current, stations, sCost, nSuccessors, Cmax);
    acceptState = false;
    %look for a better arrangement of satelites:
    while ~isempty(listSuccessors) && ~acceptState
        newCurrent = listSuccessors(1,:);
        %Cut NewCurrent to true length by removing 0 elements
        if (newCurrent(60)==0)
            index = newCurrent == 0;
            newCurrent_cut = newCurrent;
            newCurrent_cut(index) = [];
            costNew = fEval(stations, newCurrent_cut);
        else
            costNew = fEval(stations, newCurrent);
        end
        listSuccessors(1,:) = [];
        %accept always better states:
        if costNew < bestCost
            best = newCurrent;
            current = newCurrent;
            bestCost = costNew;
            acceptState = true;
        %accept also a worse state if it's not in the Tabu List:
        elseif ~ismember(newCurrent,Tabu,'row')
            current = newCurrent;
            acceptState = true;
            noImprovements = noImprovements + 1;
        end
    end
    
    i = i+1;
end
end
  

