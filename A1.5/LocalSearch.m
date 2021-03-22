function [solution,cost] = LocalSearch(N)
%% N= number of Queens
%% Solution= final assignment and C=Overall Cost
%% 1. Initializations
x = randperm(N);
best = x;
best_cost = fEval(x);
improvement = true;
currentVar = 0;
%% 2. Search loop
while (improvement)
    
    currentVar=mod(currentVar,N)+1; %% Next variable, in each iteration a different variable
    [S,S_cost]=BestSuccessor(x, currentVar); %% Best Successor
    if (S_cost<best_cost)
        best = S;
        best_cost = S_cost;
    else
        improvement = false;
    end
end
solution = best;
cost = best_cost;
if (best_cost ~= 0)
    ME = MException('LocalSearch:LocalMinumum', ...
        'Search reached Local Minimum and cant reach a valid solution');
    throw(ME);
end
end
