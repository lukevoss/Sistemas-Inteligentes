function [NuevaPob] = Swap(tmpPob,tmut)
[filas,col] = size(tmpPob);
indices = find(rand(filas,1) <tmut);
tam = length(indices);
NuevaPob = tmpPob;
while ~isempty(indices)
    indicesAleatorios = randperm(col);  
    ind1 = indicesAleatorios(1);    
    ind2 = indicesAleatorios(2);
    ind = indices(1);
    indices(1) = [];    
    aux = NuevaPob(ind,:);  
    %SWAP
    elemento = aux(ind1);   
    aux(ind1) = aux(ind2);
    aux(ind2) = elemento;
    NuevaPob(ind,:) = aux;
end

end