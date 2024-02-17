f = @(x) ;

a = ;
b = ;

an = a;
bn = b;

delta = 1e-6; %error absoluto valor real y estimacion
n = ceil(log2((b-a)/delta)); 

for i = 1:n
    xn = (an+bn)*0.5;
    if f(xn) == 0
        break;             
    elseif f(an)*f(xn) < 0
        bn = xn;
    else
        an = xn;
    end
    xn = (an+bn)*0.5;
end

xn