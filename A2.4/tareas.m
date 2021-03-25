function [A,ini,eval]=tareas()

%%% problema de planificacion de tareas
%%% matriz donde cada fila representa un trabajador y cada columna el
%%% tiempo que tarda en realizar la tarea
A=[             12          43           15            7      13
                9           10            6            4      25
                5           13           29            2      18
                4           11           17            9      7
                10          20           4             8      21 ];
            
            
ini=randperm(length(A));
eval=cost(A,ini);