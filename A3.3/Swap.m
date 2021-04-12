function [NuevaPob] = Swap(tmpPob,tmut)
[filas,col] = size(tmpPob);
indices = find(rand(filas,1) <tmut);
tam = length(indices);
NuevaPob = tmpPob;
while ~isempty(indices)
    indicesAleatorios = randperm(col);  %Cojo los dos primeros por ejemplo y los intercambio
    ind1 = indicesAleatorios(1);    
    ind2 = indicesAleatorios(2);
    ind = indices(1);   %Cromosoma a permutar
    indices(1) = [];    
    aux = NuevaPob(ind,:);    %Vector a permutar
    elemento = aux(ind1);   %Interacmbio, SWAP
    aux(ind1) = aux(ind2);
    aux(ind2) = elemento;
    NuevaPob(ind,:) = aux;
end

end