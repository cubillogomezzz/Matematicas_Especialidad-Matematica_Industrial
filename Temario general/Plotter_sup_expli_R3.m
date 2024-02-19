% -- Plotter funciones u=f(x,y) --

[x,y]=meshgrid(-2:0.1:2,-2:0.1:2); 

f = @(x,y)  %cuidado .^

surf(x,y,f(x,y)) %superficie en 3D
%contour(x,y,f(x,y)) %unas cuantas sup de nivel
contour(x,y,f(x,y),[1 1]) %sup nivel que pasa por un punto dado