% --- Interpolación de Lagrange mediante diferencias divididas---

% A partir de n+1 datos (xi, fxi) 0<=i<=n, la interpolación de Lagrange construye un
% polinomio de grado n que presenta estos valores. 


f = @(x) 1./(1+25*x.^2); %función conocida o a comparar con la interpolación
xi = -1:0.1:1;
%fi = [ ];
fi = f(xi); % si función conocida


u = length(xi); %u=n+1 
table = zeros(u, u);
table(:,1) = fi'; %esta tabla no incluye los xi, primera columna fi
for j = 2:u
    for i = 1:u-j+1
            table(i,j) = (table(i+1,j-1) - table(i,j-1)) / (xi(i+j-1) - xi(i));
    end
end

table

x = -1.1:0.001:1.1; %puntos en los que obtener p evaluado

coef = table(1,:);
p = 0*x;
q = 1;

for i=1:u
        p = p + coef(i).*q; %construcción p 
        q = q.*(x-xi(i)); 
end

hold on 
plot(x,f(x),'b') %representar función 
plot(x,p,'g')
scatter(xi, fi, 'r')
