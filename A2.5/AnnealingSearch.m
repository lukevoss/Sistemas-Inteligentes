function [solutionFound, iterations] = AnnealingSearch(T,T_min,N, start)
%Anealing Search for N-Queens Problem
Current = start;
noImprovement = 0;
iterations = 0;
currentCost = fEval(Current);

while (T>T_min && noImprovement < 20 && fEval(Current)~=0)
    iterations = iterations +1;
    New = randSuccessor(Current, N, 1);
    NewCost = fEval(New);
    deltaE = NewCost  - currentCost;
    if deltaE<0
        Current=New;
        currentCost = NewCost;
        noImprovement = 0;
    else
        p=exp(-deltaE/T);
        if p>rand()
            Current=New;
            currentCost = NewCost;
            noImprovement = 0;
        end
        noImprovement = noImprovement + 1;
    end
    T = enfriar(T);
end
if (currentCost == 0)
    solutionFound = true;
else
    solutionFound = false;
end
end

