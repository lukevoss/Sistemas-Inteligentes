function [padres] = Torneo(Pobfit,k)
N = length(Pobfit);
for i=1:N
    tmp = randperm(N);
    tmp = tmp(1:k);
    [val,ind] = min(Pobfit(tmp));
    padres(i) = tmp(ind);
end
padres = padres';
end