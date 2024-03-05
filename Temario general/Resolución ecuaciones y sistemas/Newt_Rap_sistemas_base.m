% Newton Raphson para sistemas de ecuaciones 
 
F = @(X) [ ; ]; %indexando X(i), en vector columna usando ;

JF = @(X) [ ; ]; %matriz jacobiana (cuidado .^)

Xn=[;];

tol=1e-8;      % desviación relativa entre dos ultimas estimaciones
N=1000;        % el parámetro de finalización debería de ser tol, N grandes

for i=1:N
    Xn_ant = Xn;
    Xn=Xn-JF(Xn)\F(Xn);
    if norm(Xn-Xn_ant)/norm(Xn) < tol 
        break;
    end

   % hold on 
   % plot([Xn_ant(1) Xn(1)],[Xn_ant(2) Xn(2)], 'r.-') 
   % pause  %dibuja recta entre iteraciones, hacer sobre plot inicial

end
