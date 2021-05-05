function [bestCost, iter, Current] = AnnealingSearch(satelites,installCosts,representatives, Cmax, M)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
T=15000;
T_min=1;
noImprovement = 0;
iter = 0;
Current=representatives;
currentCost = fEval(satelites, Current);
while (T>T_min && noImprovement < 70)
    New = AnnealingSuccessor(Current, satelites, installCosts, Cmax, M);
    newCost = fEval(satelites, New);
    deltaE =   newCost - currentCost;
    if deltaE<0
        Current=New;
        currentCost = newCost;
        noImprovement = 0;
    else
        p=exp(-deltaE/T);
        if p>rand()
            Current=New;
            noImprovement = 0;
        end
        noImprovement = noImprovement + 1;
    end
    T = enfriar(T);
    iter = iter + 1;
end
bestCost = currentCost;
end

