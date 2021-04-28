function [Pobfit] = EvalPob(Pob)
Np = size(Pob);

for i=1:Np
    Pobfit(i) = fEval(Pob(i,:));
end
end