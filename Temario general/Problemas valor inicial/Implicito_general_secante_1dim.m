%% Método implícito general resolviendo numéricamente con secante:
% Resolucíón numérica de ecuaciones implícitas mediante secante (punto fijo para primera)

f = @(t,y) y;
y0 = 1;

t0 = 0;
tf = 3;

dt = 0.1;
n = round((tf-t0)/dt);  %asegurar que sea entero
dt = (tf-t0)/n; %recalcula dt 

tn = t0:dt:tf;
yn = 0*tn;
yn(1) = y0;


for i=1:n

    if i==1 %primera iteración con punto fijo, error parametro de finalización
        
        g_imp = @(x) yn(i)+dt*0.5*(f(tn(i),yn(i))+f(tn(i)+dt,x)); %(sin -yn+1)
        %función para punto fijo ecuación implícita que da el método

        delta = 1e-7; %error rel
        N_iter = 1000;
        xj=yn(i);
        for j=1:N_iter %N grandes para que sea delta param de finalizacion
            xj_ant = xj;
            xj = g(xj);
            if abs(xj-xj_ant)/abs(xj)<delta
                break;
            end
        end

        yn(i+1) = xj;

    else  %resto de iteraciones con secante, error rel parámetro de finalización

        xn_ant=yn(i-1);
        xn=yn(i);
        tol=delta; %desviacion relativa ultimas iteraciones
        N=1000; % el parámetro de finalización debería de ser tol, N grandes
        
        g_imp = @(x) yn(i)+dt*0.5*(f(tn(i),yn(i))+f(tn(i)+dt,x))-x; 
        % función para ceros de ecuación implícita que da el método

        for k=1:N
            x_aux = xn;
            xn=xn-g_imp(xn)*(xn-xn_ant)/(g_imp(xn)-g_imp(xn_ant));
            xn_ant = x_aux;
          
            if abs(xn-xn_ant)/abs(xn)<tol 
                break;
            end
        end

        yn(i+1)=xn;

    end

end    

hold on
%plot(tn,sol_anal(tn),'g')
plot(tn, yn, 'b')
hold off