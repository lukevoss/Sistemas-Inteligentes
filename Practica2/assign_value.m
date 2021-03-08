function [x,domains] = assign_value(x,domains, v, value)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    x(v)=value;
    [row,col]=ind2sub(size(x), v);
    for i=length(x)
        index1 = sub2ind(size(x),row,i);
        index2 = sub2ind(size(x),i,col);
        domains(index1, value)= 0;
        domains(index2, value)= 0;
    end
    sub = submatrix(v,N);
    domains(sub,value)= 0;
end

