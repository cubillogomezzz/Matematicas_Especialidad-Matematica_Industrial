% --- Integración numérica Simpson compuesta ---

f = @(x) 2*x + x.^2;

a=0;
b=6;

n=6; % para n par, n número de intervalos de sampleo de f, 
% no número de intervalitos de integración
h=(b-a)/n;

xi = a:h:b;
fi = f(xi);

Qf = h/3*(fi(1)+ 4*sum(fi(2:2:n)) +  2*sum(fi(3:2:n-1)) + fi(n+1))

