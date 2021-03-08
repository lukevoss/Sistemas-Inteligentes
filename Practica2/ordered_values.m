function vals=ordered_values (v, domains, case_number)
%%%function ordered_values(v,…)
%%% returns the list of ordered values
vals = 0;
possible= find(domains(v,:)==1);
if length(possible)>0
    switch(case_number)
        case 1
        %%% Assign the following unassigned value from the list
        vals = find(domains(v, :)==1);
        case 2
        %%% Least Constraint Value
        valsPossible = find(domains(v,:)==1); % find all Possible numbers for v
        if length(valsPossible) == 0
            vals = 0;
        else
            [~,i] = sort(sum(domains(:,valsPossible),1)); % sum up the possible colors and sort them to get sorted values
            vals = valsPossible(i);
        end
        otherwise
        vals=0;
    end
end
end
