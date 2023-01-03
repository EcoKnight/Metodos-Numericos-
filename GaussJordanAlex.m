% Metodo de Gauss     
%Programa para resolver matriz mxn por Gauss
close;
clear;
clc;

%Cosas que pueden cambair: Variables m y n, tambein la leyenda de los disp
% y de los input
disp("Programa para solucionar matrices por Gauss-Jordan")
m=input('Ingrese el numero de ecuaciones: '); 
n=input('Ingrese el numero de variables: '); 

%Cosas que pueden cambair: Cambiar nombre de la funcion GausS tambien las
%varibles de control, i y J
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
%Se manda a llamar la funcion GaussJordan 
GaussJordan(B)


function [X]=GaussJordan(B)
[m,n] = size(B);   %Se reciben los valores del tamaño B

    for k=1:m
        for j = m+1:-1:k
          B(k,j)=B(k,j)/B(k,k);
        end

        for i=1:m
              if i~=k
                    for j=m+1:-1:k
                      B(i,j)=B(i,j)-B(i,k)*B(k,j)
                    end
              end
        end
    end
%Se imprimen los valores al final de las X´s
    for i=1:m
        X(i)=B(i,m+1);
    end
end
