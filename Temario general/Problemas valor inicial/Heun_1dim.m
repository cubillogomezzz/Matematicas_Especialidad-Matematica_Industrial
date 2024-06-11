%% Método Heun unidimensional:
% Cuadratura trapecio + euler explícito, método explícito

f = @(t,y) y;
y0 = 1;

%sol_anal = @(t) exp(t);

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
    k2 = f(tn(i+1), yn(i)+k1*dt);

    yn(i+1) = yn(i) + 0.5*dt*(k1+k2);

end    

hold on
%plot(tn,sol_anal(tn),'g')
plot(tn, yn, 'b')
hold off