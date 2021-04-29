function population=swap(tmpPopulation,Pmut,M) 
   %tmpPopulation= newly created population
   %Pmut= probabiliti to mutate
   %M= number of representants
   
   N=size(tmpPopulation,1);
   population=zeros(size(tmpPopulation)); 
   
   for i=1:N   
    population(i,:)=tmpPopulation(i,:);
    if rand(1)<=Pmut
        oldSatelite=randperm(M,1);
        newSatelite=randperm(N,1);
        population(i,oldSatelite)=newSatelite; 
    end
   end
end