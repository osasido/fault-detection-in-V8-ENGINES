% Define the x-axis range
x = linspace(0, 10, 1000);

% Define the parameters for the triangular membership function
x1 = 2;
xm = 5;
xu = 8;

% Calculate the y values
y = zeros(size(x));
y((x > x1) & (x <= xm)) = (x((x > x1) & (x <= xm)) - x1) / (xm - x1);
y((x > xm) & (x < xu)) = (xu - x((x > xm) & (x < xu))) / (xu - xm);

% Create the plot
figure;
plot(x, y);
title('Triangular Membership Function');
xlabel('X');
ylabel('?(X)');
grid on;
