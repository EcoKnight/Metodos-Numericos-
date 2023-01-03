close;
clear all;
clc;

disp("Este programa calcula el IMC")

promt='Introduce tu peso en kg:  ';
peso=input(promt);
promt='Introduce tu estatura en m:  ';
altura=input(promt);

imc=peso/(altura.*altura);

if (imc<18.5)
    fprintf("\nTu IMC es de %.f, por lo tanto es bajo\n", imc)
elseif (imc>=18.5 && imc<=24.9)
    fprintf("\nTu IMC es de %.f, por lo tanto es normal\n", imc)
elseif (imc>=25 && imc<=29.9)
    fprintf("\nTu IMC es de %.f, por lo tanto tienes sobrepeso\n", imc)
elseif (imc>=30 && imc<=34.9)
    fprintf("\nTu IMC es de %.f, por lo tanto es Obesidad grado I\n", imc)
elseif (imc>=35 && imc<=39.9)
    fprintf("\nTu IMC es de %.f, por lo tanto es Obesidad grado II\n", imc)
elseif (imc>=40)
    fprintf("\nTu IMC es de %.f, por lo tanto es Obesidad grado III\n", imc)
end

disp("Gracias por usar el programa")

