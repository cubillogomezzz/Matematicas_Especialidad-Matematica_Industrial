%metodo num para hallar punto fijo de g (si se quiere ceros de f, g=f+x)

g = @(x)  1 + 2./x ;

a=3/2;
b=4;

K=8/9; %max de la derivada de g en el intervalo

delta = 1e-8; %error 

xn=4;

n=ceil(log(delta/(b-a))/log(K));

x=1:0.01:4;

hold on
plot(x,g(x))
plot(x,x)


for i=1:n
    xn_ant = xn ;
    xn = g(xn);
    plot([xn_ant g(xn_ant)],[xn xn], 'r.-')
    plot([xn xn],[xn g(xn)], 'r.-')
    pause 
end 


