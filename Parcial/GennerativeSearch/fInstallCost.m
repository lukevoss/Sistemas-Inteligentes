function cost = fInstallCost(costArray,representatives)
%Returns the cost of the Satelite INSTALLATION. 
%   costArray = Array of the costs for installation.
%   representatives = index of Representatives in Satelites and the cost Array.
cost = sum(costArray(representatives));
end