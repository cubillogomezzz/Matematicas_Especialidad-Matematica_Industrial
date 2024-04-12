% --- Interpolación de Hermite de orden contacto 2 mediante diferencias divididas--- 

% A partir de 2*(n+1) datos (xi, fi) (xi, f'i)  0<=i<=n, la interpolación de Hermite
% construye un polinomio de grado 2n+1 que presenta estos valores y
% primeras derivadas. 

%f = @(x) 1./(1+25*x.^2); %función conocida o a comparar con la interpolación
df = @(x) -50*x./((1+25*x.^2).^2);

%xi = -1:0.1:1;
xi=cos(((2*[0:n]+1)/(2*n+2))*pi);
%fi = [ ];
%dfi = [ ];
fi = f(xi); % si función conocida
dfi = df(xi); 

x = -1:0.005:1; %puntos en los que obtener evaluado el pol interpolador
p = 0*x; 
u = length(xi);

table = zeros([2*u,2*u+1]); %xi como primera columna de la tabla
%rellenar datos 
for i=1:u 
    table(2*i,1)=xi(i);
    table(2*i-1,1)=xi(i);
    table(2*i,2)=fi(i);
    table(2*i-1,2)=fi(i);
    table(2*i,3)=dfi(i);
end

%desarrollar a partir de los datos

for i=1:u-1 %completar dd-2
    table(2*i+1,3)=(table(2*i+1,2)-table(2*i,2))./(table(2*i+1,1)-table(2*i,1));
end    

for j=4:(2*u+1) %dd-3 en adelante
    for i=(j-1):(2*u)

        m=i-(j-2);
        table(i,j) = (table(i,j-1)-table(i-1,j-1))./(table(i,1)-table(m,1));

    end     
end

table;

coef = diag(table,1)
q=1;

for i=1:u %construccion de p

        p = p + coef(2*i-1).*q; 
        q = q.*(x-xi(i)); 
        p = p + coef(2*i).*q;
        q = q.*(x-xi(i)); 

end

hold on 
plot(x,f(x),'b') %representar función 
plot(x,p,'g')
scatter(xi, fi, 'r')
%axis([-1 1 -0.2 1])
