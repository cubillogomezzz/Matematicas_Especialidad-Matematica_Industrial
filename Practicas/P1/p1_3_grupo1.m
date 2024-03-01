f = @(x) x.^4 - x.^2 + x - 1; %raíz x=1

%graficamos para ver el aspecto
x=-2:0.1:2;
plot(x,f(x))
grid

N = 1000;
delta = 1e-14;

%elegimos los dos valores inicales cercanos a la raíz conocida
xn = 1.5;
xn_ant2 = 2;

er = 0.5;

for i=1:N
    if i>1 
        xn_ant2 = xn_ant;
    end
    xn_ant = xn;
    xn = xn - (xn-xn_ant2) / (f(xn)-f(xn_ant2)) * f(xn);
    er = [er abs(xn-1)];
    %construimos un vector que almacena el orden de convergencia p para
    %cada conjunto de 3 valores del error relativo
    if i>2
        p_aprox(i) = log(er(i)/er(i-1))/log(er(i-1)/er(i-2));
    end
    if abs(xn-xn_ant) / abs(xn)<delta
        break;
    end
    
end

%analizamos la evolución del orden de convergencia y comprobamos que tiende
%al numero áureo
figure
plot(p_aprox)
figure
plot(er)

%como hay pocas iteraciones observamos cierta desviación