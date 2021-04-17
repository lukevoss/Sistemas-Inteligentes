function [newPopulation] =PMXcrossover(couples,Population)
[rows,~] = size(Population);
newPopulation = zeros(size(Population));

i = 2;
while i <= rows
   parent1 = Population(couples((i/2),1),:);
   parent2 = Population(couples((i/2),2),:);
   [kid1,kid2] = fun(parent1,parent2);
   newPopulation(i-1,:) = kid1;
   newPopulation(i,:) = kid2;
   i=i+2;
end
end


function [hijo1,hijo2] = fun(p1,p2)
N = length(p1);
puntoCorte = (N - mod(N,3))/3;%cast(N/3,'uint8');

hijo1 = zeros(1,N);
hijo1(puntoCorte+1:2*puntoCorte) = p2(puntoCorte+1:2*puntoCorte);
hijo2 = zeros(1,N);
hijo2(puntoCorte+1:2*puntoCorte) = p1(puntoCorte+1:2*puntoCorte);

IndHijo1 = find(hijo1 ==0);
IndHijo2 = find(hijo2 ==0);

while ~isempty(IndHijo1) && ~isempty(IndHijo2)
    i1 = IndHijo1(1);   IndHijo1(1) = [];
    i2 = IndHijo2(1);   IndHijo2(1) = [];
    
    %Habra que ver ahora si los indices estan en las poblaciones o no
    if (isempty(find(p1(i1) ==hijo1)))     %Si no esta en el hijo, lo pongo
        hijo1(i1) = p1(i1);
    else %Habra que hacer intercambio
        hijo1(i1) = Intercambio(hijo1,i1,p1);
    end
        
    if(isempty(find(p2(i2) ==hijo2)))
        hijo2(i2) = p2(i2);
    else
        hijo2(i2) = Intercambio(hijo2,i2,p2);
    end
end

end