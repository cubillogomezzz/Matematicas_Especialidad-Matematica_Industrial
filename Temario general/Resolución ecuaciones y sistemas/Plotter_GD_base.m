% -- Plotter 3D de función (R^2-->R) a minimizar en Gradient Descent --

f1 = @(X) ; %indexando X(i)
f2 = @(X) ; 

g = @(X) f1(X).^2+f2(X).^2;

[x,y] = meshgrid(-2:0.1:2,-2:0.1:2);

for i=1:size(x,1) 
        for j=1:size(x,2)
            z(i,j)=g([x(i,j) y(i,j)]);
        end
end

 surf(x,y,z) 
 axis([-3 3 -3 3 0 3]) %para ver mejor ir variando 
 %view(2) %mirar desde arriba 
 %shading interp %colorines para ver mejor
 %colorbar %leyenda
 %caxis([0 3]) %color axis para ver mejor escala colores segun valores de z que quie
