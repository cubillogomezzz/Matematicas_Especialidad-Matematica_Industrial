% --- Interpolación de Splines cubicos naturales mediante resolución de
% sistema con barra invertida --- 

f = @(x) sin(pi*x);

xi = [0 0.25 0.5 0.75 1];
fi = f(xi);

n = length(xi)-1;
hi = xi(2:end)-xi(1:end-1); %forma interesante hacer vectores

%A = sparse(n-1,n-1); %ceros pero solo se almacenan no nulos, eficiente.
%declaracion innecesaria pues se modifica despues. Util para conocer
%sparse()
%vect_b = zeros(n-1,1);

A = diag(hi(2:n-1),1) + diag(hi(2:n-1),-1) + diag(2*(hi(1:n-1)+hi(2:n)),0) ; %para poner diagonales por encima, o debajo de principal

A = sparse(A)/3 ;

vect_b = (fi(3:n+1)-fi(2:n))./hi(2:n) - (fi(2:n)-fi(1:n-1))./hi(1:n-1); 

ai = fi(1:n)';

ci = A\vect_b';

ci = [0; ci; 0]; %meter los c que conociamos antes, ; pues es columna


di = (ci(2:n+1)-ci(1:n))./(3*hi') ; %cuidado transposición
bi = (fi(2:n+1)'-ai-ci(1:n).*hi'.^2-di.*hi'.^3)./hi'; %de 2) sacamos


for i=1:n

    x = xi(i):0.01:xi(i+1);
    plot(x,f(x),'b')
    hold on 
    plot(x,ai(i)+bi(i).*(x-xi(i))+ci(i).*(x-xi(i)).^2+di(i).*(x-xi(i)).^3 ,'g')

end
