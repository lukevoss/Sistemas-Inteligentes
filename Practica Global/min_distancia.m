function [mdistancia, index] = min_distancia(orig, dest)
    distancia = zeros(1, size(dest, 2));
    for n = 1:length(distancia)
        distancia(n) = sqrt((orig(1)-dest(1,n))^2 + (orig(2)-dest(2,n))^2);
    end
    [mdistancia, index] = min(distancia);
end