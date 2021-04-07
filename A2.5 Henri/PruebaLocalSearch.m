function [t,iter,exitos] = PruebaLocalSearch(Inicial)

t = 0;
exitos = 0;
iterTotales = 0;
iteraciones = size(Inicial,1);
for i= 1:iteraciones
actual = Inicial(i,:); 
tic;
[cost,iter] = LocalSearch(actual);
t=t+toc;
iterTotales = iterTotales+iter;
if cost ==0
    exitos = exitos+1;
end
end
iter = iterTotales/iteraciones;
t = t/iteraciones;

end