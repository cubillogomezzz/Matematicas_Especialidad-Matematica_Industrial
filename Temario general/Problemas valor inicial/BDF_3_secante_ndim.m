%% Método BDF-3 para sistemas con resulución de ec implícitas mediante secante

f = @(t,y) [-y(2);y(1)];
y0 = [1;0];

t0 = 0;
tf = 3;

dt = 0.1;
n = round((tf-t0)/dt);  %asegurar que sea entero
dt = (tf-t0)/n; %recalcula dt 

tn = t0:dt:tf;
yn = zeros(length(y0),length(tn));
yn(:,1) = y0;

for i=1:n

    if (i==1)||(i==2) %primeras iteraciónes con RK explícito
        
        yn(:,2) = yn(:,1) + dt*f(tn(1),yn(:,1));
        yn(:,3) = yn(:,2) + dt*f(tn(2),yn(:,2));

    else  %resto de iteraciones con secante, error rel parámetro de finalización

        xn_ant=yn(i-1);
        xn=yn(i);
        tol=1e-10; %desviacion relativa ultimas iteraciones
        N=1000; % el parámetro de finalización debería de ser tol, N grandes
        
        u=1/11;%eficiencia

        g_aux= f(tn(i),) dt*6*u*f(tn(i)+dt,x)
        for j=1:length(y0)
                
                g_aux= @(X) f(tn(i),) 
                g_imp = @(x) dt*6*u*f(tn(i)+dt,x)+18*u*yn(j,i)-9*u*yn(j,i-1)+2*u*yn(j,i-2)-x;
                % función para ceros de ecuación implícita que da el método
        
                for k=1:N
                    x_aux = xn;
                    xn=xn-g_imp(xn)*(xn-xn_ant)/(g_imp(xn)-g_imp(xn_ant));
                    xn_ant = x_aux;
                  
                    if abs(xn-xn_ant)/abs(xn)<tol 
                        break;
                    end
                end
        
                yn(j,i+1)=xn;
        end
    end

end    

hold on
plot(yn(1,:), yn(2,:), 'b')
hold off