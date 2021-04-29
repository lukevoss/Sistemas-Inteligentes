function parejas=Emparejar(Padres,Pcross)
N=size(Padres,1);  %%ra indices de los padres seleccionados

cp=find(rand(N,1)< Pcross); % indeksy rodziców
Padres=Padres(cp); %rodzice dla których są potomkowie
if rem(size(Padres,1),2) %reszta z dzielenia, jak nie jest przez 2 to wywalamy 1 parę
	Padres=Padres(1:(size(cp,1)-1)); 
end % obtener un número par de padres para poder redimensionar
parejas=reshape(Padres,size(Padres,1)/2,2); %reshape żeby było parami
%%% los que salen el mismo indice los dejamos tal cual, son los que no se
%%% cruzan y pasan directamente a la siguiente poblacion