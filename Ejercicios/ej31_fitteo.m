% Ejercicio 31 ajuste de datos por minimos cuadrados, apartado b)

load('datos.mat')

g = @(X) sum((y_sample-X(1)*x_sample.^2-X(2)*x_sample-X(3)).^2) ;

dgx = @(X) 2*sum((y_sample-X(1)*x_sample.^2-X(2)*x_sample-X(3))*(-1).*(x_sample).^2);
dgy = @(X) 2*sum((y_sample-X(1)*x_sample.^2-X(2)*x_sample-X(3)).*(-x_sample));
dgz = @(X) 2*sum(y_sample-X(1)*x_sample.^2-X(2)*x_sample-X(3));

Xn=[1;1;1];

tol=1e-8;   
N=1000;        

for i=1:N
    Xn_ant = Xn;
    vec_grad = [dgx(Xn); dgy(Xn); dgz(Xn)];
    alpha = (1/norm(vec_grad))*0.1 ;
    X=Xn-alpha*vec_grad ;
    while g(X) > g(Xn)
        alpha = alpha/2 ;
        X = Xn - alpha*vec_grad ;
    end
    if norm(X-Xn_ant)/norm(X) < tol 
        break;
    end
    Xn = X;

    %plot([Xn_ant(1) Xn(1)],[Xn_ant(2) Xn(2)], 'r.-')  
    %dibuja recta entre iteraciones, hacer sobre plot inicial
end

plot(x_sample, y_sample)
hold on 
func_ajuste = @(x) Xn(1)*x.^2+Xn(2)*x+Xn(3);
plot(x_sample, func_ajuste(x_sample))
axis([0 8 0 8])

g(Xn)

