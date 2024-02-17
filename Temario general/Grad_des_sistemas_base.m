% -- Gradient Descent para sistemas de ecuaciones --



f1 = @(X) ; %indexando X(i), en vector columna usando ;
f2 = @(X) ; 

g = @(X) f1(X)^2+f2(X)^2;

dgx = @(X) ;
dgy = @(X) ;

Xn=[;];

tol=1e-8;   
N=500;        

for i=1:N
    Xn_ant = Xn;
    vec_grad = [dgx(Xn); dgy(Xn)];
    alpha = (1/norm(vec_grad))*0.1 ;
    X=Xn-alpha*vec_grad;
    while g(X) > g(Xn)
        alpha = alpha/2 ;
        X = Xn - alpha*vec_grad;
    end
    if norm(X-Xn_ant)/norm(X) < tol 
        break;
    end
    Xn = X;
    plot([Xn_ant(1) Xn(1)],[Xn_ant(2) Xn(2)], 'r.-') 
    pause
end
    

