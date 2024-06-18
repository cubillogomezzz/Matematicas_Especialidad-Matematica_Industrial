%% Análisis región estabilidad lineal numericamente para métodos Runge-Kutta

% Recorremos un mallado de lambda*dt comprobando si el polinomio que caracteriza 
% el comportamiento en valor absoluto de la iteración es menor que 1 

n = 1; % orden del método, dato de entrada

[x y] = meshgrid(-5:.1:1,-3:.1:3);
z = complex(x,y); %mallamos plano complejo, con z=dt*lambda

zz = 1;
for k=1:n
    zz = zz + z.^k/factorial(k); % genera el polinomio
end

contourf(x,y,-abs(zz),-[1 1]) %colorea zona estable
grid
