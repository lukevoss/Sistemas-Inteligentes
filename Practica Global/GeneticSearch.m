function PobFit=GeneticSearch(PobSize,N,M,K,stations)
    %stations:(2, N), N=możliwe satelity (300)/ stations:(N,2)
    %Pob = /satelites
   
    %INDICES DE LOS REPRESENTANTES EN CADA ELEMENTO
    Pob = GenPob(N, PobSize, M);
    %CADA ELEMENTO TIENE 0 O 1 DEPENDIENDO DE SI ES REPRESENTANTE O NO,
    %ESTO NOS FACILITA EL USO DE LOS OPERADORES
    PobBin=zeros(PobSize,N);
    n=1;
    while n<=PobSize
        PobBin(n,Pob(n,:))=1; 
        n=n+1;
    end
    for i=1:PobSize
       prueba(i,:)=find(PobBin(i,:)==1); 
    end
   
%     %GUARDA CUAL ES EL ÍNDICE DEL REPRESENTANTE DE CADA SATÉLITE, 0 EN EL
%     %CASO DE SER EL MISMO
%     n = 1;
%     represented = zeros(PobSize, N);
%     while n <= PobSize
%         represented(n,:) = representedGroups(stations, Pob(n,:), N);
%         n = n+1;
%     end
    
    MAX_itera=1000;
    Pcross=0.9;
    Pmut=0.1;
    
    PobFit=EvalPob(Pob,stations);
    disp("INICIAL");
    disp(PobFit);
    
    itera=0;
    iterabest=0;
    bestPob=min(PobFit);
   
    while ((itera<MAX_itera)  && (iterabest<20))
        Padres=torneo(PobFit)'; %%devuelve los indices de los padres que se cruzaran
        parejas=Emparejar(Padres,Pcross);
        tmpPobBin=cruceSimple(parejas,PobBin,K); %%devuelve una nueva poblacion cruzada
        newPobBin=swap(tmpPobBin,Pmut); %%poblacion con mutaciones
        
        tamNewPob=size(newPobBin,1);
        newPobBin=controlaSatelites(newPobBin,M);
        newPob=zeros(tamNewPob,M);
        for i=1:size(newPobBin,1)
         newPob(i,:)=find(newPobBin(i,:)==1); 
        end
      
        newFit=EvalPob(newPob,stations);
        
        [Pob,PobBin,PobFit]=Re_Elitista(Pob,PobBin,newPob,newPobBin,PobFit,newFit);
        if(min(PobFit)<bestPob)
            bestPob=min(PobFit);
            iterabest=0;
        else
            iterabest=iterabest+1;
        end
        itera=itera+1;


    end
    
end