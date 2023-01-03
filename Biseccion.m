clear;          clc;            close;
    syms x
    Funcion= input ('Introduzca una funcion: ');                          
    ErrorDado=input('Introduzca el error dado: ');   
    Iter=input('Ingrese el número de iteraciones: '); %PF, B
    Vmin=input('Ingrese el limite inferior del intervalo: '); %FP, B y S
    Vmax=input('Ingrese el limite superior del intervalo: '); %FP, B y S
    Et=0;
MetBiseccion (Funcion,ErrorDado,Iter,Vmin,Vmax, Et);
function [] = MetBiseccion (Funcion,ErrorDado,Iter,Vmin,Vmax,Et)
    f=Funcion;
    Yi=subs(f,Vmin);
    Ys=subs(f,Vmax);
    fprintf('\nBiseccion')
    if Yi==0
        fprintf('\n\nSOLUCION:\n')
        fprintf('Xi es raíz\n\n');
    else
    if Ys==0
        fprintf('\n\nSOLUCION:\n')
        fprintf('Xs es raíz\n\n');
    else
        if Yi*Ys<0
            Xm=(Vmin+Vmax)/2;
            Ym=subs(f,Xm);
            Error=ErrorDado+1;
            Cont=1;
             
            while Ym~=0 & Error>ErrorDado & Cont<Iter
                if Yi*Ym<0
                    Vmax=Xm;
                    Ys=Ym;
                else
                    Vmin=Xm;
                    Yi=Ym;
                end
                Xaux=Xm;
                Xm=(Vmin+Vmax)/2;
                Ym=subs(f,Xm);
                Error=abs(Xm-Xaux);
                Cont=Cont+1;
                Et=abs(Error/Xm);
tabla(Cont,1)=Cont-1;
tabla(Cont,2)=Xm;
tabla(Cont,3)=Error;
tabla(Cont,4)=Et;
            end
            if Ym==0
                fprintf('\n\nSOLUCION:\n')
                fprintf('%g es raíz\n\n',Xm);
            else
                if Error<ErrorDado
                    fprintf('\nLa raiz aproximada es de %.10f por el metodo de Biseccion, se obtuvo en %d iteraciones',Xm,Cont)
                else
                fprintf('\nFracaso en %g iteraciones\n',Iter);
                end
             end
         
        else
            fprintf('\nEl intervalo es inadecuado para el metodo de Biseccion\n');
            end
        end
    end
    figure (4)
    ezplot(f);
    grid on

tabla(Cont,1)=Cont;
tabla(Cont,2)=Xm;
tabla(Cont,3)=Error;
tabla(Cont,4)=Et
end