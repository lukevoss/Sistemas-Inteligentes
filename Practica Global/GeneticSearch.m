function [instalationCost, bestCost, iteration, solution]=GeneticSearch(N,M,stations,sCost,CMax)
    %GENETIC SEARCH ALGORITHM FOR SATELITES PROBLEM
    %instalationCost= final cost of instalation 
    %bestCost= value of this representatives
    %iteration= number of iterations
    %solution= best solution in this run
    
    %N=number of satelites 
    %M= number of representatives
    %stations= vector with positions of the satelites
    %sCost= vector with costs for every satelite
    %CMax= maximum cost that we can pay for representants
    
    MAX_itera=1000;
    Pcross=0.95;
    Pmut=0.15;
    crucePart=0.5;
    PopulationSize = 100;
    iteration=0;
    iterabest=0;
    
        
    Population=populationGenerator(N, M, PopulationSize); %Population generation             
    PobFit=populationEval(Population,stations); %Evaluation of every individual  
    [value,index]=min(PobFit);
    bestCost=value;
    solution=Population(index,:);
    instalationCost=fInstallCost(sCost,solution);       
   
    while (iteration<MAX_itera  && iterabest<20 && size(PobFit,1)>=3)        
        Padres=tournament(PobFit)'; 
        parejas=emparejar(Padres,Pcross);
        tmpPopulation=cruceSimple(parejas,Population,crucePart);         
        newPopulation=swap(tmpPopulation,Pmut,M);              
        
        newPopulation=checkSatelitesPopulation(newPopulation,M,stations);         
        newFit=populationEval(newPopulation,stations);           
                
        if(min(newFit)<bestCost)
            [value,index]=min(newFit);
            bestCost=value;
            solution=newPopulation(index,:);
            instalationCost=fInstallCost(sCost,solution);
            iterabest=0;           
        else
            iterabest=iterabest+1;
        end
        
        Population=newPopulation;
        PobFit=newFit;        
        iteration=iteration+1;
        
    end    
    
    while instalationCost>CMax
        solution=solution(1,size(solution,2)-1);
        bestCost=populationEval(solution,stations);   
        instalationCost=fInstallCost(sCost,solution);
    end
end