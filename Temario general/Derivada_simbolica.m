%cacharreo para punto fijo, derivada simbolica
syms x; % Define a symbolic variable

% Define a symbolic function
f = x^2 + 3*x + 1;

% Calculate the derivative of the function with respect to x
df_dx = diff(f, x);

% Display the result
disp('Symbolic Derivative:');
disp(df_dx);
