function newtonR
  
clear;
warning('off','all'); #desactivar warnings   
pkg load symbolic #package para calculos
syms x; # se crea variable simbolica




pkg load symbolic #package para calculos

 
ac = true;
while (ac)
  try
    f(x) = input("Ingrese la funcion f(x) ");#se ingresa la funcion
    ac = false;
  catch
    printf("funcion con formato invalido, intente nuevamente\n");
  end_try_catch
endwhile


ac = true;
while (ac)
  try
    pIni = input("Valor inicial de x, p0= ");#se ingresa el valor inicial p0
    ac = false;
  catch
    printf("Valor invalido, intente nuevamente\n");
  end_try_catch
endwhile


ac = true;
while (ac)
  try
    ancho = input("Ancho maximo del intevervalo final: "); #se ingresa el intervalo final
    ac = false;
  catch
    printf("Valor invalido, intente nuevamente\n");
  end_try_catch
endwhile


ac = true;
while (ac)
  try
    numIt = input("Cantidad de iteraciones del algoritmo: "); #Se ingresa cantidad de iteraciones
    ac = false;
  catch
    printf("Valor invalido, intente nuevamente\n");
  end_try_catch
endwhile



k = 0;

fpk = double(f(pIni));
deriv = diff(f); #Se calcula la dervida de la funcion



printf("k  tiempo pk   altura f(pk)  f'(pk) \n");
while (numIt ~= k & ancho ~= abs(fpk)) #condiciones para terminar: iteraciones o intervalo
  
  
  fpk = double(f(pIni)); #funcion f(x) evaluada en el punto pk
  fpkd = double(deriv(pIni)); # derivada  f´(x) evaluada en el punto pk
  
  
  printf("%d  %f   %f   %f \n", k, pIni, fpk, fpkd);
  pIni = pIni - fpk/fpkd;  # calculo de pk
  
  k = k+1;
endwhile

endfunction
