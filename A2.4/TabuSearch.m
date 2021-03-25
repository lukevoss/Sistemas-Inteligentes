function [outputArg1,outputArg2] = TabuSearch(A, initial_state, Tenure, Max_Itarations)
%Tabu Search Algorithm 
N = length(initial_state);
current = initial_state;
best = current;
bestCost = cost(A, current, 1);
i = 1;
Tabu = zeros(N,N);
while (i <= Max_Itarations)
    Tabu(i, :) = current;
    listSuccessors = Successor(A, current, 1);
    foundNewCurrent = false;
    while ~isempty(listSuccessors) && ~foundNewCurrent
        newCurrent = listSuccessors(1,:);
        costNew = cost(A, newCurrent, 1)
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
  

