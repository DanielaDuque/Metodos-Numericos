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
      printf("Error, dimension incorrecta de tamaño %d, favor ingresar unicamente valores [a b]\n" , columns);
    elseif (rows != 1)
     printf("Error, se necesita un solo intervalo [a b], favor no agregar mas.\n");
    else
      ok = true;
    endif
  catch
    printf("Por favor, inqrese un intervalor valido de la forma [a b]\n\n");
  end_try_catch
endwhile

a = interval(1)
b = interval(2)

%alpha = p(x0)+q(x0)+r(x0)
%beta = p(x1)+q(x1)+r(x1)

ok = false;
while (~ok)
  try
    alpha = input('Inqrese el intervalo x(0)=')
    ok = true;
  catch
    printf("Por favor, inqrese un intervalor valido de la forma [a b]\n\n");
  end_try_catch
endwhile

ok = false;
while (~ok)
  try
    beta = input('Inqrese el intervalo x(4)=')
    ok = true;
  catch
    printf("Por favor, inqrese un intervalor valido de la forma [a b]\n\n");
  end_try_catch
endwhile

ok = false;
while (~ok)
  try
    M = input('Inqrese el intervalo M=')
    ok = true;
  catch
    printf("Por favor, inqrese un intervalor valido de la forma [a b]\n\n");
  end_try_catch
endwhile


linsht("F1","F2",a,b,alpha,beta,M)

