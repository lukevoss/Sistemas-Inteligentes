function [eval] = cost(A,ini, case_goal)
%% calculates Cost of Worker Task distribution
%it depends highly on the goal:
%1. goal is no minimize total working time
%2. goal is to be done in the least amount of days
switch (case_goal)
    case 1
        sum = 0;
        for task = 1:length(ini)
            worker = ini(task);
            sum = sum + A(worker, task);
        end 
        eval = sum;
    case 2
        max = 0;
        for task = 1:length(ini)
            worker = ini(task)
            if (A(worker,task) > max)
                max = A(worker, task);
            end
            eval = max;
        end
    otherwise
        ME = MException('Cost:GoalSelected', ...
        'Invalid expression for the selected goal');
        throw(ME);
end
end

