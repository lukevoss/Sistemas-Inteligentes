function newPopulation = cruceSimple(Parejas,Population,crucePart)
 %Parejas: list of parents
 %Population: list of individuals
 %crucePart: % of genes that we will exchange between parents
 
 N=size(Parejas,1);
 cruceIndex=round(size(Population,2)*crucePart);
 if cruceIndex==0
     cruceIndex=1;
 end
 p=1;
 newPopulation=zeros(N*2,size(Population,2)); %allocation for speed
 for i=1:N
          
     FirstParentGenes=Population(Parejas(i,1),(1:cruceIndex)); 
     SecondParentGenes=Population(Parejas(i,2),(1:cruceIndex)); 
     
     newPopulation(p,:)=Population(Parejas(i,1),:); 
     newPopulation(p,(1:cruceIndex))=SecondParentGenes;     
     p=p+1;
     newPopulation(p,:)=Population(Parejas(i,2),:);
     newPopulation(p,(1:cruceIndex))=FirstParentGenes;
     p=p+1;
 end
 
 