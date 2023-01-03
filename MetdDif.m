clear;      close;      clc;

f = @(t,y) 2*y-6;                   %función que define la ecuación diferencial dy/dt=f(t,y)

tspan=[0 pi];                           % Rango de simulación en 0 y pi
yO=1;                                   %Condición inicial
h=0.25;                               %Valor de h

[te,ye] = Eulode(f,tspan,yO,h);
[t4,y4] = RK4M(f,tspan,yO,h);
[tr,yr] = Ralston(f,tspan,yO,h);        %Manda a llamar el método de euler en el rango definido por tspan y las condiciones iniciales yO y h

t_real=0:pi/1000:pi;
y_real=1.5*exp(-t_real)+0.5*sin(t_real)-.5*cos(t_real);         % Solución de la ecuación diferencial

figure, plot(t_real,y_real)
hold on
grid on
plot(te,ye,'m-*');
plot(tr,yr,'r-d');
plot(t4,y4,'g-s');
xlabel('Tiempo');
ylabel('y(t)');
title('y(t)=1.5*exp(-t)+0.5*sin(t)-.5*cos(t)');
legend('Funcion F(t,y)', 'Euler', 'Ralston' ,'RungeKutta de 4 orden')
hold off

function[t,y] = Ralston(f,tspan,yO,h)

    a= tspan(1); 
    b=tspan(2); 
    n=(b-a)/h ;
    t=a+h:h:b;
    
    k1=f(a,yO);
    k2=f(a+3/4*h,yO+3/4*k1*h);
    
    y(1) =yO+(k1/3+2*k2/3)*h;
    
    for i = 1:(length(t)-1)
      k1=f(t(i),y(i));
      k2=f(t(i)+3/4*h,y(i)+3/4*k1*h);
      y(i+1) =y(i)+(k1/3+2*k2/3)*h;
      
    end
    t = [a t]; 
    y = [yO y];
    disp('Ralston')
    disp('   step        t                     y');
    k = 1:length(t); 
    out= [k ; t; y] ;
    fprintf('%5d %15.10f       %15.10f\n',out)
end

function[t,y] = RK4M(f,tspan,yO,h)

    a= tspan(1); 
    b=tspan(2); 
    n=(b-a)/h ;
    t=a+h:h:b;
    
    k1=f(a,yO);
    k2=f(a+1/2*h,yO+1/2*k1*h);
    k3=f(a+1/2*h,yO+1/2*k2*h);
    k4=f(a+h,yO+k3*h);


    y(1) =yO+1/6*(k1+2*k2+2*k3+k4)*h;
    
    for i = 1:(length(t)-1)
        k1=f(t(i),y(i));
        k2=f(t(i)+1/2*h,y(i)+1/2*k1*h);
        k3=f(t(i)+1/2*h,y(i)+1/2*k2*h);
        k4=f(t(i)+h,y(i)+k3*h);

        y(i+1) =y(i)+1/6*(k1+2*k2+2*k3+k4)*h;
  

      
      
    end
    t = [a t]; 
    y = [yO y];
    disp('RungeKutta de 4 orden')
    disp('   step        t                     y');
    k = 1:length(t); 
    out= [k ; t; y] ;
    fprintf('%5d %15.10f       %15.10f\n',out)
end


function[t,y] = Eulode(f,tspan,yO,h)

a= tspan(1); 
b=tspan(2); 
n=(b-a)/h;
t=a+h:h:b;


y(1) =yO+f(a,yO)*h;

for i = 1:(length(t)-1)

  y(i+1) =y(i)+h*f(t(i),y(i));
  
end
t = [a t]; 
y = [yO y];
disp('Euler')
disp('   step        t                     y');
k = 1:length(t); 
out= [k ; t; y] ;
fprintf('%5d %15.10f       %15.10f\n',out)

end