%Runge Kutta 4to orden 
clear;      close;      clc;
disp('Runge Kutta 4to orden ');

h = 0.1;
t = 0;
Q = [0;0];
N = 20;

for i=1:N
    k1 = F(t,Q);
    k2 = F(t+h/2,Q+h/2.*k1);
    k3 = F(t+h/2,Q+h/2.*k2);
    k4 = F(t+h,Q+h.*k3);
    Qnew = Q+(h/6).*(k1+2.*k2+2.*k3+k4);
   
    rk4(i+1) = Qnew(1,1);
    analitica(i)= (-253/65)*cos(11*t)+(121/65)*sin(11*t)-(44/5)*exp(-2*t)+(165/13)*exp(-3*t);
    
    tabla(i,1)=i;
    tabla(i,2)=Q(1,1);
    tabla(i,3)=Q(2,1);
    
    Q = Qnew;
    t = t+h;
end

fprintf("Iteracion      Carga     Corriente\n");        disp(tabla);
plot(rk4,'b--','LineWidth',2);      hold on;
plot(analitica,'r','LineWidth',1);      grid on
title('Corriente en un circuito RCL');      ylabel('Corriente');     xlabel('Tiempo')
legend('Metodo Runge Kutta','Sol. Analitica')

function res = F(t,Q)
    res = [Q(2,1); 550*cos(11*t)-5.*Q(2,1)-6.*Q(1,1)];
end
