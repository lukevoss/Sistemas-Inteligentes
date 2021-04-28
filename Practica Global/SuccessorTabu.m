function [list] = SuccessorTabu(current, stations, sCost, listSize, Cmax)
%% Function that creates all the Successors from a actual state
N = length(current);

list = zeros(listSize,N);
listCosts = zeros(listSize);
i = 1;
while i <= listSize
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
    
    indexes = (1:length(stations));
    freeStations = setdiff(indexes,newElement);
    newValues = randperm(length(freeStations));
    pointer = 1;
    for j = 1:M
        % if it encountered a 0 (current was smaller than the newElement size)
        % change value to a random free Station
        if newElement(j)== 0
            newElement(j) = freeStations(newValues(pointer));
            pointer = pointer +1;
        else 
            % Ten percent chance to change representative
            if (rand()<0.1)
                newElement(j) = freeStations(newValues(pointer));
                pointer = pointer +1;
            end           
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
[~,I]=sort(listCosts);
list = list(I,:);
end

