function [boolean] = isSafe(x,k,ind)
%x= Sodoku Matrix
%k = Number to try
%ind = index of where to put it
    sz = size(x);
    [row,col]=ind2sub(sz, ind);
    sub = submatrix(ind, size(x,1));
    contains_k = any(x(row,:)==k) || any(x(:,col)==k) || any(x(sub)==k);%check if at least one entry in row or column or submatrix has already same value as k
    boolean = ~contains_k;
end