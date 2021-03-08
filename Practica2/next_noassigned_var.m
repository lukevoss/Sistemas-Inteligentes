function [v]=next_noassigned_var(x, domains, case_number)
%% returns next variable to be assigned
noassig=find(x==0);
v = 1;
N=size(x,1);
if ~isempty(noassig)
    switch(case_number)
        case 1
            %%% Next variable, the first from the list
            v = noassig(1);
        case 2
            %%% Degree Heuristic Grado
            % least amount of number in rows and columns ->max number of
            % zeros
            sums = [];
            for i= 1:length(noassig)
                [row, col]=ind2sub(size(x), noassig(i));
                zeros_row = find(x(row,:)==0);
                zeros_col = find(x(:,col)==0);
                sum_zeros = length(zeros_row) + length(zeros_col);
                if x(noassig(i))==0 %prevent that 0 at location i gets counted twice
                    sum_zeros = sum_zeros - 1;
                end
                sums=[sums sum_zeros];
            end
            [~,i]=min(sums);
            v = noassig(i);
        case 3
        %%% Minimum Remaining Values (MRV)
            legalValues = domains(noassig, :);
            [~, i] = min(sum(legalValues,2));
            v = noassig(i);
        otherwise
        v=0;s
    end
end
end
