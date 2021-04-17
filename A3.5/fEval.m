function [val] = fEval(actual)
N = length(actual);
val =0;
for i=1:N
    for j=i+1:N
        if abs(j-i) == abs(actual(j)-actual(i))
            val=val+1;
        end
       if actual(i) == actual(j)  %columnas
           val = val+1;    %columnas
    end
end
end