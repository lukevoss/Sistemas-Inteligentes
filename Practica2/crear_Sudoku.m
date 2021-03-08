function [x,domains]= crear_Sudoku(N)
    %% Solucion
    % 9	7	1	2	8	3	4	5	6
    % 3	5	4	1	9	6	2	8	7
    % 6	2	8	4	5	7	9	3	1
    % 4	3	5	7	1	9	8	6	2
    % 8	1	2	6	3	4	7	9	5
    % 7	9	6	8	2	5	3	1	4
    % 5	8	7	3	6	2	1	4	9
    % 2	6	3	9	4	1	5	7	8
    % 1	4	9	5	7	8	6	2	3
    switch(N)
        case 9
            x=[0 0 1 2 0 3 0 0 6
               0 5 0 0 0 6 0 0 7
               0 0 0 4 0 7 0 0 1
               0 0 5 7 0 0 8 0 2
               8 1 2 6 0 4 7 0 5
               7 0 0 0 0 5 3 0 4
               0 0 0 3 0 0 1 0 9
               2 0 0 0 4 0 5 0 0
               0 4 0 0 7 0 6 2 3];
            N=9;

        case 4
            x=[2 3 0 4; 
               4 0 3 0;
               3 0 0 0;
               0 2 4 0];
            N=4;
        otherwise
            x = 0;
            N = 0;
    end

    domains = ones(N*N,N);
    sz = [N N];
    %change Domains from thos who are different than 0
    for i = 1:N*N
        if(x(i) ~= 0)
            domains(i, :) = 0;
            %domains(i, x(i)) = 1;
            [row,col]=ind2sub(sz, i);
            %Now we take care af Contraints to be correct in Rows and
            %Columns:
            for j = 1:N
                %if (j~=col)%we dont want to have location [row,col]
                index = sub2ind(sz,row,j);%find indexes in same row
                domains(index,x(i))=0; %set value assigned
                %end
                %if (j~=row)
                index = sub2ind(sz,j,col);%find indexes in same column
                domains(index,x(i))=0;
                %end
            end
            sub = submatrix(i,N);
            domains(sub,x(i))= 0;
            %domains(i,x(i)) = 1;%change Back to 1 so it doesnt stay overwritten with 0
        end
    end
end
%% backtrackSudoku(x, ... resto de parametros)

