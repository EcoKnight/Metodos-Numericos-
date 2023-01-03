close;      clear;      clc;
% A = matriz cuadrada de coeficientes del sistema de ecuaciones.
A=[-8 3 9 -2; -2 3 4 3;1 -10 5 -7;6 7 5 4];
%A=[1 2 1; -1 3 -2; 3 4 -7]; 
% B = Vector columna de resul tados de cada ecuación.
B=[-70;50;-50;70]; 
%B=[8; 1; 10];
C=[A B] 
DescompLU(A,B);

function [L,U,x] = DescompLU(A,B)
% VARIABLES DE SALIDA:

% L = Matriz factorizada inferior de A
% U = Matriz factorizada superior de A
% x = vector con los valore para todas las variables del sistema de
% ecuaciones.

%~~~~~~~~~~~~~~~Protección contra errores en las entradas~~~~~~~~~~~~~~~~~%
    if nargin ~= 2                 
        error('Se debe ingresar una matriz cuadrada A y un vector columna B');
    %Si se ingresan todos los datos de entrada, elegir un método de solución
    else                          
        if size(A,1) ~= size(A,2)
            error('Se necesita que la matriz A sea cuadrada')
        elseif size(B,2) ~= 1
            error('B debe ser un vector columna');
        elseif size(A,1) ~= size(B,1)
            error('El número de filas de A no coincide con el de B. Sistema inconsistente');
        end
    end
    
    disp(newline);
    if prod(diag(A)) == 0
        error('El determinante de la matriz A es cero, no se puede resolver');
    end
    
    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Pivoteo parcial~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
    n = size(A,1); 
    for k = 1:n
        if A(k,k) ~= max(abs(A(:,k)))
            [filapivote,~] = find(abs(A) == max(abs(A(:,k))));
            A([k,filapivote(1)],:) = A([filapivote(1),k],:);
            B([k,filapivote(1)]) = B([filapivote(1),k]);
        end
    end
    
    %~~~~~~~~~~~~~~~~~~~~~~Eliminación hacia adelante~~~~~~~~~~~~~~~~~~~~~~~~~%
    U = A;
    D = B;
    L = eye(n);
    for k = 1:n - 1
        for i = k + 1:n
            factor = U(i,k)/U(k,k);
            L(i,k) = factor;
            U(i,:) = U(i,:) - factor*U(k,:);
            D(i) = D(i) - factor*D(k);
        end
    end
    
    %~~~~~~~~~~~~~~~~~~~~~~~~~Sustitución hacia atrás~~~~~~~~~~~~~~~~~~~~~~~~~%
    
    x(n) = D(n)/U(n,n);
    for i = n - 1:-1:1
        sum = D(i);
        for j = i + 1:n
            sum = sum - U(i,j)*x(j);
        end
        x(i) = sum/U(i,i);
    end
    x = x';
    fprintf('Los resultados son: \n');
    disp(x);
end