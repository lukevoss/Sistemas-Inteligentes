function parejas=emparejar(Parents,Pcross)
%Parents= list of selected parents
%Pcross= probability for becoming father

N=size(Parents,1);  

prob=find(rand(N,1)< Pcross); 
Parents=Parents(prob); 
if rem(size(Parents,1),2) 
	Parents=Parents(1:(size(prob,1)-1)); 
end 
parejas=reshape(Parents,size(Parents,1)/2,2); 
