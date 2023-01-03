clear;          clc;            close;
disp('Método de la Secante')
 
es=0.01;   %Error 
A=5.000;
C=0.6;
Funcion=@(x) A-1/C;  %Funcion
j=2;
maxinter=3;     
x(j)=0.5;    %Punto incial 

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


tabla=(0:j)';
tabla(:,2)=x';
tabla(:,3)=ea';
tabla(:,4)=fx';
disp(tabla)
