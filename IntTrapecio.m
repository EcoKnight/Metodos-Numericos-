clear;      close;      clc;

f = @(x) x.*cos(x.^3);   
A=0;
B=1;
n=5;
renglon=1;

for n=2:80
    [I,h] = IntegralTrapecio(A,B,n,f);
    Tabla(renglon,1)=n;                 %No. de intervalos
    Tabla(renglon,2)=h;                 %Valor de h, formula
    Tabla(renglon,3)=I;                 %Valor de la integral
    renglon=renglon+1;
end
disp(Tabla)

function [I,h]= IntegralTrapecio(A,B,n,f)
    h = (B-A)/n;
    x = linspace (A,B,n+1);
    I = (h*(f(x(1))+f(x(end))+2*sum(f(x(2:end-1)))))/2;
end

