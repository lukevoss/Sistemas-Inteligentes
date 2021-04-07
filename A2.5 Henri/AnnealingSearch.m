function [Current, iter] = AnnealingSearch(T,T_min,Inicial)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Current = Inicial;
N=length(Inicial);
noImprovement = 0;
iter = 0;
while (T>T_min && noImprovement < 20 && fEval(Current)~=0)
    New = randSuccessor(Current, N, 1);
    deltaE = fEval(New)  - fEval(Current);
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
end
end

