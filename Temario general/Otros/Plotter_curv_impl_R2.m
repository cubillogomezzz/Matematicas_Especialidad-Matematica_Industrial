% --- Plotter sistemas 2x2 en X-Y --- 
% funciona algo mejor que contour(,,[0 0]) y pone limites autmaticamente
f1 = @(x,y) (x.^2+y.^2).^2-2*(x.^2-y.^2)+1/50; %importante en x,y no vector
f2 = @(x,y) x.^3-3*x.*y+y.^3-1/50; 
fimplicit(f1)
hold on 
fimplicit(f2)