clear;          clc;            close;   
    syms x
    Funcion= input ('Introduzca una funcion: ');           
    Paprox=input ('Introduzca el punto de aproximacion: ');                   
    ErrorDado=input('Introduzca el error dado: ');   
    Iter=input('Ingrese el número de iteraciones: '); 
    Vmin=input('Ingrese el limite inferior del intervalo: '); 
    Vmax=input('Ingrese el limite superior del intervalo: '); 

    fxi=subs(Funcion,Vmin);
    fxf=subs(Funcion,Vmax);
   
    if fxi*fxf>0
        error('no es recomendao usar falsa posicion');
    end
    i=1;
    while i<Iter
    
    fxi=subs(Funcion,Vmin);
    fxf=subs(Funcion,Vmax);
    xr=Vmax-(fxf*(Vmax-Vmin))/(fxf-fxi);
    fxr=subs(Funcion,xr);
    
        if abs(fxr)<ErrorDado
            fprintf('La iteración %d, xr=%.10f y fxr=%.10f',i,xr,fxr);
            return;
        end
        
        if fxr>0
            Vmin=xr;
        else
            Vmax=xr;
        end
    i=i+1;
    end
