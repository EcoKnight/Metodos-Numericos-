clear;          clc;            close;
disp('Método de Newton Raphson')

%Damos de alta la variable simbólica X
syms C
A=5.000;

Funcion= A*1/C;           
C=0.1                
ErorDado=0.01;                 
fplot(Funcion)
grid on
hold on

d=diff(Funcion);               
d=inline(d,'x');
Funcion=inline(Funcion);
ErrorAbs=100;                   
j=0;                            

while ErrorAbs>ErorDado  
    Xi=C-(Funcion(C)/d(C));

    ErrorAbs=abs(((Xi-C)/Xi)*100);
    C=Xi;
    j=j+1;
end


fprintf('\nLa raiz aproximada es de %.4f y se obtuvo en %d iteraciones',C,j)
plot(Xi,Funcion(Xi),'mo')