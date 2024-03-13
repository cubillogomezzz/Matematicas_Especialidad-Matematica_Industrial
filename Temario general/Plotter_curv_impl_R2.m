% --- Plotter sistemas 2x2 en X-Y --- 
% funciona algo mejor que contour(,,[0 0]) y pone limites autmaticamente
f1 = @(x,y) ; %importante en x,y no vector
f2 = @(x,y) ; 
fimplicit(f1)
hold on 
fimplicit(f2)