f = @(x) x.^4 - x.^2 + x - 1;

x=-2:0.1:2;
plot(x,f(x))
grid

N = 1000;
delta = 1e-14;

%elegimos otros valores iniciales
xn = -1.5;
xn_ant2 = -2;

for i=1:N
    if i>1 
        xn_ant2 = xn_ant;
    end
    xn_ant = xn;
    xn = xn - (xn-xn_ant2) / (f(xn)-f(xn_ant2)) * f(xn);
    if abs(xn-xn_ant) / abs(xn)<delta
        break;
    end   
end

xn

%observamos gráficamente que solo hay dos raíces reales (las otras dos son complejas), 
%por lo que solo podemos hallar esta