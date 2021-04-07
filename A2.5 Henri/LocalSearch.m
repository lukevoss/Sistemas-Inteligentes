function [cost, iter] = LocalSearch(x)
N = length(x);
best = x;
best_cost = fEval(x);
improvement = true;
currentVar = 0;
iter = 0;
%% Search loop
while (improvement)
    iter = iter + 1;
    currentVar=mod(currentVar,N)+1; %% Next variable, in each iteration a different variable
    [S,S_cost]=BestSuccessor(x, currentVar); %% Best Successor
    if (S_cost<best_cost)
        best = S;
        best_cost = S_cost;
    else
        improvement = false;
    end
end
cost = best_cost;
end
