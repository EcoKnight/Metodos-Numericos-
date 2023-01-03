clear all; 
clc;
format shortG

disp('Metodo de Regresion Lineal'); 
n=input('Numero de puntos: ');

for i=1:n 
    x(1,i)=input('dame los valores de x: '); 
end

for i=1:n 
    y(1,i)=input('dame los valores de y: '); 
end

% se nota extraño pero asi se mostraran los resultados
%en forma de Vector. 
x;
y;
hold on 
plot(x,y,'r*')
grid 
xlabel('Los valores de X');
ylabel('Los valores de Y');


a=0; 
for i=1:n 
     a=a+x(i,1)*y(1,i); 
end

b=0; 
for i=1:n 
    b=b+x(i,1)*x(1,i); 
end

c=0; 
  for i=1:n 
      c=c+x(1,i); 
  end

e=0; 
for i=1:n 
    e=e+y(1,i); 
end

d=0; 
   d=c/n; 
     f=0; 
       f=e/n; 
         a1=(n*a-c*e)/(n*b-c*c); 
       a0=f-a1*d;

  disp('Ecuacion con la que se encuentran los nuevos valores de y '); 
fprintf(' y= %.5f + %.5fx',a0,a1);

for i=1:n 
    y(1,i)=a0+a1*x(1,i); 
end
pause
        %Grafica con los Datos Ajustados
  plot(x,y) 
  grid 
  xlabel('x');
  ylabel('y');

  plot(x,y,'r*')
  hold on 
  pause
