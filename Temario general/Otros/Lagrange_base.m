% --- Interpolación de Lagrange mediante polinomios interpolantes li---

% A partir de n+1 datos (xi, fxi) 0<=i<=n, la interpolación de Lagrange construye un
% polinomio de grado n que presenta estos valores. 


f = @(x) (3+x).*cos(pi/4*x).^2; %función conocida o a comparar con la interpolación
xi = [0 1 3];
%fi = [ ];
fi = f(xi); % si función conocida


x = [2 2.4 3.5]; %puntos en los que obtener evaluado el pol interpolador
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