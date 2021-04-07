function [t,iter,exitos] = PruebaAnnealing(Inicial)

t = 0;
exitos = 0;
iterTotales = 0;
iteraciones = size(Inicial,1);
for i= 1:iteraciones
tic;
[result,iter] = AnnealingSearch(1000,0.5,Inicial(i,:));
t=t+toc;
cost = fEval(result);
iterTotales = iterTotales+iter;
if cost ==0
    exitos = exitos+1;
end
end
iter = iterTotales/iteraciones;
t = t/iteraciones;

end