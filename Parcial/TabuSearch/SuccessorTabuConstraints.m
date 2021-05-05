function [list] = SuccessorTabuConstraints(current, stations, sCost, listSize, Cmax)
%%Function that creates all the Successors from a actual state
N = length(current);
list = zeros(listSize,N);
listCosts = zeros(listSize,1);
i = 1;
while i <= listSize
    newElement = current;
    indexes = (1:length(stations));
    freeStations = setdiff(indexes,newElement);
    newValues = randperm(length(freeStations));
    pointer = 1;
    for j = 1:N
        % Ten percent chance to change representative
        if (rand()<0.05)
            newElement(j) = freeStations(newValues(pointer));
            pointer = pointer +1;
        end           
    end
    %check if new Element completes Contraints of CMax
    if(fInstallCost(sCost,newElement)<=Cmax) 
        %insert new Element 
        list(i,1:length(newElement)) = newElement;
        listCosts(i) = fEval(stations, newElement);
        i = i +1;
    end
end
%sort Successors so that Successor with minimal cost is first
[~,I]=sort(listCosts);
list = list(I,:);
end

