function difFinitas

pkg load symbolic;
warning('off','all');

syms x;

#Input de los usuarios

#Grado del polinomio
ac = true;
while (ac)
  try
    n=input('Ingrese el grado del polinomio: ');#Se ingresa el grado del polinomio.
    ac = false;
  catch
    printf("Valor ingresado no valido, intente de nuevo\n\n");#Asegura que el valor ingresado sea un numero
  end_try_catch
endwhile


#Cantidad de datos
ac = true;
while (ac) 
	try 	
	puntos_size = input("Ingrese la cantidad de datos: "); #se ingresa la cantidad de datos para el calculo
	if puntos_size >= n+1 #Se asegura que la cantidad de datos sea mayor a n+1
		ac = false;
	else
		printf("la cantidad de datos debe ser por lo menos de %d datos\n\n",(n+1)); #se asegura que no se ingrese un valor menor que n+1
	endif	
	catch
	printf("Valor ingresado no valido, intente de nuevo\n\n"); #se asegura que el valor ingresado sea un entero
	end_try_catch
endwhile


#Valor de h
ac = true;
while (ac)	
	try 
	h = input("Ingrese la distancia h entre los datos: ");	# se ingresa la constante h
	if h > 0	
		ac = false; # en caso de que sea positivo se acepta el dato
	else 
			printf("Debe ingresar un numero positivo.\n\n"); # se asegura de que el dato sea positivo
	endif
	catch
	printf("Valor ingresado no valido, intente de nuevo\n\n"); # se asegura que el valor ingresado sea valido
	end_try_catch
endwhile



#Valor del primer X
ac = true;
while (ac)	
	try 
	valor_inicial = input("Ingrese el primer valor (x): "); #se ingresa el primer x para calcular los demas con h
	ac = false;
	catch
	printf("Valor ingresado no valido, intente de nuevo\n\n"); # se asegura que el valor ingresado sea valido
	end_try_catch
endwhile


#Valores de cada f(x)
ac = true;
while (ac)
	try
		f_ = input("Ingrese los valores de f(x):\n","s");
		f_ = cellfun("str2num",strsplit(f_," ")); #Se ingresan los puntos f(x)
		if size(f_)(2) == puntos_size # se verifica que se hayan ingresado la cantidad de puntos necesaria
			ac = false;
		else
			printf("cantidad erronea de datos"); # se asegura que se ingreso la cantidad necesaria de datos
		endif
	catch
		printf("Valor ingresado no valido, intente de nuevo\n\n"); # se asegura que el valor ingresado sea valido
	end_try_catch
endwhile


#Se imprime matriz completa
printf("%30s","\nValores x y f(x)\n");
printf("%10s","x");
for	i=1 : puntos_size
	printf("%10d ",i-1); #Se imprime cantidad de puntos
endfor
printf("\n");
printf("%10s","x");
for	i=1 : puntos_size
	valor = valor_inicial+(i-1)*h; #Se genera los valores x con valor inicial y h
	printf("%10d ",valor); 
endfor #terminan generacion de valores x
printf("\n");
printf("%10s ","f(x)");
for	i=1 : puntos_size
	printf("%10d ",f_(i)); #Se imprimen los valores ingresados f(x)
endfor
printf("\n\n");







#Calculo de tabla de dif finitas
printf("Tabla de diferencias finitas hacia adelante \n");
for i=1 : puntos_size
	dif_fin(i,1) = i-1; #Se calculan los primeros valores de la tabla
	dif_fin(i,2) = valor_inicial+(i-1)*h;;
endfor #termina ciclo primeros valores 
dif_fin = [dif_fin f_'];
for i=4 : puntos_size+3-1
	for j=i-3+1: puntos_size
		dif_fin(j,i) = dif_fin(j,i-1) - dif_fin(j-1,i-1); #Se calculan los demas valore con base en los ya calculados
 endfor
endfor


#Matriz completa

printf("%15s %15s %15s","puntos","i","f(i)");
for i=1: puntos_size-1
	printf("%15s ",strcat("d^", num2str(i), " f(i)")); #se imprimen cabeceras
endfor
printf("\n");

for i=1: size(dif_fin)(1)
		for j=1: size(dif_fin)(2)
			printf("%15d ", dif_fin(i,j)); # se imprimen los valores de la matriz
		endfor
		printf("\n");
endfor #termina ciclo
printf("\n");


#Valor para extrapolacion
ac = true;
while (ac)
	try	
		apro = input("Ingrese el valor al que se desea aproximar: "); #se ingresa el valor a aproximar f(x)
		ac = false;
	catch
		printf("Valor ingresado no valido, intente de nuevo\n\n"); # se asegura que el valor ingresado sea valido
	end_try_catch
endwhile

#Se calcula s
s = (apro - dif_fin(1,2))/h;




#Aproimacion con el polinomio pedido por el usuario
sum = 0;
fact = 1;
s_value = 1;
for i = 1 : n+1
	if i==1 
		sum = sum + dif_fin(i,i+2); #para el caso del pol de prim grado
	else
		s_value = s_value * (s-(i-2)); #en caso de que el pol sea de grado >1
		fact = fact * (i-1);	
		sum = sum + (s_value*dif_fin(i,i+2))/fact; # se suman los valores de deltf(xi)
	endif
endfor
printf("Con el polinomio de grado %d se obtiene: %10f \n\n",n, sum);


#Comprobando si se puede interpolar
interp = false;
for i=1 : puntos_size-1
	if dif_fin(i,2)<=apro && apro<=dif_fin(i+1,2)
		pos_interpolar = i; #se guarda la posicion
		interp = true; #se concluye que se puede interpolar
 endif
endfor

#Comprobando si es posible interpolar
if (interp)
	
  
  
  
  

	#Se determina grado de interpolacion
	max_grado = n;
  pos_interpolar = 1;
	if  max_grado< n 
			printf("No es posible interpolar con un polinomio de grado %d, se interpolara con uno de grado %d \n",n,max_grado);
	endif	
	
  
	#Calculo s para interpolar
	s = (apro-dif_fin(pos_interpolar,2))/h; 
  
  
  
  #Se genera el polinomio
  k(x) = (x-dif_fin(pos_interpolar,2))/h;
  
  pol(x) = 0*x; #se crea el polinomio
	fact = 1;
	s_value = 1;
  
  for i = 1 : n+1
		in = i + pos_interpolar-1; #se calcula el valor para recorrer la matriz de dif
		if i==1 
			pol(x) = pol(x) + dif_fin(in,i+2); #se agregan los valores para el grado 1
		else
			s_value = s_value * (k(x)-(i-2)); #se agregan los valores para los demas
			fact = fact * (i-1);	
			pol(x) = pol(x) + (s_value*dif_fin(in,i+2))/fact; #se agregan las expresiones al polinomio 
		endif
	endfor
  
  printf("El polinomio que se obtiene es: \n");
  simplify(vpa(pol,7)) #Se imprime el polinomio
  func = matlabFunction(simplify(vpa(pol,7)));
  vector = -1:.1:3;
  for i=1:length(vector)
    grad(i)=func(vector(i));
  endfor
  
  
  grad
  figure;
  hold on;
  plot (vector,grad);
  legend ("Interpolacion de newton");
  hold off;
  
  
  
	
	#Se realiza la interpolacion
	valor = 0;
	fact = 1;
	s_value = 1; #se definen las variables a utilizar
	for i = 1 : n+1
		in = i + pos_interpolar-1; #se calcula el valor para recorrer la matriz de dif
		if i==1 
			valor = valor+ dif_fin(in,i+2); #se calcula el valor para pol con grado 1
		else
			s_value = s_value * (s-(i-2)); # se calculan los valores para los demas grados
			fact = fact * (i-1);	
			valor = valor + (s_value*dif_fin(in,i+2))/fact; #se evalua para cada grado
		endif
	endfor
	printf("Por medio de aproximacion se obtiene: %10f \n",valor); #se imprime el valor obtenido
  
  

  
  
  
  
  
else
	printf("No es posible interpolar\n");
endif
