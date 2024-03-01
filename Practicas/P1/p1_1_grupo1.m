x = linspace(0,pi,31);

epsilon = 0.9;

%la derivada no depende de los valores de x
df = @(y) 1 - epsilon * cos(y);

N = 1000;
delta = 1e-10;

%elegimos el valor inicial y=0 porque es solucion trivial cuando x=0
yn = 0;
y_vect = [];

for j=1:31
    f = @(y) y - epsilon * sin(y) - x(j);
    for i=1:N
        yn_ant = yn;
        yn = yn - f(yn)/df(yn);
        if abs(yn-yn_ant)/abs(yn)<delta
            break;
        end
    end
    y_vect = [y_vect yn];
end

tabla = [x' y_vect']
plot(x,y_vect)