function [e] = EvalTablero(v)
N = length(v);
maxAtaques = sum(1:N-1);  % *2 por columnas
numAtaques = fEval(v);
e = maxAtaques - numAtaques;

end