% Metodo de Gauss     
%Programa para resolver matriz mxn por Gauss
close;
clear;
clc;

%Cosas que pueden cambair: Variables m y n, tambein la leyenda de los disp
% y de los input
disp("Programa para solucionar matrices por Gauss")
m=input('Ingrese el numero de ecuaciones: '); 
n=input('Ingrese el numero de variables: '); 
GausS(m,n);

%Cosas que pueden cambair: Cambiar nombre de la funcion GausS tambien las
%varibles de control, i y J
function [] = GausS(m,n)
    for i=1:m 
      for j=1:n 
           fprintf('El elemento A[%d,%d]: ',i,j); 
           A(i,j)= input ('  ');
      end 
    end 
    A 
    
    %En seguida se agregan los resultados de las ecuaciones
    for j=1:m
        fprintf('Agregue la columna de resultados R[%d]: ',j)
        R(j)= input('  ');
        %Cosas que pueden cambair: Nombre del vector R, pero para la matriz
        %extendida es muy importante dejar el ' a la variable nueva
    end
    
    %Matriz Extendida
    B=[A R']  %Si le cambias el nombre a la varible deja el ' 
    disp("...Presione Enter para continuar...")
    %Para quitar el "Presione Enter..." borrar el pause
    pause
    
    %Gauss
    for i=1:m
      B(i,:)=B(i,:)/B(i,i); 
        for j=i+1:m 
            B(j,:)=B(j,:)-B(i,:)*B(j,i); 
            j=j+1; 
            B 
        end 
      i=i+1 %Para no mostrar el procedimineto poner un ; al final de i+1
      B 
    end

    for i=m:-1:2 
      for j=i-1:-1:1 
        B(j,:)=B(j,:)-B(i,:)*B(j,i); 
        j=j-1; 
        B 
         pause(2) 
      end 
      i=i-1 %Para no mostrar el procedimineto poner un ; al final de i-1
      B 
    end 
    
    %Disparar las variables
    for i=1:m
       for j=n+1
           fprintf('\nLa variable X[%.2f] es:\t',i) %Puedes quitar el %.2f 
           B(i,j)
       end
    end
end