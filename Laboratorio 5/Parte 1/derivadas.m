clc #Limpia todo el texto de la ventana de comando
clear all #Limpia todas las variables antes de entrar al programa.

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;

ok = false;#variables de salida del ciclo
while (~ok) #ciclo lectura
  try
    fun = input("Ingrese la funcion f(x)= ","s");#lee la funcion
    f = inline(fun,'x');#crea la funcion 
    ok = true;#variable de salida del ciclo
  catch
    printf("Favor ingresar una funcion apropiada \n"); # Mensaje de error
  end_try_catch
endwhile

ok = false;#variable de salida del ciclo
while (~ok) #ciclo lectura
  try
    grado=input('Ingrese el grado del polinomio ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true; #varible de salida del cilco
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

ok = false; #variable de salida del ciclo
while (~ok)
  try
    t0=input('Ingrese el valor X del primer nodo. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true; #variable de salida del ciclo
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false; #variable de salida del ciclo
while (~ok) #inicia ciclo
  try
    printf("1. Formula de diferencias progresivas. \n2. Formula de diferencias regresivas \n3.  Formula de diferencias centradas \n"); #mensaje
    fd=input('Ingrese la formula de derivación que desea usar. ');#La variable 'fd' representa el valor de la formula que usará el programa.
    ok = true; #varibale de salida del ciclo
    if fd ~= 1 && fd ~= 2 && fd ~= 3 #verifica que sea una opcion valida
      ok = false;
      printf("Recuerde que debe ingresar un número entre 1 y 3.\n"); #mensaje de error
    endif # fin ciclo
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
  
endwhile

ok = false; # variable de salida del ciclo
while (~ok) #inicio del ciclo
  try
    distancia=input('Ingrese la distancia x entre los puntos 10^-x. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true; # varible de salida 
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

x=[]; #arreglo de los x

switch (fd) #crea de acuerdo a la opcion el arreglo de 
  case 1 #case progresivas 
     x(1) = t0 ; #valor inicial
     y(1) = f(x(1));#valor inicial y
     for i = 2:grado #for demas datos
        x(i) = x(i-1) + 10^(-distancia); #asigna en x, suma por que es progresivas
        y(i) = f(x(i));#asigna en y
     endfor
      
    
case 2 #regresivas
     x(1) = t0 ; #valor inicial x
     y(1) = f(x(1)); #valor inicial y
   for i = 2:grado #for demas
        x(i) =  x(i-1) - 10^(-distancia);# asigna en x, resta por que en regresivas
        y(i) = f(x(i)); #asigna en y
    endfor
   
    
  case 3# centradas
      x(1) = t0 ; #valor inical x
      y(1) = f(x(1)); #valor inicial y
      x(2) = x(1) - 10^(-distancia); #valor inical regresivo en x
      y(2) = f(x(2));#valor inical regresivo en y
      for i = 3:grado #for para asignar
        if mod(i,2) == 1  #if para progresivas
          x(i) =  x(i-2) + 10^(-distancia); #se suma por progresivas
          y(i) = f(x(i));#Las coordenadas y se igualan al coseno de las x
        else #para regresivas
           x(i) = x(i-2) - 10^(-distancia);#se resta por regresivas
          y(i) = f(x(i));#Las coordenadas y se igualan al coseno de las x
        endif
      endfor
    
endswitch

a=zeros(5);#incializa la matriz de coeficientes

for i=1:grado #se llena
  a(i,1)=y(i); #asignacion
endfor



for i = 2:grado #Este for es para hallar los coeficientes
  for j = 2:i #for para coeficientes, llena la matriz
   a(i,j)= (a(i,j-1) - a(i-1,j-1) ); #/(x(i) - x(i-j+1)); #
  endfor
 
endfor

poli="";
poli= num2str (a(1,1)); #inicia el polinomio
for i=2:grado
   if a(i,i)<0 #if para poner signo - en la ecuacion
     poli =  strcat(poli ,  num2str (a(i,i)), " * ["); #llena ecuacion
   else # pone el signo +
     poli =  strcat( poli , " + ",num2str (a(i,i)), " * ["); #llena ecucion
   endif
  #sumatoria
      for j=1:i #inicia sumatoria
          #productoria 
            for k=1:i #para todos los k menor q i
              if j!=k #para cumplir condicion de formula
              poli =  strcat(poli," ( x - ", num2str(x(k)) , " ) *");#llena ecuacion
              endif
            endfor# fin productoria
       poli = strtrunc (poli, length(poli)-2); #quita el ulimo *
       poli =  strcat(poli," + "); #agrega un + 
      endfor
      poli = strtrunc (poli, length(poli)-2); #quita el ultimo + no necesario
      poli =  strcat(poli," ] "); #pone el ultimo ]
  endfor

