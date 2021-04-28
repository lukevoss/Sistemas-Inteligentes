function P=torneo(sCost)
    k=5;
    N=length(sCost);
    P=zeros(1,N);
    for i=1:N
        ind=randperm(N,k);
        [~,index]=min(sCost(ind));
        P(i)=ind(index);
    end
end
    