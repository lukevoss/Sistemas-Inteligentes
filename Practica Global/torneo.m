function P=torneo(PobFit)
    k=3;
    N=length(PobFit);
    P=zeros(1,N);
    for i=1:N
        ind=randperm(N,k);
        [a,b]=min(PobFit(ind));
        P(i)=ind(b);
    end
end
    