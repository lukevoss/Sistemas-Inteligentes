function [t,iterTotales,exitos] = PruebaTabu(Inicial)
seed =1;

t = 0;
exitos = 0;
iterTotales = 0;
iteraciones = size(Inicial,1);
for i= 1:iteraciones
actual = Inicial(i,:); 
tic;
[cost,iter] = TabuSearch(actual, 4, 300);
t=t+toc;
iterTotales = iterTotales+iter;
if cost ==0
    exitos = exitos+1;
end
end
iterTotales = iterTotales/iteraciones;
t = t/iteraciones;
end