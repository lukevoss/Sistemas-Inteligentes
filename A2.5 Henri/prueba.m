
function [] = prueba()
    N = 10;
    N2 = 30;
    for i=1:1000
       Inicial(i,:) = randperm(N);
    end
    rng(1);
    for i=1:1000
       Inicial2(i,:) = randperm(N2);
    end
    [Tt,TIter,Texistos] = PruebaTabu(Inicial)
    [Tt2,TIter2,Texistos2] = PruebaTabu(Inicial2)

    [Lt,LIter,LtExitos] = PruebaLocalSearch(Inicial)
    [Lt2,LIter2,LExitos2] = PruebaLocalSearch(Inicial2)
     
    [At,AIter,AExitos] = PruebaAnnealing(Inicial)
    [At,AIter2,AExitos2] = PruebaAnnealing(Inicial2)

end