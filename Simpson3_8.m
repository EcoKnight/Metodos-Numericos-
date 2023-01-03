clear;      close;      clc;

f= @(x)exp(-x^2)+x;
a=-0.5;        b=0.5;        n=6;        h=(b-a)/n;
so=0;       sm3=0;

for k=1:1:n-1
    x(k)=a+k*h;
    y(k)=f(x(k));
    if rem(k,3)==0
       sm3=sm3+y(k);
     else
     so=so+y(k);
    end
end

answer=(3*h/8)*(f(a)+f(b)+3*so+2*sm3);
fprintf('\n El valor de la integral es de: %f',answer);
