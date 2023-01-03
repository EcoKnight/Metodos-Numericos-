syms y t
disp('Metodo de Heun Mejorado')
f=input('Ingrese ED dy/dt: ');
intervalo=input('Ingrese intervalo [a,b]: ');
y0=input('Ingrese el valor inicial: ');
F=input('Ingrese la solucion de la ED: ');
h=input('Ingrese el valor de h: ');
a=intervalo(1);
b=intervalo(2);
n=int16((b-a)/h);
T=[a:h:b];
Y(1)=y0;
fprintf('ti\t\t\t\t\t  ||  k1\t\t\t\t\t  ||   k2\t\t\t\t\t  Yi\t\t\t ||F(ti)\t\t  || error\n');
fprintf('%.15f\t  || %.9f\t  || %.9f\t   || %.15f\t  || %.15f\t  || %e\n', T(1),0,0,double(Y(1)),double(Y(1)),0);
for i=1:n
    k1=subs(f,{t,y},{T(i),Y(i)});
    k2=subs(f,{t,y},{T(i)+((2/3)*h),Y(i)+((2/3)*h)*k1});
    Y(i+1)=Y(i)+(h/4)*(k1+3*k2);
    exacta=subs(F,T(i+1));
    error=abs(exacta-Y(i+1));
    fprintf('%.15f\t  || %.9f\t  || %.9f\t   || %.15f\t   || %.15f\t  || %e\n',T(i+1),double(k1),double(k2),double(Y(i+1)),double(exacta),double(error));
    
end
fprintf('Valor aproximado y(%.15f)=%.15f \n',b,double(Y(n+1)));
fprintf('Valor exacto F(%.15f)=%.15f \n',b,double(exacta));
fprintf('Error= %e \n',double(error))