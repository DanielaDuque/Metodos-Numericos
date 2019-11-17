clc;
clear all;
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
    v_i = input("Igrese valor del intervalor izquierdo: ");
    ok = true;
catch
    printf("Favor ingresar un numero valido\n");
  end_try_catch
endwhile

ok = false;
while (~ok)
  try 
    v_d = input("Igrese valor del intervalor derecho: ");
    ok = true;
catch
    printf("Favor ingresar un numero valido\n");
  end_try_catch
endwhile

disp(['Su intervalo es [',num2str(v_i),',',num2str(v_d),']']);

ok = false;
while (~ok)
  try 
		nodos = input("Cantidad de nodos a ingresar: ");
    if (mod(nodos,2)== 1 && nodos> 1)
			ok = true;
		else
			printf("Debe ingresar un numero impar mayor a uno\n");
    endif
catch
    printf("Favor ingresar un numero valido\n");
  end_try_catch
endwhile

#valor de h
h=(v_d-v_i)/(nodos-1);

disp(['La distancia entre cada punto de su intervalo es h=',num2str(h),' con lo cual tiene los siguientes puntos:']);

#Imprimiendo los X's

printf("%8s","");
for i=1:nodos
		printf("X%d%8s",i,"");
		
endfor

printf("\n");

#Imprimiendo el valor correspondiente a cada X's

temp_val = v_i;
for i=1:nodos
		printf("%10d",temp_val);
		temp_val += h;
		
endfor

printf("\n");

m = floor(nodos/2);

impar = 0;
temp_val = v_i+h;

for i=1:nodos-2
  
  if mod(i,2)==1
    impar+= f(temp_val);
  endif
  temp_val += h;
  
endfor

par = 0;
temp_val = v_i+h;

for i=1:nodos-2
  
  if mod(i,2)==0
    par+= f(temp_val);
  endif
  temp_val += h;
  
endfor


#Aplicando la formula de la regla compuesta de Simpson
aprox = (h/3)*(f(v_i)+f(v_d))+(2*h/3)*(par)+(4*h/3)*(impar);
disp(['La aproximacion a la integral de f(x)= ',fun,' usando la regla compuesta de Simpson es:']);
disp(['S(f,h)=',num2str(h/3),' ( ',num2str(f(v_i)+f(v_d)),' ) +',num2str(2*h/3),' ( ',num2str(par),' ) + ',num2str(4*h/3),' ( ',num2str(impar),' )']);
disp(['S(f,h)=',num2str(aprox)]);



