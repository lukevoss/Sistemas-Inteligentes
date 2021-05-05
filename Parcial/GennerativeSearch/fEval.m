function cost = fEval(satelites,representatives)
%Returns the cost of the Satelite constillation. Smaller cost are better.
%   satelites = Coordinates of all Satelites (including representatives).
%   representatives = index of Representatives in Satelites.
    cost = 0;
    [N,~]=size(satelites);   
    indexes = (1:N);
    notRepresentatives = setdiff(indexes,representatives);
    for n = notRepresentatives        
        [dist,~] = min_distancia(satelites(n,:), satelites(representatives,:));
        cost = cost + dist;
    end
end

