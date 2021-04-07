function [bestCost, i] = TabuSearch(initial_state, Tenure, Max_Itarations)
%Tabu Search Algorithm 
N = length(initial_state);
current = initial_state;
best = current;
bestCost = fEval(current);
i = 1;
Tabu = zeros(Tenure,N);
while (i <= Max_Itarations)
    positionTabu = 1+mod(i, Tenure);
    Tabu(positionTabu, :) = current;
    listSuccessors = Successor(current);
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
end
  

