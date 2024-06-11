%% Método RK-4 unidimensional:
% Cuadratura Simpson + Euler exp, imp y combinación. Método explícito.

f = @(t,y) y;
y0 = 1;

sol_anal = @(t) exp(t);

t0 = 0;
tf = 3;

dt = 0.1;
n = round((tf-t0)/dt);  %asegurar que sea entero
dt = (tf-t0)/n; %recalcula dt 

tn = t0:dt:tf;
yn = 0*tn;
yn(1) = y0;

for i=1:n

    k1 = f(tn(i),yn(i));
    k2 = f(tn(i)+0.5*dt, yn(i)+0.5*k1*dt);
    k3 = f(tn(i)+0.5*dt, yn(i)+0.5*k2*dt);
    k4 = f(tn(i+1), yn(i)+k3*dt);

    yn(i+1) = yn(i) + 1/6*dt*(k1+2*k2+2*k3+k4);

end    

hold on
plot(tn,sol_anal(tn),'g')
plot(tn, yn, 'b')
hold off