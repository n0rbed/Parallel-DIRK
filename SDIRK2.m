function [y_prediction] = SDIRK2_2(f, t_n, y_n, h, n_steps)
    y_prediction = [];
    syms k;
    for i = 1:n_steps
        % Stage 1
        c1 = 1-sqrt(2)/2; 
        a11=sqrt(2)/2; a12 = 0;
    
        % find k1 using a numerical solver
        k1 = vpasolve(k == f(t_n+c1*h, y_n+h*a11*k))
        
        % Stage 2
        c2 = 1;
        a21 = sqrt(2)/2; a22 = 1-sqrt(2)/2;
        
        k2 = vpasolve(k == f(t_n+c2*h,y_n+h*(a21*k1+a22*k)))
        
        % Compute the next step (y_next)
        b1 = sqrt(2)/2; b2 = 1-sqrt(2)/2;
        y_prediction(i) = y_n + h*(b1*k1+b2*k2);
        y_n = y_prediction(i);
        t_n = t_n + h;
    end
end