%  ---RECOPILACIÓN EXPRESIONES PARA ANÁLISIS DE MÉTODOS NUMÉRICOS---

%  ORDEN DE CONVERGENCIA DE MÉTODOS PARA HALLAR RAICES

f = @(x) x.^2-x; %escoger funcion y raiz conocida adecuada
df = @(x) 2*x-1;
x_est=1;

er=abs(xn-x_est); %(cuidado xn definido antes)

%en bucle
er = [er abs(xn-x_est)];
%tras bucle
i=size(er,2);
p = log(er(i)/er(i-1))/log(er(i-1)/er(i-2)) %(puede fallar si es muy buena estimacion)

