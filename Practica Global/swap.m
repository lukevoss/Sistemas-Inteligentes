function pob=swap(tmpPob,Pmut)
   [N,M]=size(tmpPob);
   pp=rand(1,N);
   ind=find(pp>Pmut);
   for i=1:N
    pob(i,:)=tmpPob(i,:);
    if not(ind==i)
         r=randperm(M,2);
         aux=pob(i,r(1));
         pob(i,r(1))=pob(i,r(2));
         pob(i,r(2))=aux;
    end
   end
end