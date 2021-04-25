function [mdistancia, index] = min_distancia(orig, dest)
    distancia = zeros(1, size(dest, 1));
    for n = 1:length(distancia)
        distancia(n) = sqrt((orig(1)-dest(n,1))^2 + (orig(2)-dest(n,2))^2);
    end
    [mdistancia, index] = min(distancia);
end