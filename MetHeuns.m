clear;      close;      clc;

f = @(x,y) -1/(exp(3*x));                   %dy/dt=f(t,y)
yO=1;                                   
h=0.25;                               


tspan=[0 pi];
[t2,y2] = RK2M(f,tspan,yO,h);

function[t,y] = RK2M(f,tspan,yO,h)

    a= tspan(1); 
    b=tspan(2); 
    n=(b-a)/h ;
    t=a+h:h:b;
    
    k1=f(a,yO);
    k2=f(a+h,yO+k1*h);
    y(1) =yO+(h/2)*(k1+k2);
    
    for i = 1:(length(t)-1)
        k1=f(t(i),y(i));
        k2=f(t(i)+h,y(i)+k1*h);
        y(i+1) =y(i)+(h/2)*(k1+k2);
    end

    t = [a t]; 
    y = [yO y];
    disp('RungeKutta de 2do orden');    disp('   Step           t               y');
    k = 1:length(t); 
    out= [k ; t; y] ;
    fprintf('%5d %15.4f %15.4f\n',out)
end

