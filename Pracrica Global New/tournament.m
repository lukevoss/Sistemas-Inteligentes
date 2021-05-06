function Parents=tournament(PobFit)
    %PobFit= instalation value list
    
    k=3;
    N=length(PobFit);
    Parents=zeros(1,N);
    for i=1:N
        indexes=randperm(N,k);
        [~,b]=min(PobFit(indexes)); 
        Parents(i)=indexes(b); 
    end
end
    