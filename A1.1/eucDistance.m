function [result] = eucDistance(a,b)
%Euclidean Distance between two vectors
result = sqrt((sum((a-b).^2)));
end

