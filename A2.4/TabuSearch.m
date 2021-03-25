function [best] = TabuSearch(A, initial_state, Tenure, Max_Itarations)
%Tabu Search Algorithm 
N = length(initial_state);
current = initial_state;
best = current;
bestCost = cost(A, current, 1);
i = 1;
Tabu = zeros(Tenure,N);
while (i <= Max_Itarations)
    positionTabu = 1+mod(i, Tenure);
    Tabu(positionTabu, :) = current;
    listSuccessors = Successor(A, current);
    foundNewCurrent = false;
    while ~isempty(listSuccessors) && ~foundNewCurrent
        newCurrent = listSuccessors(1,:);
        currentBefore = current; %for Printing
        bestBefore = best; %for Printing
        costNew = cost(A, newCurrent, 1);
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
        %%%%%%%%%%%% Print functions:%%%%%%%%%%%%%%%%%%%%%%%%%
        disp('-----------------------------------------------')
        fprintf('Iteration: %d\n',i)
        disp('Best until now:')
        disp(bestBefore)
        fprintf('Best Cost: %d\n\n', cost(A, bestBefore,1))
        disp('Current')
        disp(currentBefore)
        fprintf('Current cost: %d\n\n', cost(A, currentBefore, 1))
        disp('Successor Selected')
        disp(newCurrent)
        fprintf('Cost: %d\n\n', costNew)
        disp('Accepted: ')
        disp(foundNewCurrent)
        disp('-----------------------------------------------')
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
    
    i = i+1;
end
end
  

