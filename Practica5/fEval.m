function [conflicts] = fEval(x)
%calculates the number of conflicts among all the queens
%in the board x
N = length(x);
conflicts = 0;
for i = 1:N
    for j = i+1:N
        if abs(i-j) == abs(x(i)-x(j))
            conflicts = conflicts +1;
        end
    end
end
end

