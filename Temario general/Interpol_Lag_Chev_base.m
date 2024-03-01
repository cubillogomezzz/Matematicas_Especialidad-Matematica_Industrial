% --- Interpolación de Lagrange óptima con nodos de Chevychev ---

%Parámetros de entrada

f = @(x) 1./(1+25*x.^2); %función a interpolar
a=-1.2; %frontera dominio 
b=1.2;
x = a:0.01:b; %vector de puntos en los que se devolvera Pn evaluado
n=21; %numero de nodos, pol interpolador de grado n-1

xi_ini=cos(((2*[0:n]+1)/(2*n+2))*pi);  %calculo nodos, -1<=xi<=1 
xi = (a+b)/2 + xi_ini*(b-a)/2  %nodos haciendo transformacion afin para ocupar todo el dominio
fi = f(xi); 
p = 0*x; %inciialización

for i=1:length(xi) %se construyen interpolantes, se multipiclan por su valor asociado y se suman para construir p
    li=0*x+1; %inicialización a 1 

    for j=1:length(xi)
        if i ~= j
         li = li.*(x-xi(j))/(xi(i)-xi(j)); %construcción pol interpolanates
        end
    end

    p = p + fi(i)*li; 

end

plot(x,f(x),'b')
hold on
plot(x,p,'g')

scatter(xi, fi, 'r')