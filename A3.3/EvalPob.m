function [Pobfit] = EvalPob(Pob)
Np = size(Pob);

for i=1:Np
    Pobfit(i) = EvalTablero(Pob(i,:));
end
end