function Successor = randSuccessor(state, N, caso)
%Returns random succesor
%   caso 1: it switches the position of 2 random queens
%   caso 2: completely random reposition of queens
switch caso
    case 1
        randomNumbers = randperm(N,2);
        pos1 = randomNumbers(1);
        pos2 = randomNumbers(2);
        aux = state(pos1);
        state(pos1) = state(pos2);
        state(pos2) = aux;
        Successor = state;
    case 2
        Successor = randperm(N);
end
end

