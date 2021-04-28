function [Pob,Pobfit] = Re_Elitista(Pob,newPob,Pobfit,newEval)

N2 = length(newPob);
cont =1;
PobConcat = [Pob; newPob];
PfitConcat = [Pobfit newEval];
[N1,~] = size(Pob);
while cont <=N1
 [v,i] = min(PfitConcat);
 PobEval(cont) = v;
 Pobaux(cont,:) = PobConcat(i,:);
 PfitConcat(i) = [];
 PobConcat(i,:) = [];
 cont = cont+1;
end
Pob = Pobaux;
Pobfit=PobEval;  

end

