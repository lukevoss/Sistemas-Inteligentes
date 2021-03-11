function [x,domains] = backtracking(x, domains, case_noassign, case_ordered)
    v = next_noassigned_var(x, domains, case_noassign);
    if (v ~= 0)
        valuesList = ordered_values(v, domains, case_ordered);
        withoutValue = find(x == 0);
        while ~isempty(valuesList) && ~isempty(withoutValue)
            value = valuesList(1);
            valuesList(1)=[];
            if isSafe(x,value,v)
                domains_bevor = domains;
                [x,domains] = assign_value(x,domains,v,value);
                [x,domains] = backtracking(x,domains,case_noassign, case_ordered);
                withoutValue = find(x == 0);
                if ~isempty(withoutValue)
                    x(v) = 0;
                    domains = domains_bevor;
                end
            end
        end
    end
end

