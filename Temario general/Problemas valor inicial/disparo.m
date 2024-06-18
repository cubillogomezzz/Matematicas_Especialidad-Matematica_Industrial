
f = @(t,y) [6*y(1)-2*y(1).*y(2);-4*y(2)+2*y(1).*y(2)];

t0 = 0;
tf = 1;

dt = 0.1;
Nt = (tf-t0)/dt;

alpha_0 = 0; %c frontera, parámetro de entrada
alpha_1 = pi;

gk_ant = 0;
c0 = -1; %primeros valores de c para el método de la secante invent()
c1 = -2;

ck = c0;
for k=1:1000 %iteración para hallar c, dentro de la cual se halla yn para cada c
    y0 = [alpha_0; ck]; %condiciones iniciales
    yn = zeros(length(y0),Nt+1);
    yn(:,1) = y0; 
    tn = t0:dt:tf;
    for i=1:Nt

        k1 = f(tn(i),yn(:,i));
        k2 = f(tn(i)+0.5*dt, yn(:,i)+0.5*k1*dt);
        k3 = f(tn(i)+0.5*dt, yn(:,i)+0.5*k2*dt);
        k4 = f(tn(i+1), yn(:,i)+k3*dt);

        yn(:,i+1) = yn(:,i) + 1/6*dt*(k1+2*k2+2*k3+k4);

    end

%     for n = 1:Nt %resolución para un ck dado, mediante rk-4
% 
%         tn = t0 + (n-1) * dt;
%         k1 = f(tn,yn(:,n));
%         k2 = f(tn+dt,yn(:,n)+dt*k1);
%         yn(:,n+1) = yn(:,n) + dt * 0.5 * (k1 + k2);
% 
%     end

    tn = t0:dt:tf;
    plot(tn,yn(1,:))
    grid
    axis([1 3 0 25])
    title(['iteracion: ' num2str(k) ';    valorfinal: ' num2str(yn(1,end))])
    pause
    gk = yn(1,end) - alpha_1; %definición de gk para el yn obtenido con el c dado (d
    if k==1
        ck_ant = ck;
        gk_ant = gk;
        ck = c1;
    else %cálculo de los siguientes ck (método de la secante)
        cc = ck - gk*(ck-ck_ant)/(gk-gk_ant);
        ck_ant = ck;
        ck = cc;
        gk_ant = gk;
    end
    if abs(gk)<1e-12
        break;
    end
end
