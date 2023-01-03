clear;          clc;            close;
syms x
A=5.000;

Funcion= A*1/x;           
x=0.1;                             
fplot(Funcion)
grid on
hold on

d=diff(Funcion);               
d=inline(d,'x');
Funcion=inline(Funcion);
ErrorAbs=100;                   
i=0;                            

while i<=3  
    Xi=x-(Funcion(x)/d(x));

    ErrorAbs=abs(((Xi-x)/Xi)*100);
    x=Xi;
    i=i+1;
end

fprintf('\nLa raiz aproximada es de %.4f, se obtuvo en %d iteraciones, por el metodo de Newton Raphson',x,i-1);
hold on 
plot(Xi,Funcion(Xi),'mo');
pause(2)

es=0.01;   %Error 
j=2;
maxinter=3;     
x(j)=x;    %Punto incial 

x(j+1)=1;
fx(j)=Funcion(x(j));

while (1)
    x(j+1)=x(j)-((Funcion(x(j)))*(x(j-1)-x(j)))/(Funcion(x(j-1))-Funcion(x(j)));
    fx(j+1)=Funcion(x(j+1));
    ea(j+1)=abs((x(j+1)-x(j))/x(j+1))*100;

    if ea(j+1)<=es | j==maxinter
        break
    end

    j=j+1;
end

fprintf('\nLa raiz aproximada es de %.4f, se obtuvo por el metodo de Secante',x)
hold on 
plot(x,fx(j+1),'bo');
