clc;
clear all;


#Se ingresa el grado M del polinomio a calcular
ac = true;
while (ac)
  try
    m = input('Ingrese el grado del polinomio'); #Se guarda en M el grado
    ac = false;
  catch
    printf("Valor invalido, intente de nuevo.\n\n"); #Se verifica que el usuario ingrese un valor valido
  end_try_catch
endwhile



#Se ingresa la cantidad de puntos (x,y) que va a ingresar
ac = true;
while (ac)
  try
    n = input('Ingrese el número de puntos que va a ingresar.');#Se guarda en n la cantidad de puntos
    ac = false;
  catch
    printf("Valor invalido, intente de nuevo.\n\n");#Se verifica que el usuario ingrese un valor valido
  end_try_catch
endwhile



#Se ingresan los valores de x para los n puntos
ac = true; 
x = [];
while (ac)
   
   cadena = ''; #se crea cadena vacia
   puntos = input('Ingrese los valores de x','s'); #se ingresa el dato
   er = '[-0123456789.]+';#se crea expression regular
   cadena= regexp(puntos,er);
   for i=1:length(cadena)#Este for asigna los números presentes en el string ingresados por el usuario para luego pasarlos a un arreglo numérico.
     if i < length(cadena)
        x(i) = str2num(puntos(cadena(i):cadena(i+1)-2)); #se procesa la cadena
     else
        x(i) = str2num(puntos(cadena(i):length(puntos))); #se procesa ultimo elemento
     endif   
   endfor
   if length(x) ~= n#Se confirma que se ingresaron n+1 números.
     disp(['Cantidad de datos incorrecta, intente de nuevo']);        
    else
       ac = false;
   endif   
endwhile



#Se ingresan los valores de y
ac = true;
y = []; 
while (ac)
   
   cadena = ''; #se crea cadena vacia
   puntos = input('Ingrese los valores de x','s'); #se ingresa el dato
   er = '[-0123456789.]+';#se crea expression regular
   cadena= regexp(puntos,er);
   for i=1:length(cadena)#Este for asigna los números presentes en el string ingresados por el usuario para luego pasarlos a un arreglo numérico.
     if i < length(cadena)
        y(i) = str2num(puntos(cadena(i):cadena(i+1)-2)); #se procesa la cadena
     else
        y(i) = str2num(puntos(cadena(i):length(puntos))); #se procesa ultimo elemento
     endif   
   endfor
   if length(x) ~= n#Se confirma que se ingresaron n+1 números.
     disp(['Cantidad de datos incorrecta, intente de nuevo']);        
    else
       ac = false;
   endif   
endwhile




#se halla F y F'
for n1=1:n
  for m1=1:m+1
    f(n1,m1) = x(n1)^(m1-1); #Se calcula el fi(xi) para F              
    fp(m1,n1) = x(n1)^(m1-1); #Se calcula el fi(xi) para F'
  endfor
endfor

printf("La matriz F: \n");
disp(f); #se imprime la matriz F



printf("La matriz F': \n");
disp(fp); #se imprime la matriz F'



productof = fp*f; #producto es FF'
y1 = y.'; #se calcula el valor de la matriz que se calcula con F'
disp(['La matriz y que se multiplica con F´ es: ']);
disp(y1); #se imprime la matriz



productoy = fp*y1;#prodycto de F'y 
disp(['El prodycto es: ']);
productoy = linsolve(productof,productoy); #se resuelve el sistema de ecuaciones lineales con la funcion linsolve
disp(productoy);



pol = '';

#Ciclo para crear la funcion en forma de string
for u = m+1:-1:1
  if u ~= 1 # Esta condición se usa para que no que un signo de + al final.
    str1 = {pol,num2str(productoy(u,1)),'*x^',num2str(u-1),'+'};
    pol = strjoin(str1);
   else
    str1 = {pol,num2str(productoy(u,1)),'*x^',num2str(u-1)};
    pol = strjoin(str1);
   endif
endfor

disp(['El polinomio obtenido es: '])
disp([pol]);

#Funcion para graficar
G=min(x):(max(x)-min(x))/50:max(x);
f=0;
for a=1:m+1
  f = f + productoy(a,1)*G.^(a-1);
endfor  

#Intrucción para graficar la función de aproximación (f).
plot(G,f); title('Polinomio por metodo de Combinacion Lineal ');
legend(pol);
xlabel ("x");
ylabel ("f(x)");
