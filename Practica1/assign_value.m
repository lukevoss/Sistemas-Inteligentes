function [x,domains] = assign_value(x,domains, v, value)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x(v)=value;
adyacentes = G(var,:) ==1;
noCol =(x(adyacentes)==0);
aux = domains(noCol,value)==1;
domains(aux,value) =0;
end

