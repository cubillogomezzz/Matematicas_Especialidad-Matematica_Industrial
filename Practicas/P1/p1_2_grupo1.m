r1 = 25.862;
r2 = 22.651;
r3 = 27.326;

%sistema de ecuaciones
f1 = @(X) (X(1)-28)^2 + X(2)^2 + X(3)^2 - r1^2;
f2 = @(X) X(1)^2 + (X(2)-28)^2 + X(3)^2 - r2^2;
f3 = @(X) X(1)^2 + X(2)^2 + (X(3)-28)^2 - r3^2;

F = @(X) [f1(X); f2(X); f3(X)];
JF = @(X) [2*(X(1)-28) 2*X(2) 2*X(3); 2*X(1) 2*(X(2)-28) 2*X(3); 2*X(1) 2*X(2) 2*(X(3)-28)];

N = 1000;
delta = 1e-10;

%elegimos el origen de coordenadas como valor inicial porque la distancia a
%los tres satélites es parecida y cercana a 28 mil kilometros
Xn = [0; 0; 0];

for i=1:N
    Xn_ant = Xn;
    Xn = Xn - JF(Xn)\F(Xn);
    if norm(Xn-Xn_ant)/norm(Xn)<delta
        break;
    end
end

%apartado d) 
cota = (norm(Xn) - 6.371) * 1e6 %en metros sobre el nivel del mar
