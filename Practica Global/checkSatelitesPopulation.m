function newPopulation=checkSatelitesPopulation(Population,M,satelites)
    N=size(Population,1);
    newPopulation=zeros(N,M);
    for i=1:N             
        populationSize = size(unique(Population(i,:)),2);
       
        if populationSize>=M           
            newPopulation(i,:)=Population(i,1:M);        
        end
        
        if populationSize<M           
            newPopulation(i,1:populationSize)=unique(Population(i,:));
            while populationSize<=M
               k=randi(size(satelites,1));
               if ~ismember(k,newPopulation)
                   newPopulation(i,populationSize)=k;
                   populationSize = populationSize + 1;
               end
            end 
        end
    end
end