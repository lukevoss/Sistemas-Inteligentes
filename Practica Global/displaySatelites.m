function displaySatelites(satelites,representatives)
%Shows grafically where Satelites and Representatives are located.
[N,~]=size(satelites);
indexes = (1:N);
notRepresentatives = setdiff(indexes,representatives);
figure;
plot(satelites(notRepresentatives,1),satelites(notRepresentatives,2),'.'); hold on;
plot(satelites(representatives,1),satelites(representatives,2),'o'); hold off;
end

