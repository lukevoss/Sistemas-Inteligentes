NQ= 6 ; %%Number Queens
NB= 10; %%Number Boards/Population Individuals
Max_Iter = 3000;
Pcross = 0.9;
Pmut = 0.1;
k = 4;
%Start Poblation
Pob = GenPob(NQ,NB);    
Pobfit = EvalPob(Pob);
maxAtaques = sum(1:NQ-1); %*2 para el cruce
iter = 1;
nNoImprovement = 0;
actual = 0;
bestCost = min(Pobfit);
while iter < Max_Iter && bestCost ~=0 && nNoImprovement <10  
   Padres = Torneo(Pobfit,k); %% devuelve los indices de los padres que se cruzaran
   parejas = Emparejar(Padres,Pcross);
   tmpPob = CruceSimple(parejas,Pob); %%devuelve nueva poblacion cruzada
   newPob = Swap(tmpPob,Pmut);
   newFit = EvalPob(newPob); %%poblacion con mutaciones
   [Pob,Pobfit] = Re_Elitista(Pob,newPob,Pobfit,newFit);
   actual = Pobfit(1);
   if actual >bestCost
       bestCost = actual;
       nNoImprovement = 0;
   else
       nNoImprovement = nNoImprovement+1;
   end
   iter = iter+1;
end


