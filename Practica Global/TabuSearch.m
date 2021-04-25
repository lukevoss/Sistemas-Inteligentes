function [bestCost, i] = TabuSearch(Tenure, Max_Itarations, stations, sCost, satelites)
%% Tabu Search Algorithm 
%Tenure = number of remembered states
%Max_Iterations = number of times Tabu executes
%stations = Random Coordinates of possible Satelite Positions
%sCost = Random selected Installation Costs for possible Positions
%satelites = Random selected Positions as Representatives

N = length(satelites);
current = satelites;
best = current;
bestCost = fEval(current);
i = 1;
Tabu = zeros(Tenure,N);
while (i <= Max_Itarations && bestCost~=0)
    positionTabu = 1+mod(i, Tenure);
    Tabu(positionTabu, :) = current;
    listSuccessors = SuccessorTabu(current);
    foundNewCurrent = false;
    while ~isempty(listSuccessors) && ~foundNewCurrent
        newCurrent = listSuccessors(1,:);
        costNew = fEval(newCurrent);
        listSuccessors(1,:) = [];
        if costNew < bestCost
            best = newCurrent;
            current = newCurrent;
            bestCost = costNew;
            foundNewCurrent = true;
        elseif ~ismember(newCurrent,Tabu,'row')
            current = newCurrent;
            foundNewCurrent = true;
        end
    end
    
    i = i+1;
end
if (bestCost == 0)
    solutionFound = true;
else
    solutionFound = false;
end
end
  

