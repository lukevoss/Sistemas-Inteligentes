function [Current, T_plot, x_plot, cost_plot, successor_plot, accepted_plot] = AnnealingSearch(A,inicial,T,T_min,N)
%Anealing Search for worker-task problem
Current = inicial;
noImprovement = 0;
while (T>T_min && noImprovement < 20 && cost(A,Current,1)~=0)
    T_plot = [T_plot, T];
    New = randSuccessor(Current, N, 1);
    x_plot = [x_plot, Current];
    cost_plot = [cost_plot, cost(A,Current,1)];
    successor_plot = [successor_plot, New];
    deltaE = cost(A,New,1)  - cost(A,Current,1);
    if deltaE<0
        Current=New;
        noImprovement = 0;
        accepted_plot = [accepted_plot, 1];
    else
        p=exp(-deltaE/T);
        if p>rand()
            Current=New;
            noImprovement = 0;
            accepted_plot = [accepted_plot, 1];
        end
        noImprovement = noImprovement + 1;
        accepted_plot = [accepted_plot, 0];
    end
    T = enfriar(T);
end
end

