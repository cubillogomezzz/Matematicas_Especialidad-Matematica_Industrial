f = @(x) x.^5;

a=0;
b=2;

g = @(t) 0.5 * (b-a)*f(0.5*(b-a)*t+(b+a)*0.5); % transformacion para pasar a -1 1,
%afin para nodos y (b-a)/2 de dt

%nodos y pesos para distinto numero de puntos n
%grado de precisión m=2n-1

% xi = [-sqrt(3)/3 sqrt(3)/3]; %n=2
% wi = [1 1];

xi = [-sqrt(3/5) 0 sqrt(3/5)]; %n=3
wi = [5/9 8/9 5/9];

Qf = sum(wi.*g(xi))

