function newPob=swap(tmpPob,Pmut)
   [N,M]=size(tmpPob);
   probability=rand(1,N);
   ind=find(probability>Pmut);
   newPob=tmpPob;
   
   for i=1:N
    newPob(i)=tmpPob(i);
    if not(ind==i)
         r=randperm(M,2);
         aux=newPob(i,r(1));
         newPob(i,r(1))=newPob(i,r(2));
         newPob(i,r(2))=aux;
    end
   end
end