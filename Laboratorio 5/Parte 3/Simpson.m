clc; # limpia 
clear all; #limpia
ok = false; #variable salida del ciclo
warning('off','all'); #desactivar warnings   
pkg load symbolic #package para calculos
syms x; # se crea variable simbolica
while (~ok) #ciclo lectura
  try
    fun = input("Ingrese la funcion f(x)= ","s"); #se lee la funcion
    f = inline(fun,'x');#crea la funcion
    
    ok = true; #variable de salida
  catch
    printf("Favor ingresar una funcion apropiada \n"); #mensaje de error
  end_try_catch
endwhile

ok = false; # variable de salida del ciclo
while (~ok) #ciclo lectura
  try 
    v_i = input("Igrese valor del intervalor izquierdo: "); #se lee el intervalo izquierdo
    ok = true;#variable salida
catch
    printf("Favor ingresar un numero valido\n"); #mensaje de error
  end_try_catch
endwhile

ok = false; #varible de salida 
while (~ok) #ciclo lectura
  try 
    v_d = input("Igrese valor del intervalor derecho: "); #lee el intervalo derecho
    ok = true; #varible de salida
catch
    printf("Favor ingresar un numero valido\n"); #mensaje de error
  end_try_catch
endwhile

disp(['Su intervalo es [',num2str(v_i),',',num2str(v_d),']']); #mostrar en pantalla

ok = false; #varible de salida
while (~ok) #ciclo de lectura
  try 
		nodos = input("Cantidad de nodos a ingresar: ");# lee el numero de nodos
    if (mod(nodos,2)== 1 && nodos> 1) #confirma que sea un numeero valido para el metodo
			ok = true; #variable de salida
		else
			printf("Debe ingresar un numero impar mayor a uno\n"); #mensaje de error
    endif #fin if
catch
    printf("Favor ingresar un numero valido\n"); #mensaje de error
  end_try_catch
endwhile

#valor de h
h=(v_d-v_i)/(nodos-1);

# se muestra en pantalla
disp(['La distancia entre cada punto de su intervalo es h=',num2str(h),' con lo cual tiene los siguientes puntos:']);

#Imprimiendo los X's

printf("%8s",""); #se corre
for i=1:nodos # se recorren
		printf("X%d%8s",i,""); #se impreme en el nombre
		
endfor

printf("\n");#salto de linea

#Imprimiendo el valor correspondiente a cada X's

temp_val = v_i; #inicial
for i=1:nodos
		printf("%10d",temp_val); #imprime el actual
		temp_val += h; #calcula el siguiente
		
endfor

printf("\n");#salto de linea

m = floor(nodos/2);#calcula m

#sumatoria de los impares
impar = 0; #inicializacion
temp_val = v_i+h;#inicializacion 

for i=1:nodos-2 # for de sumatoria
  
  if mod(i,2)==1 #si el impar 
    impar+= f(temp_val); # se suma
  endif
  temp_val += h; # se pasa al siguiente numero
  
endfor # fin sumatoria


#sumatoria de los pares
par = 0;  #inicializacion
temp_val = v_i+h; #inicializacion

for i=1:nodos-2 #for de suma
  
  if mod(i,2)==0 # si es par
    par+= f(temp_val); #se suma
  endif
  temp_val += h;# se pasa al siguiente numero
  
endfor #fin sumatoria


#Aplicando la formula de la regla compuesta de Simpson
aprox = (h/3)*(f(v_i)+f(v_d))+(2*h/3)*(par)+(4*h/3)*(impar);
# se muestra en pantalla
disp(['La aproximacion a la integral de f(x)= ',fun,' usando la regla compuesta de Simpson es:']);
# se muestra en pantalla la funcion obtnida
disp(['S(f,h)=',num2str(h/3),' ( ',num2str(f(v_i)+f(v_d)),' ) +',num2str(2*h/3),' ( ',num2str(par),' ) + ',num2str(4*h/3),' ( ',num2str(impar),' )']);
# se muestra en pantalla el resultado
disp(['S(f,h)=',num2str(aprox)]);


deriv = int(fun, x,[v_i v_d]); #dirivacion analitico
diferencia = eval (aprox - vpa(deriv)); # resta

disp(['Error=',num2str(diferencia)]); #se muestra en pantalla



