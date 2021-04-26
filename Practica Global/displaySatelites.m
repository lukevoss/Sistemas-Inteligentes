function displaySatelites(satelites,representatives)
%Shows grafically where Satelites and Representatives are located.
[N,~]=size(satelites);
indexes = (1:N);
notRepresentatives = setdiff(indexes,representatives);
plot(satelites(notRepresentatives,1),satelites(notRepresentatives,1),'.','blue'); hold on;
plot(satelites(representatives,1),satelites(representatives,1),'o','red'); hold 
end

