function [list] = Successor(current, stations, sCost, listSize)
%% Function that creates all the Successors from a actual state
N = length(current);

list = [];
listCosts = [];
indexes = (1:N);
for i = 1:listSize
    %create sometimes Successors with less than 60 satelites
    M = ceil(normrnd(N,1.5));
    if (M > N)
        M = N;
    end
    newElement = current;
    %delete values of current do get a correct number of satelites
    while length(newElement) ~= M
        pos = randi([1 length(newElement)],1,1);
        newElement(pos) = [];
    end
    for j = i:M
        aux = actual(i);
        
        
        list = [list ; actual];
        listCosts = [listCosts ; fEval(actual)];
    end
end
[~,I]=sort(listCosts);
list = list(I,:);
end

