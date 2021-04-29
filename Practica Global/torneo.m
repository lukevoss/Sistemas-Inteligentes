function Parents=torneo(PobFit)
    k=3;
    N=length(PobFit);
    Parents=zeros(1,N);
    for i=1:N
        indexes=randperm(N,k); %indeksy potencjalnych rodziców
        [~,b]=min(PobFit(indexes)); %b to index wybranego rodzica w indexes, a to wartość w pob
        Parents(i)=indexes(b); %Poadrs(i) to index rodzica
    end
end
    