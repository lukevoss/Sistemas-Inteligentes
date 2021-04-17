function [padres] = Roulette(Pobfit)
total = sum(Pobfit);
N = length(Pobfit);
Valrel = Pobfit/total;
sumRel(1) = Valrel(1);
i=2;
while i<=N
   sumRel(i) = sumRel(i-1) + Valrel(i); 
   i = i+1;
end
i = 1;
while i <=N
  val= rand(); 
  ind = find(sumRel >= val);
  ind = ind(1);
  padres(i) = ind;
  i = i+1;
end

padres = padres';
end