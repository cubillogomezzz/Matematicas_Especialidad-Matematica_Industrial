f = @(x) ; %secante es New-Rap con derivada dada por pendiente de recta entre iteraciones anteriores, p=1.62 (golden ratio)

xn_ant=;
xn=;
tol=; %desviacion relativa ultimas iteraciones

N=1000; % el parámetro de finalización debería de ser tol, N grandes

for i=1:N

    x_aux = xn;
    xn=xn-f(xn)*(xn-xn_ant)/(f(xn)-f(xn_ant));
    xn_ant = x_aux;
  
    if abs(xn-xn_ant)/abs(xn)<tol 
        break;
    end

end
