function [nuevaPob] = CruceSimple(parejas,Pob)
[filas,~] = size(parejas);
gen =3; %%3 por la izq
i = 1;
j = 1;
while i <= filas
  padre1 = Pob(parejas(i,1),:);   
  padre2 =Pob(parejas(i,2),:);
  nuevaPob(j,:) = [padre2(1:gen) padre1(gen+1:end)];
  nuevaPob(j+1,:) = [padre1(1:gen) padre2(gen+1:end)];
  i=i+1;
  j=j+2;
end

end