clear;      close;      clc;
disp('Metodo del trapecio')
A= 0;                                  %Limite inferior
B= 5;                                  %Limite superior
f =@(x) exp(-x);                  
g =@(x) -exp(-x)+1;

z = 0:pi/100:2*pi;                       %Es un vector que se usa para graficar

renglon=1;
valor_verdadero=0.993262053;

for n=2:50
    [I,h] = IntegralTrapecio(A,B,n,f);
    Et=abs((valor_verdadero-I)/valor_verdadero*100); 
    Tabla(renglon,1)=n;                 %No. de intervalos
    Tabla(renglon,2)=h;                 %Valor de h, formula
    Tabla(renglon,3)=I;                 %Valor de la integral
    Tabla(renglon,4)=Et;
    renglon=renglon+1;
end

fprintf('El valor de la integral con %i interaciones es de %.5f y con un error del %.5f \n',renglon, I, Et);
%fprintf('Intevalo \tValor de H \tIntegral \tET');
%Tabla(renglon,4)=Et;       %Quitar el % en caso de querer ver la tabla
Garfica1(z,f,g);
Graficas2 (z,f,g);



function []= Garfica1(z,f,g)
    figure (1);
    plot(z,f(z),'r-')
        title('exp(-x) vs -exp(-x)+C');     
        xlabel('Valores de Z');     
        ylabel('Valores de la funcion exp(-x)')
    hold
    plot(z,g(z),'g.')
    legend(' exp(-x)',' -exp(-x)+C')
    

end

function []= Graficas2 (z,f,g)
    %Graficas de la segunda parte
    figure (2)
    x2=0:pi/100:2.5*pi; %Vector para graficar el eje X

    subplot(3,1,1);
    plot(z,f(z),'r-');   
    hold
    plot(z,g(z),'b.')
    plot(x2,0,'k_',"LineWidth",2); %Eje X
    legend(' exp(-x)',' -exp(-x)+C')
    title('Valor de I con 5 interaciones');
    xlabel('Valores de Z')
    ylabel('Valores de la funcion exp(-x)')

    subplot(3,1,2), plot(z,f(z),'r-');   
    hold
    plot(z,g(z),'b.')
    plot(x2,0,'k_',"LineWidth",2); %Eje X
    legend(' exp(-x)',' -exp(-x)+C')
    title('Valor de I con 15 interaciones');
    xlabel('Valores de Z')
    ylabel('Valores de la funcion exp(-x)')

    subplot(3,1,3), plot(z,f(z),'r-');   
    hold
    plot(z,g(z),'b.')
    plot(x2,0,'k_',"LineWidth",2); %Eje X
    legend(' exp(-x)',' -exp(-x)+C')
    title('Valor de I con 35 interaciones');
    xlabel('Valores de Z')
    ylabel('Valores de la funcion exp(-x)')

end

function [I,h]= IntegralTrapecio(a,b,n,f)
    h = (b-a)/n;
    x = linspace (a,b,n+1);
    I = (h*(f(x(1))+f(x(end))+2*sum(f(x(2:end-1)))))/2;
end
