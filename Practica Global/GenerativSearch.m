function [bestPob, itera, solution] = GenerativSearch(stations,sCost,satelites, MAX_itera, M)    
    Pcross=0.9;
    Pmut=0.1;
    itera=0;
    iterabest=0;
    
    
    PobFit = fEval(stations, satelites);
    bestPob=PobFit;
    solution=satelites;
   
    while (itera<MAX_itera  && iterabest<40)
        Padres=torneo(sCost)'; %%padres 
        parejas=Emparejar(Padres,Pcross); %parents
        tmpPobBin=cruceSimple(parejas,stations); %%cruze
        newPobBin=swap(tmpPobBin,Pmut); %%mutations
        
        newPob=controlaSatelites(newPobBin,M);   
      
        newFit=fEval(stations, newPob);
          
        if(newFit<bestPob)
            bestPob=newFit;
            solution=newPob;
            iterabest=0;
        else
            iterabest=iterabest+1;
        end
        itera=itera+1;
    end
end
