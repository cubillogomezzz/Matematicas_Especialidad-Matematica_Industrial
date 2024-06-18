%% Diferenciación numérica con tres puntos para datos no equiespaciados

% xi = [];
% f = @(x) ;
% fi = f(xi)

xi = ; %datos entrada
fi = ;

n = length(xi);

hi = diff(xi);
dfi = 0*xi;

for i=1
dfi(i) = fi(i)*(-2*hi(i)-hi(i+1))/(-hi(i)*(-hi(i)-hi(i+1)))+...
    fi(i+1)*(-hi(i)-hi(i+1))/(-hi(i)*hi(i+1))+...
    fi(i+2)*(-hi(i))/((hi(i)+hi(i+1))*hi(i+1));
end     

for i = 2:n-1
    dfi(i) = fi(i-1)*(-hi(i))/(hi(i-1)*(hi(i-1)+hi(i)))+...
        fi(i)*(hi(i-1)-hi(i))/(-hi(i-1)*hi(i))+...
        fi(i+1)*hi(i-1)/((hi(i-1)+hi(i))*hi(i));
end

for i=n
    dfi(i) = fi(i-2)*hi(i-1)/(-hi(i-2)*(-hi(i-2)-hi(i-1)))+...
    fi(i-1)*(hi(i-1)+hi(i-2))/(-hi(i-2)*hi(i-1))+...
    fi(i)*(2*hi(i-1)+hi(i-2))/((hi(i-1)+hi(i-2))*hi(i-1));
end   


