function newPopulation = cruceSimple(Parejas,Population,crucePart)
 %Parejas: lista rodziców (5x2)
 %Population: populacja (10x60)
 %crucePart: %genów w jakim wymieniamy
 N=size(Parejas,1);
 cruceIndex=round(size(Population,2)*crucePart);
 if cruceIndex==0
     cruceIndex=1;
 end
 p=1;
 newPopulation=zeros(N*2,size(Population,2)); %allocation for speed
 for i=1:N
          
     FirstParentGenes=Population(Parejas(i,1),(1:cruceIndex)); %satelity od 1 do k z 1 rodzica
     SecondParentGenes=Population(Parejas(i,2),(1:cruceIndex)); %satelity od 1 do k z 2 rodzica
     
     newPopulation(p,:)=Population(Parejas(i,1),:); % cały pierwszy rodzic
     newPopulation(p,(1:cruceIndex))=SecondParentGenes; % geny od 1 do k podmienione z 2 rodzicem     
     p=p+1;
     newPopulation(p,:)=Population(Parejas(i,2),:); %cały 2 rodzic
     newPopulation(p,(1:cruceIndex))=FirstParentGenes; %geny od 1 do k podmienione z 1 rodzicem     
     p=p+1;
 end
 
 