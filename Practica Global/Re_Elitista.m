function [p,pbin, pfit] = Re_Elitista(Pob,PobBin,newPob,newPobBin,PobFit,newFit)
    N=size(Pob,1);
    convPob=[Pob ; newPob];
    convPobBin=[PobBin;newPobBin];

     convFit=[PobFit;newFit];
    for i=1:N
       [a,ind]=min(convFit);
       p(i,:)=convPob(ind,:);
       pbin(i,:)=convPobBin(ind,:);
       pfit(i,:)=convFit(ind);
       convPob(ind,:)=[];
       convPobBin(ind,:)=[];
       convFit(ind)=[];
    end

end