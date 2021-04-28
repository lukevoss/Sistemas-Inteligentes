function NewPobBin=controlaSatelites(PobBin,M)
   
    candidates =  unique(PobBin(:,1:2),'rows');
    N = size(candidates,1);
    
    if(N>M)        
        NewPobBin = candidates(1:60);
    end       
end