function [y_prediction, t] = SDIRK2(f, t_0, y_0, h, n_steps)
    y_prediction = zeros(length(y_0), n_steps + 1);
    y_prediction(:, 1) = y_0;
    t = zeros(length(t_0), n_steps+1);
    t(:, 1) = t_0;
   
    y_n = y_0;
    t_n = t_0;
    
    %coefficients
    c1 = 1 - sqrt(2)/2; c2 = 1;

    a11 = sqrt(2)/2;  a12 = 0;
    a21 = sqrt(2)/2;  a22 = 1 - sqrt(2)/2;

    b1 = sqrt(2)/2; b2 = 1 - sqrt(2)/2;

    for i = 2:(n_steps + 1)
        % Stage 1: Solve for k1
        g1 = @(k) k - f(t_n + c1*h, y_n + h*a11*k); 
        k1 = fsolve(g1, y_n, optimset('Display','off')); % Use y_n as the initial guess for k1

        % Stage 2: Solve for k2
        g2 = @(k) k - f(t_n + c2*h, y_n + h*(a21*k1 + a22*k)); 
        k2 = fsolve(g2, y_n, optimset('Display','off')); % Use y_n as the initial guess for k2

        % Compute the next step
        y_n = y_n + h*(b1*k1 + b2*k2);
        y_prediction(:, i) = y_n; 
        t_n = t_n + h;
        t(:, i) = t_n;
    end
end

