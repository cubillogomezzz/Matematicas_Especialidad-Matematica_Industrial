% --- Interpolación de Splines cubicos fijos mediante resolución de
% sistema con barra invertida --- 

f = @(x) sin(pi*x);

xi = [0 0.5 1];
fi = f(xi);
df0 = pi;
dfn = -pi;


n = length(xi)-1;
hi = xi(2:end)-xi(1:end-1); %forma interesante hacer vectores

 %ceros pero solo se almacenan no nulos, eficiente.
%declaracion innecesaria pues se modifica despues. Util para conocer
%sparse()
%vect_b = zeros(n-1,1);

A =diag([2*hi(1) 2*(hi(1:n-1)+hi(2:n)) 2*hi(n)],0) +  diag(hi(1:n),1) + diag(hi(1:n),-1) ;
%para poner diagonales por encima, o debajo de principal
A = sparse(A)/3 ;


vect_b = [(fi(2)-fi(1))/hi(1)-df0 (fi(3:n+1)-fi(2:n))./hi(2:n) - (fi(2:n)-fi(1:n-1))./hi(1:n-1) dfn-(fi(n+1)-fi(n))/(hi(n))]; 

ai = fi(1:n);


ci = A\vect_b'; %meter los c que conociamos antes, ; pues es columna


ci = ci';


di = (ci(2:n+1)-ci(1:n))./(3*hi) ; %cuidado transposición

bi = (fi(2:n+1)-ai-ci(1:n).*hi.^2-di.*hi.^3)./hi; %de 2) sacamos

for i=1:n

    x = xi(i):0.01:xi(i+1);
    plot(x,f(x),'b')
    hold on 
    plot(x,ai(i)+bi(i).*(x-xi(i))+ci(i).*(x-xi(i)).^2+di(i).*(x-xi(i)).^3 ,'g')

end
