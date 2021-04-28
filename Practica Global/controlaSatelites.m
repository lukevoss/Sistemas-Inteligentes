function PobBin=controlaSatelites(PobBin,M)
    N=size(PobBin,1);
    for i=1:N
       ind=find(PobBin(i,:)==1);
       
       if size(ind,2)>M           
           count=size(ind,2)-M;
           for k=1:count
                PobBin(i,ind(k))=0;
           end
       end
       if size(ind,2)<M
          while size(find(PobBin(i,:)==1))<M
              j=randi(size(PobBin,2));
              PobBin(i,j)=1;
          end 
       end
    end

end