clear;      close;      clc;
disp('Metodo Simpson 1/3');
syms x

f=input('Ingrese su funcion: ');
a=input('Ingrese su limite inferior: ');
b=input('Ingrese su limite superior: ');
c=(a+b)/2;

Iaprox= (b-a)*(subs(f,a)+4*subs(f,c)+subs(f,b))/6;
fprintf('El valor aproximado es de: %.5f',Iaprox);

fplot(f)
grid on

