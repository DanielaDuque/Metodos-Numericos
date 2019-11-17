clc #Limpia todo el texto de la ventana de comando
clear all #Limpia todas las variables antes de entrar al programa.

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;

ok = false;
while (~ok)
  try
    fun = input("Ingrese la funcion f(x)= ","s");
    f = inline(fun,'x');#crea la funcion
    ok = true;
  catch
    printf("Favor ingresar una funcion apropiada \n");
  end_try_catch
endwhile

ok = false;
while (~ok)
  try
    grado=input('Ingrese el grado del polinomio ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true;
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

ok = false;
while (~ok)
  try
    t0=input('Ingrese el valor X del primer nodo. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true;
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;
while (~ok)
  try
    printf("1. Formula de diferencias progresivas. \n2. Formula de diferencias regresivas \n3.  Formula de diferencias centradas \n");
    fd=input('Ingrese la formula de derivación que desea usar. ');#La variable 'fd' representa el valor de la formula que usará el programa.
    ok = true;
    if fd ~= 1 && fd ~= 2 && fd ~= 3
      ok = false;
      printf("Recuerde que debe ingresar un número entre 1 y 3.\n");
    endif
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
  
endwhile

ok = false;
while (~ok)
  try
    distancia=input('Ingrese la distancia x entre los puntos 10^-x. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true;
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

x=[];

switch (fd)
  case 1 
     x(1) = t0 ;
     y(1) = f(x(1));
     for i = 2:grado
        x(i) = x(i-1) + 10^(-distancia);
        y(i) = f(x(i));
     endfor
      
    
case 2
     x(1) = t0 ;
     y(1) = f(x(1));
   for i = 2:grado
        x(i) =  x(i-1) - 10^(-distancia);
        y(i) = f(x(i));
    endfor
   
    
  case 3
      x(1) = t0 ;
      y(1) = f(x(1));
      x(2) = x(1) - 10^(-distancia);
      y(2) = f(x(2));
      for i = 3:grado
        if mod(i,2) == 1
          x(i) =  x(i-2) + 10^(-distancia);
          y(i) = f(x(i));#Las coordenadas y se igualan al coseno de las x
        else
           x(i) = x(i-2) - 10^(-distancia);
          y(i) = f(x(i));#Las coordenadas y se igualan al coseno de las x
        endif
      endfor
    
endswitch

a=zeros(5);

for i=1:grado
  a(i,1)=y(i);
endfor



for i = 2:grado #Este for es para hallar los coeficientes
  for j = 2:i
   a(i,j)= (a(i,j-1) - a(i-1,j-1) ); #/(x(i) - x(i-j+1)); #
  endfor
 
endfor

poli="";
poli= num2str (a(1,1));
for i=2:grado
   if a(i,i)<0
     poli =  strcat(poli ,  num2str (a(i,i)), " * [");
   else
     poli =  strcat( poli , " + ",num2str (a(i,i)), " * [");
   endif
  #sumatoria
      for j=1:i
   #multiplicativo 
            for k=1:i
              if j!=k
              poli =  strcat(poli," ( x - ", num2str(x(k)) , " ) *");
              endif
            endfor
       poli = strtrunc (poli, length(poli)-2);
       poli =  strcat(poli," + ");
      endfor
      poli = strtrunc (poli, length(poli)-2);
      poli =  strcat(poli," ] ");
  endfor

