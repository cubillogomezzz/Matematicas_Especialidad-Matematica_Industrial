f = @(x) ; %New-Rap con derivada analítica, p=2
df = @(x) ;


xn=;

tol=;  %desviación relativa entre dos ultimas estimaciones
N=1000; % el parámetro de finalización debería de ser tol, N grandes

for i=1:N

   
    xn_ant = xn;
    xn=xn-f(xn)/df(xn);

    if abs(xn-xn_ant)/abs(xn)<tol 
        break;
    end

end

