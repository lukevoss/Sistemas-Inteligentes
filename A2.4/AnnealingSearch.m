function [Current, T_plot] = AnnealingSearch(T,T_min,N)
%Anealing Search for N-Queens Problem
Current = randperm(N);
dispTablero(Current) % for showing the improvement
fprintf('Number of conflicts: %d\n',fEval(Current)) % for showing the improvement
noImprovement = 0;
T_plot = T;
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
    T_plot = [T_plot, T];
end
end

