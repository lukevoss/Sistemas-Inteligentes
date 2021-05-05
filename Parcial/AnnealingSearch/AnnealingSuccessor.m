function Successor = AnnealingSuccessor(Old, satelites, installCosts, Cmax, M)
%Returns the Successors. Successors created by randomly changing some of
%the Representatives, adding or removing representatives (Constraints: not
%over M representatives, total installationcost not over Cmax)
% Old = current array of representatives
Successor = Old;
len = length(Successor);
%first randomly removing  representatives.
for i = len:-1:1
    if(0.1>rand())
        Successor(i)=[];
    end
end
%then randomly adding representatives (this also creates change in
%representatives). Meanwhile keeping in mind the constraints.
Nadd = M-length(Successor);
for i = 1:Nadd
    if(0.99>rand())
        [N,~]=size(satelites);
        indexes = (1:N);
        notRepresentatives = setdiff(indexes,Successor);
        j=1;
        abort = 0;
        while(~abort && j<=30) %30 tries to find a Representative
            ind = randperm(length(notRepresentatives),1);
            Try = Successor;
            Try(length(Successor)+1) = notRepresentatives(ind);
            if(fInstallCost(installCosts,Try)<=Cmax)
                Successor(length(Successor)+1)=notRepresentatives(ind);
                abort = 1;
            end
            j = j+1;
        end
    end
end

end

