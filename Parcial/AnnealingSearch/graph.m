mu = 60;
sigma = 1.5;
x = linspace(50,60,100);
y = (1/(sigma*sqrt(2*pi)))*exp(-0.5*((x-mu)/sigma).^2);
plot(x,y);
