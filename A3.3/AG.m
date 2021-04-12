NQ= 6 ; %%Numero de Reinas
NB= 10; %%Numero de Tableros/Individuos de la poblacion
Max_Iter = 3000;
Pcross = 0.9;
Pmut = 0.1;
k = 4;
%Poblacion Inicial
Pob = GenPob(NQ,NB);    
Pobfit = EvalPob(Pob);
maxAtaques = sum(1:NQ-1); %*2 para el cruce
iter = 1;
count = 0;
valActual = 0;
valMejor = Pobfit(1);
while iter < Max_Iter && valMejor ~=maxAtaques && count <10  
   Padres = Torneo(Pobfit,k); %% devuelve los indices de los padres que se cruzaran
   parejas = Emparejar(Padres,Pcross);
   tmpPob = CruceSimple(parejas,Pob); %%devuelve nueva poblacion cruzada
   newPob = Swap(tmpPob,Pmut);
   newFit = EvalPob(newPob); %%poblacion con mutaciones
   [Pob,Pobfit] = Re_Elitista(Pob,newPob,Pobfit,newFit);
   valActual = Pobfit(1);
   if valActual >valMejor
       valMejor = valActual;
       count = 0;
   else
       count = count+1;
   end
   iter = iter+1;
end


