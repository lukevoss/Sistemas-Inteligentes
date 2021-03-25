function [list] = Successor(actual)
%% Function that creates all the Successors from a actual state
N = length(actual);
for i = 1:N
    for j = i+1:N
        actual([i j]) = actual ([j i]);%swap
        list = [list actual];
    end
end
end

