%Programa que genera el histograma de frecuencias de un vector de edades

clear;
close;
clc;

%Cambiar nombre y leyendas
Tam=input("Ingrese el numero de sujetos encuestados: ");
EMax=input("Ingrese el valor de la edad maxima: ");
Emin=input("Ingrese el valor de la edad maxima: ");
Tamint=input("Ingrese el tamaño del intervalo: ");

%solicita las edades
for j=1:Tam
       fprintf('Edad para el lugar Edades [%d]: ',j); 
       V_edades(j)= input ('  ');
end


vector_limites=Tamint:Tamint:EMax;
vector_frecuencias=zeros(1,length(vector_limites));

%length indica el tamaño de la varibale 
for i=1:length(V_edades)
  for j=1:length(vector_limites)
       if V_edades(i)<=vector_limites(j)
            vector_frecuencias(j)=vector_frecuencias(j)+1;
            break
       end


  end
    
    
end
%Dispara la grafica de barras, cambair el ylabel y xlabel
bar(vector_limites, vector_frecuencias)
ylabel("Limite de edades")
xlabel("Edades")