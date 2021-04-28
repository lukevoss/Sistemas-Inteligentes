function [NewPob] = Swap(tmpPob,tmut)
[filas,col] = size(tmpPob);
index = find(rand(filas,1) <tmut);
tam = length(index);
NewPob = tmpPob;
while ~isempty(index)
    iRand = randperm(col);  
    ind = index(1);
    index(1) = [];    
    tmp = NewPob(ind,:);  
    %SWAP
    tmp([iRand(1) iRand(2)]) = tmp([iRand(1) iRand(2)]);
    NewPob(ind,:) = tmp;   
end
end