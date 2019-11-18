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
ok = false; # variable de salida del ciclo
while (~ok) #inicio del ciclo
  try
    distancia=input('Ingrese la distancia x entre los puntos 10^-x. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true; # varible de salida 
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

ok = false;#variable de salida del ciclo
while (~ok) #ciclo lectura
  try
    t0=input('Ingrese el valor a calcular ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true; #varible de salida del cilco
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile


#utilizamos diferencias regresivas
    x(1) = t0 ; #valor inicial x
     y(1) = f(x(1)); #valor inicial y
   for i = 2:5 #for demas
        x(i) =  x(i-1) - 10^(-distancia);# asigna en x, resta por que en regresivas
        y(i) = f(x(i)); #asigna en y
    endfor

  fun3 = (3*f(x(1)) - 4* f(x(2)) +f(x(3)) )/(2*(10^(-distancia))); #usanmos la formula 
  
 #utilizamos diferencias centradas
    x(1) = t0 + 2* 10^(-distancia)'; #valor inicial x para diferencias centradas
     y(1) = f(x(1)); #valor inicial y
   for i = 2:5 #for demas
        x(i) =  x(i-1) - 10^(-distancia);# asigna en x, resta por que en regresivas
        y(i) = f(x(i)); #asigna en y
    endfor 
 fun5 = (-f(x(1)) +8 *f(x(2)) -8* f(x(4))+ f(x(5))  )/(12*(10^(-distancia)));# usamos la formula
 
  printf ("Su resultado con 3 nodos es  %d \n",fun3); #imprimimos con 3 nodos
  printf("Su resultado con 5 nodos es  %d \n",fun5); #imprimimos con 5 nodos
