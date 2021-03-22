function [A,B] = divide(m,x)
    rang1 = [1:(x/10)];
    rang2 = [(x+10)/10:(100)/10];
    A = m(:,rang1);
    B = m(:,rang2);
    v_Ax = A(1,:);
    v_Ay = A(2,:);
    v_Bx = B(1,:);
    v_By = B(2,:);
    
    plot(v_Ax,v_Ay,'r+:',v_Bx,v_By,'go');
end

