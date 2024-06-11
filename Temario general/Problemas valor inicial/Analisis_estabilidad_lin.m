%% Análisis región estabilidad lineal numericamente

% Recorremos un mallado de lambdas comprobando si los autovalores de la matriz
% que caracteriza el método son menores que 1

[x y] = meshgrid(-5:.1:1,-3:.1:3); 

for i=1:size(x,1) 
    for j=1:size(x,2)

        z = complex(x(i,j),y(i,j)); 
        aa = roots([3-2*z -4 1]); %ecuación de entrada, pol caract de A
        zz(i,j) = max([abs(aa(1)) abs(aa(2))]); 

    end
end

% contourf(x,y,-zz,-[1 1]) %colorea región estable
contourf(x,y,zz,[1 1])
grid

%contour(x,y,zz,[0:.1:1])
%surf(x,y,zz)
%colorbar