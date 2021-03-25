function [list] = Successor(A,actual)
%% Function that creates all the Successors from a actual state
N = length(actual);
for i = 1:N
    for j = i+1:N
        actual([i j]) = actual ([j i]);%swap
        list = [list ; actual];
        listCosts = [listCosts cost(A, actual ,1)];
    end
end
[~,I]=sort(listCosts);
list = sortrows(list,I);
end

