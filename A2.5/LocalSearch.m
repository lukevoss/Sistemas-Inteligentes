function [solutionFound,iterations] = LocalSearch(N,start)
%% N= number of Queens
%% Solution= final assignment and C=Overall Cost
%% 1. Initializations
x = start;
best = x;
best_cost = fEval(x);
improvement = true;
currentVar = 0;
iterations = 0;
%% 2. Search loop
while (improvement)
    iterations = iterations + 1;
    currentVar=mod(currentVar,N)+1; %% Next variable, in each iteration a different variable
    [S,S_cost]=BestSuccessor(x, currentVar); %% Best Successor
    if (S_cost<best_cost)
        best = S;
        best_cost = S_cost;
    else
        improvement = false;
    end
end
if (best_cost == 0)
    solutionFound = true;
else
    solutionFound = false;
end
