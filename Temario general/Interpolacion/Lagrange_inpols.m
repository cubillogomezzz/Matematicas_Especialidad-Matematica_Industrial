% --- Interpolación de Lagrange mediante polinomios interpolantes li---

% A partir de n+1 datos (xi, fxi) 0<=i<=n, la interpolación de Lagrange construye un
% polinomio de grado n que presenta estos valores. 


% f = @(x) ; %función conocida o a comparar con la interpolación
xi = [ ];
fi = [ ];
% fi = f(xi); % si función conocida


x = 0:0.01:1; %puntos en los que obtener evaluado el pol interpolador
p = 0*x; 

for i=1:length(xi) 
    li=0*x+1;

    for j=1:length(xi)
        if i ~= j
         li = li.*(x-xi(j))/(xi(i)-xi(j));
        end
    end

    p = p + fi(i)*li; 

end

hold on 
% plot(x,f(x),'b') %representar función 
plot(x,p,'g')
scatter(xi, fi, 'r')