function [val] = Intercambio(hijo,i,p)
colocado = false;
while ~colocado
    val = p(i);
    if isempty(find(hijo ==val))
        colocado =true;
    else
        i = find(hijo ==val);
    end

end
end

  
