function [Pob] = GenPob(NQ,NB)

for i=1:NB
   Pob(i,:) = randperm(NQ); 
end

end