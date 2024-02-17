%metodo num para hallar punto fijo de g (si se quiere ceros de f, g=f+x)

g = @(x) ;

a=;
b=;

K=; %max de la derivada de g en el intervalo

delta = ; %error 

xn=;

n=ceil(log(delta/(b-a))/log(K));

for i=1:n
    xn = g(xn);
end 


