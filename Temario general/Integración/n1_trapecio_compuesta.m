% --- Integración numérica trapecio compuesta ---


f = @(x) x.^3;

a=0;
b=1.32;

n=708;
h=(b-a)/n;

xi = a:h:b;
fi = f(xi);

QTf = 0.5*h*(fi(1)+ 2*sum(fi(2:n)) + fi(n+1))
