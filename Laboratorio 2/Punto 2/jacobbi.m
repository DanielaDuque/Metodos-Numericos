function jacobbi
  
  
ac = true;
while (ac)
  try
    n = input("Ingrese el numero de variables ");#numero de variables para el sistema
    ac = false;
  catch
    printf("Ingrese un numero real\n");
  end_try_catch
endwhile
  
  
  
  
  

A=[];
for i=1: n
  ac = true;
  printf("Ingrese los coeficientes de la fila %d \n",i);# se ingresa la matriz fila por fila
  while (ac)
    try
      f = input("","s");
      s = cellfun("str2num",strsplit(f," ")); #realiza casting sobre el string guardado en f
      
      if (length(s) != n)
        printf("Faltan variables \n");
      else
        ac = false;  
      endif
    catch
      printf("ERROR, Vuelva a ingresar la fila\n");
    end_try_catch
  endwhile
  A = [A;s] 
endfor



if (det(A) == 0) #metodo para calcular el determinante de una matriz
  printf("ERROR, la matriz no es invertible\n"); # Se verifica si la matriz tiene det !=0, es decir, es invertible
  return; #se termina la función ai se cumple la condicio
endif



#metodo para comprobar que la matriz tiene diagonal estrictamente dominante
res = true;
  for i=1 : n
    ded = sum( abs(A(i,:)) >= abs(A(i, i)));
    if (ded != 1) 
      res = false;
      break;
   endif
 endfor
  

if (!res) 
  printf("ERROR, la matriz no es DED \n");
  return; #se termina la funcion si se cumple la condicion de que no tenga ded
endif





b=[];
for i=1:n
  ac = true;
  printf("Ingrese el valor para la matriz extendida de la fila %d \n",i);
  while (ac)
    try
      b(i) = input("");
      ac = false;
    catch
      printf("Ingrese un numero real\n\n");
    end_try_catch
  endwhile
endfor






printf("Ingrese uno a uno los valores del punto inicial P0 \n");
  
p=[];
for i=1:n
  ac = true;
  while (ac)
    try
      p(i) = input(""); #se ingresa el valor del punto p0
      ac = false;
    catch
      printf("Ingrese un numero real\n\n");
    end_try_catch
  endwhile
endfor
  
  

  
  
 ac= true;
while (ac)
  try
    repeticiones = input("Ingrese el numero de iteraciones para terminar el algoritmo ");#se crea la funcion
    ac = false;
  catch
    printf("Ingrese un numero real\n\n");
  end_try_catch
endwhile


#Se imprimen en consola los encabezados de la tabla
printf("k", j);
for j=1:n
  printf("\t\tX%d", j);
  
endfor

printf("\n");

for i=1:repeticiones+1 #ciclo para las repeticiones que se desean 
  printf("%d", i - 1); #numero de repeticion
  
  for j=1:n
    printf("\t\t%.8f", p(j)); #valores del punto pk
  endfor
    
  printf("\n");
  
  #se calcula el nuevo valor para p
  f = [];
  for j=1 : n
    xj = b(j);
    r = A(j, :) .* p .* -1;
    r = [r(1 : j-1), r(j+1 : n)];
    xj += sum(r);
    xj /= A(j, j);
    f(j) = xj;
  endfor
  
  p = f;
endfor

printf("\n\n");

  #se imprime en consola el valor final obtenido del algoritmo
  printf("El punto obtenido es (\ ");
  for j=1:n-1
    printf("%f, ", f(j));
  endfor
  printf("%f )" , f(n));
  
  
endfunction
