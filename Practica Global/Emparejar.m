function parejas=Emparejar(Padres,Pcross)
%rand('seed',1);
N=size(Padres,1); 

cp=find(rand(N,1)< Pcross); 
Padres=Padres(cp);
if rem(size(Padres,1),2) 
	Padres=Padres(1:(size(cp,1)-1)); 
end 
parejas=reshape(Padres,size(Padres,1)/2,2); 
