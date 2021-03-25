function [eval] = cost(A,ini, case_goal)
%% calculates Cost of Worker Task distribution
%it depends highly on the goal:
%1. goal is no minimize total working time
%2. goal is to be done in the least amount of days
switch (case_goal)
    case 1
        sum = 0;
        for worker = 1:length(ini)
            task = ini(worker);
            sum = sum + A(task, worker);
        end 
        eval = sum;
    case 2
        max = 0;
        for worker = 1:length(ini)
            task = ini(worker)
            if (A(task,worker) > max)
                max = A(task, worker);
            end
            eval = max;
        end
    otherwise
        ME = MException('Cost:GoalSelected', ...
        'Invalid expression for the selected goal');
        throw(ME);
end
end

