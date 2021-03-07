function [x] = backtracking(N,x,domains,G, case_noassign, case_ordered)
    v = next_noassigned_var(x, domains, G, case_noassign);
    if (v ~= 0)
        valuesList = ordered_values(v, domains, G, case_ordered);
        withoutValue = find(x == 0);
        while ~isempty(valuesList) && ~isempty(withoutValue)
            value = valuesList(1);
            if isSafe(N,G,x,v,value)
                x(v)=value;
                [x] = backtracking(N,x,domains,G,case_noassign, case_ordered);
                withoutValue = find(x == 0);
                if ~isempty(withoutValue)
                    x(v) = 0;
                end
            else
                valuesList(1)=[];
            end
        end
    end
end

