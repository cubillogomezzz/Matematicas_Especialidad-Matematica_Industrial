%% Diferenciación numérica con tres puntos para datos equiespaciados

% f = @(x) exp(2*x);
% h=0.1;
% xi = 0:h:5;
% fi = f(xi);

xi= ; %datos entrada
fi= ;

h = xi(2)-xi(1);
n = length(xi);

dfi = 0*xi;

i=1; dfi(i) = (-3*fi(i)+4*fi(i+1)-fi(i+2))/(2*h);
for i = 2:n-1

    dfi(i) = (fi(i+1)-fi(i-1))/(2*h);

end
i=n; dfi(i) = (3*fi(i)-4*fi(i-1)+fi(i-2))/(2*h);


