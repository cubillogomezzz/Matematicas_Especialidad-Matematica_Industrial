%% Método AB-2 unidimensional 

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

%primera iteracion con euler explícito
yn(2)=yn(1)+dt*f(tn(1),yn(1));

for i=2:n

    yn(i+1)=yn(i)+dt*(1.5*f(tn(i),yn(i))-0.5*f(tn(i-1),yn(i-1)));

end    

hold on
%plot(tn,sol_anal(tn),'g')
plot(tn, yn, 'b')
hold off
