function [v]=next_noassigned_var(x, domains, G, case_number)
%% returns next variable to be assigned
noassig=find(x==0);
v = 1;
if ~isempty(noassig)
    switch(case_number)
        case 1
            %%% Next variable, the first from the list
            v = noassig(1);
        case 2
            %%% Degree Heuristic Grado
            constraints = G(noassig, :); %list all constraints of variables where x=0
            [~, i]=max(sum(constraints,2)); %calculate which variable has more constraints
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
