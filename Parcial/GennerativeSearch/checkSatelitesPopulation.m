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
               N=size(satelites,1);
               indexes = (1:N);
               notRepresentatives = setdiff(indexes,newPopulation(i,:));
               
               k=randi(size(notRepresentatives,2));
               
               newPopulation(i,populationSize)=notRepresentatives(k);
               populationSize = populationSize + 1;
            end 
        end
    end
end