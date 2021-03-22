function [Best, Best_cost] = BestSuccessor(x,queen)
%% returns best Successor for current state
%x=assignment
%queen = queen to be changed
N = length(x);
Best = x;
Best_cost = fEval(x);
for i = 1:N
    if (i~=queen)
        new= x;
        new(queen)=x(i);
        new(i)=x(queen);
        new_cost = fEval(new);
        if (new_cost < Best_cost)
            Best = new;
            Best_cost = new_cost;
        end
    end
end
end

