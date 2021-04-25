function [bestCost, iter] = AnnealingSearch(satelites,installCosts,representatives, Cmax, M)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
T=1000;
T_min=0.1;
noImprovement = 0;
iter = 0;
Current=representatives;
while (T>T_min && noImprovement < 20)
    New = AnnealingSuccessor(Current, satelites, installCosts, Cmax, M);
    deltaE = fEval(satelites, New)  - fEval(satelites, Current);
    if deltaE<0
        Current=New;
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
    fEval(satelites, Current)
end
bestCost=fEval(satelites, Current);
end

