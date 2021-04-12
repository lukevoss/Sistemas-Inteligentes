function [padres] = Torneo(Pobfit,k)
N = length(Pobfit);

for i=1:N
    aux = randperm(N);
    
    aux = aux(1:k); %Vector de k elementos
    
    [val,ind] = max(Pobfit(aux));
   
    padres(i) = aux(ind);
   
end
padres = padres';
end