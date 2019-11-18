function reglaTrapecio
clear;
clc;


# Se ingresa el intervalo [a b]
ac = true;
while (ac)
  try
    a = input('Inqrese el valor a: '); # Se ingresa el valor de a
    b = input('Inqrese el valor b: '); # Se ingresa el valor de b
    ac = false;
  catch
    printf("Valores inválidos, intente nuevamente\n\n"); # Se ejecuta en caso de ingresar un valor invalido
  end_try_catch
endwhile  


# Se ingresa el numero de intervalos M
ac = true;
while (ac)
  try
      M = input("Ingrese el numero de subintervalos M: "); # Se ingresa el valor de M
      ac = false;
  catch
    printf("Valor invalido, intente de nuevo\n"); # Se ejecuta en caso de ingresar un valor invalido
  end_try_catch
endwhile

  
# Se calcula el ancho de cada intervalo h

h = (b - a) / M;


# Se ingresa la funcion a aproximar
ac = true;
while (ac)
  try
    fun = input("Ingrese la funcion f(x)= ","s"); # Se lee la funcion y se guarda en un string
    f = inline(fun,'x');# Se crea la funcion con el string fun
    ac = false;
  catch
    printf("Funcion invalida, intente nuevamente\n\n"); # Se ejecuta en caso de ingresar un valor invalido
  end_try_catch
endwhile


# Se calcula la aproximacion

      sum = 0; # Se inicializa la variable acumuladora
    for i = a+h : h : b-h,
      sum = sum + f(i); # se evalua la funcion en cada intervalo
    endfor  
    
    aprox = h / 2 * (f(a) + f(b)) + h * sum; # Se calcula el valor de la aproximacion con la regla del trapecio compuesto



printf("\n\n");
printf("Aproximacion:\n %.2f / 2 * (f(%.1f) + f(%.1f)) + %.2f * %.4f = %.6f \n ", h, a, b, h, sum, aprox); # se imprime la formula y el resultado


integ = integral(fun, a, b); # se calcula el valor analitico de la integral
error = abs(aprox - integ); # se calcula la diferencia entre el valor de la aproximacion y el valor de la integral


printf("Error = %.3f \n\n", error);

clear;
    