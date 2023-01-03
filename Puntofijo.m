%METODO DE PUNTO FIJO 
clear;          clc;            close;
fprintf('\t\tMETODO PUNTO FIJO\n');

syms x
Xo=input('Ingrese el valor inicial: ');
Iter=input('\nIngrese el número de iteraciones: ');
Tol=input('\nIngrese la tolerancia que desea: ');
Fun=input('\nIngrese la funcion: ');
G=input('\nI ngrese la funcion despejada: ');

f=Fun;
g=G;
Yn=subs(f,Xo);
Error=Tol+1;
Cont=0;
Z1=[Cont,Xo,Yn,Error];
Z=[Cont,Xo,Yn,Error];

while Yn~=0 & Error>Tol & Cont<Iter 
    Xn=subs(g,Xo); 
    Yn=subs(f,Xn); 
    Error=abs((Xn-Xo)/Xn);
    %Error=abs(Xn-X0);
    Cont=Cont+1; 
    Z(Cont,1)=Cont; 
    Z(Cont,2)=Xn; 
    Z(Cont,3)=Yn; 
    Z(Cont,4)=Error; 
    Xo=Xn; 
end

if Yn==0
    fprintf('\n\nSOLUCION:\n')
    fprintf('%g es raiz\n\n',Xo);
else
    if Error<Tol
        fprintf('\n\nSOLUCION:\n')
        fprintf('%g Es una aproximacion con un tolerancia de %g\n\n',Xo,Tol);
    else
        fprintf('\n\nSOLUCION:\n')   
        fprintf('Fracaso en %g iteraciones\n\n',Iter);
    end
end

fprintf('TABLA\n\n Cont                   Xn                    Yn                 Error Relativo\n\n')
disp(Z1);
disp(Z);

fplot(f);
grid on
hold on
plot(Xn,Yn);
