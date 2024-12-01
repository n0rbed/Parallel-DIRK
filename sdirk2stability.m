gamma = 1 - (1 / sqrt(2));

% Define the function R(z)
R = @(z) (1 - z .* (1 - 2 * gamma)) ./ ((1 + z .* gamma).^2);

% Create a grid of complex numbers
real_range = linspace(-5, 5, 500); % Real axis range
imag_range = linspace(-5, 5, 500); % Imaginary axis range
[X, Y] = meshgrid(real_range, imag_range); % 2D grid
Z = X + 1i * Y; % Complex grid

% Compute |R(z)| on the grid
R_values = abs(R(Z));

% Plot the stability region
figure;
contourf(X, Y, R_values, [0, 1], 'LineColor', 'black'); % Contour where |R(z)| < 1
colormap([1, 1, 1; 1, 1, 0]); % White for |R(z)| >= 1, Yellow for |R(z)| < 1
hold on;

% Add axes and labels
xlabel('Real(z)');
ylabel('Imag(z)');
axis equal;
grid on;