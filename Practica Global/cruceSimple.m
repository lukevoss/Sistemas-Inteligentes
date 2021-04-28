function nPob = cruceSimple(parejas,Pob)
 N=size(parejas,1);
 p=1;
 k=2;
 for i=1:N
     
     aux=Pob(parejas(i,1),(1:k));
     nPob(p,:)=Pob(parejas(i,1),:);
     nPob(p,(1:k))=Pob(parejas(i,2),(1:k));
     p=p+1;
     nPob(p,:)=Pob(parejas(i,2),:);
     nPob(p,(1:k))=aux;
     p=p+1;
 end
 
 