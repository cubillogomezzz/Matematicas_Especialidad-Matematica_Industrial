%% Método Heun n-dimensional:
% Cuadratura trapecio + euler explícito, método explícito

F = @(t,Y) [-Y(2);Y(1)];
Y0 = [1;0];

t0 = 0;
tf = 32.345;

% n = 400; %numero iteraciones
% dt = (tf-t0)/n ;

dt = 0.1;
n = round((tf-t0)/dt);  %asegurar que sea entero
dt = (tf-t0)/n; %recalcula dt 

tn = t0:dt:tf;

Yn = zeros(length(Y0),length(tn));
Yn(:,1) = Y0;

for i=1:n

    k1 = F(tn(i),Yn(:,i));
    k2 = F(tn(i+1), Yn(:,i)+k1*dt);

    Yn(:,i+1) = Yn(:,i) + 0.5*dt*(k1+k2);

end    

hold on
plot(Yn(1,:),Yn(2,:))
hold off