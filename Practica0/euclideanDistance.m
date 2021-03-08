clear all
clc
M=[ 2 34 11 55 25; 55 10 12 90 10; 11 12 13 14 11];
V=[52 96 10];
M= M';
N = size(M,1);
result = zeros(1,N);
for i = 1:N
    result(i) = eucDistance(M(i,:),V);
end
[m,j]=min(result);
disp('Result is:')
M(j,:)