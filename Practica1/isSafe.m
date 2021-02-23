function [boolean] = isSafe(n, G, x, k , c)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i = 1:n
    if (G(k,i) == 1) && c == x(i)
        boolean = false;
        return
    end
end
boolean = true;
return
end

