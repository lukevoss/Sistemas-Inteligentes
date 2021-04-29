function population=swap(tmpPopulation,Pmut,M) 
   N=size(tmpPopulation,1);
   population=zeros(size(tmpPopulation));
   
   for i=1:N
    population(i,:)=tmpPopulation(i,:);
    if rand(1)<=Pmut
        oldSatelite=randperm(N,1);
        newSatelite=randperm(M,1);
        population(i,oldSatelite)=newSatelite; 
    end
   end
end