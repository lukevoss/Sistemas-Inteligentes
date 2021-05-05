function [list] = SuccessorTabu(actual)
%% Function that creates all the Successors from a actual state
N = length(actual);
list = [];
listCosts = [];
for i = 1:N
    for j = i+1:N
        aux = actual(i);
        actual(i) = actual(j);%swap
        actual(j) = aux;
        list = [list ; actual];
        listCosts = [listCosts ; fEval(actual)];
    end
end
[~,I]=sort(listCosts);
list = list(I,:);
end

