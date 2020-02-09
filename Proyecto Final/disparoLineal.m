clc #Limpia todo el texto de la ventana de comando
clear all #Limpia todas las variables antes de entrar al programa.

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;
while (~ok)
  try
    fun=input("Ingrese la funcion p. ","s");#La variable 't0' representa el valor de la coordenada x del primer nodo.
    p=inline(fun,'x'); #Crea la funcion.
    ok = true;
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;
while (~ok)
  try
    fun=input("Ingrese la funcion q. ","s");#La variable 't0' representa el valor de la coordenada x del primer nodo.
    q=inline(fun,'x'); #Crea la funcion.
    ok=true;
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;
while (~ok)
  try
    fun=input("Ingrese la funcion r. ","s");#La variable 't0' representa el valor de la coordenada x del primer nodo.
    r=inline(fun,'x'); #Crea la funcion.
    ok=true;
  catch
    printf("Por favor, ingrese un numero válido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

# ingresar intervalo
ok = false;
while (~ok)
  try
    interval = input('Inqrese el intervalo [a b] : ');
    rows = size(interval)(1);
    columns = size(interval)(2);
    if (columns != 2)
      printf("Error, dimension incorrecta de tamaño %d, favor ingresar unicamente valores [a b]\n" , columns); %mensaje de error a colocar mal el intervalo
    elseif (rows != 1)
     printf("Error, se necesita un solo intervalo [a b], favor no agregar mas.\n"); %mensaje de error a colocar mal el intervalo
    else
      ok = true; % intervlo ingresado correctamente
    endif
  catch
    printf("Por favor, inqrese un intervalor valido de la forma [a b]\n\n"); %mensaje de error a colocar mal el intervalo
  end_try_catch
endwhile

a = interval(1)
b = interval(2)

%alpha = p(x0)+q(x0)+r(x0)
%beta = p(x1)+q(x1)+r(x1)

ok = false;%para repertir ciclo
while (~ok) %inica ciclo
  try
    alpha = input('Inqrese el intervalo x(0)=') % ingresa el valor alpha
    ok = true; %sale ciclo
  catch
    printf("Por favor, inqrese un valor valido\n\n"); %mensaje error
  end_try_catch
endwhile %fin ciclo

ok = false;%para repetir ciclo
while (~ok) %inicia ciclo
  try
    beta = input('Inqrese el intervalo x(4)=') %ingresa el valor beta
    ok = true; %para salir del ciclo
  catch
    printf("Por favor, inqrese un valor valido\n\n"); %mensaje error
  end_try_catch
endwhile% fin ciclo

ok = false; %para repetir ciclo
while (~ok) % inicio ciclo
  try
    M = input('Inqrese el intervalo M=') %ingresa intervalo
    ok = true;% para salir ciclo
  catch
    printf("Por favor, inqrese un valor valido\n\n");%mensaje de error
  end_try_catch
endwhile%fin ciclo

% Soluciona el ejercicio
L = linsht("F1","F2",a,b,alpha,beta,M);

%imprime la tabla
printf( "%s %20s %20s %15s \n","k" ,"Solucion Metodo", "Solucion exacta", "Error"); %titulos
for i=1:M+1
  printf( "%d %15d %20d %20d \n",L(i,1),L(i,2),L(i,3),L(i,4));%resto de la tabla
endfor

#grafico
#figure
 # hold on#inicia la figura
  
  #title("Disparo Lineal"); #titulo
  #plot (L(:,1), L(:,2),  L(:,1), L(:,3) );#grafica las funcion con linea y los puntos con 'o'
  #xlabel('Eje X');#titulo eje x
  #ylabel('Eje Y');#titulo eje y
  #legend("Funion aproximada","Funcion real");#leyenda del grafico
  
  #hold off #fin figura
  #--- grafica----

