clc #Limpia todo el texto de la ventana de comando
clear all #Limpia todas las variables antes de entrar al programa.
format long ;


#se le pide al usruario que ingree el numero de polinomios que quiere generar
ok = false;
while (~ok)#Se asegura que no se salga del ciclo sin haber leido correctamente el dato 
  try
    com=input('Cuantos polinomios desea Generar ');#La variable 'oom' representa el numero de polinomios que desea generar.
    ok = true;#para cabar el ciclo
  catch
    printf("Por favor, ingrese un numero valido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile
vector1 = -2:.1:6;#vector con el que se va a graficar
vector = 0:.1:1.2;#vector con el que se va a graficar
fun_g=[];
contador =1; #contador
while contador<=com
#Se le pide al usuario que ingrese el grado del polinomio intepolador que generará el programa
# de acuerdo al número de nodos que éste entrará.
    ok = false;#para iniciar el ciclo
    while (~ok)#Se asegura que no se salga del ciclo sin haber leido correctamente el dato 
      try
        n=input('Ingrese el grado n del polinomio que generara este programa ');#La variable 'n' representa el grado del polinomio.
        ok = true;#para acabar el ciclo
      catch
        printf("Por favor, ingrese un numero valido.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
      end_try_catch
    endwhile

    #Esto le indica al usuario que debe ingresar n+1 nodos en x.
    disp(['Usted ingreso el número ',num2str(n),' por lo que deberá ingresar ',num2str(n+1),' nodos.'])

    ok = false; #Esta variable sirve para que el usuario solo ingrese los n+1 elementos x necesarios para los n+1 nodos, ya que si ingresa otro numero no correspondería al número de nodos que éste quiso ingresar.
    while ~ok
       x = [];#vector en el que se van aguardar los datos
       indice = '';
       xIN = input('Por favor ingrese los elementos x de todos los nodos. ','s');#lee el string de las x
       expression = '[-.\d]+'; #esxpresion para match con digitos.
       indice= regexp(xIN,expression);# esta funcion hace match en el string solo con los digitos
       for i=1:length(indice)#Este for asigna los números presentes en el string ingresados por el usuario para luego pasarlos a un arreglo numérico.
         if i < length(indice)
            x(i) = str2num(xIN(indice(i):indice(i+1)-2));#asigna el valor
         else
            x(i) = str2num(xIN(indice(i):length(xIN)));#aasigna el valor
         endif   
       endfor
       if length(x) ~= n+1#Se confirma que se ingresaron n+1 números por lo explicado arriba.
         disp(['Debes ingresar ',num2str(n+1),' elementos. Por favor vuelvelo a intentar.']);#mensaje en caso de error
       else
         ok = true; #asigna true por default ya que si se acab el cilco sin un break, se puede continuar
          for u=1:n #Estos ciclos se usan para confirmar que no se ingrese el mismo número más de una vez en el arreglo de x, ya que se supone que los nodos corresponden a una función.
            for t=u+1:n+1#recorre todos los numeros desde u hasta n
              if x(u) == x(t)#verifica si son iguales
                ok=false; #asigna ok false para reiniciar el ciclo
                disp(['No puedes ingresar el mismo valor más de una vez. Intentalo de nuevo']);#mensaje en caso de error
                break;#rompe el ciclo y vuelve al paso anterior
              endif  
            endfor 
          endfor      
       endif   
    endwhile


    #Esto le indica al usuario que debe ingresar n+1 nodos en y.
    disp(['Usted ingreso el numero ',num2str(n),' por lo que debera ingresar ',num2str(n+1),' valores de f(x).'])

    ok = false; #Esta variable sirve para que el usuario solo ingrese los n+1 elementos x necesarios para los n+1 nodos, ya que si ingresa otro numero no correspondería al número de nodos que éste quiso ingresar.
    while ~ok
       y = [];#vector en el que se van aguardar los datos
       indice = '';
       xIN = input('Por favor ingrese los elementos y = f(x)de todos los nodos. ','s');#lee el string de las x
       expression = '[-.\d]+'; #esxpresion para match con digitos.
       indice= regexp(xIN,expression);# esta funcion hace match en el string solo con los digitos
       for i=1:length(indice)#Este for asigna los números presentes en el string ingresados por el usuario para luego pasarlos a un arreglo numérico.
         if i < length(indice)
            y(i) = str2num(xIN(indice(i):indice(i+1)-2));#asigna el valor
         else
            y(i) = str2num(xIN(indice(i):length(xIN)));#asigna el valor
         endif   
       endfor
       ok = true;#se hace true la funcion para salir del ciclo
       if length(y) ~= n+1#Se confirma que se ingresaron n+1 números por lo explicado arriba.
         disp(['Debes ingresar ',num2str(n+1),' elementos. Por favor vuelvelo a intentar.']);#mensaje en caso de error   
         ok = false;#se hace false para continuar en el ciclo
       endif   
    endwhile


 #Crear la funcion 

    
    mul=1; #hace la variable multiplicadora en 1 por ser el numero neutro de la multiplicacion
    b=1; #crea el vector que usaremos en la multiplicacion
    sum=0; #crea el vector que usaremos en la suma
    for i=1:n+1 #recorre todos los nodos
      for k=1:n+1 #recorre todos los nodos para hallar el denominador
        if i~=k #se asegura de solo multiplicar cuando i y k son dierentes
          mul = mul* (x(i)-x(k)); #multilpica las vriables
        endif
      endfor

      mul = y(i)/mul; #divide el valor de y (i) entre toda el denominador, simplifica

      for j=1:n+1 #recorre todos los nodos para hallar el numerador 
        if i~=j#se asegura de solo multiplicar cuando i y j son dierentes
          c=[1,-x(j)]; #crea el polinomio x-x(j) en forma de vector 
          b = conv(b,c); #multiplica este vector con el acomulado del numerador
        endif
       endfor
       b= b*mul; # multiplica el numerador por el resultado de y(i)/denominador
       sum = sum .+b; # Suma el resultado con el acomulado
       b=1; #vuelve al neutro en b
       mul=1; #vuelve al neutro en mul
    endfor 
    fun_s= polyout(sum, "x"); #crea el la funcion handel de la funcion, para poderla graficar en el futuro
    matriz=inline(fun_s); #crea la variable matriz
      for i=1:length(vector) #recorre el vector
        fun_g(contador,i)= matriz(vector(i));#crea las f(x) para poder graficar
      endfor 
      for i=1:length(vector1) #recorre el vector1 para mas info
        fun_g1(contador,i)= matriz(vector1(i));#crea las f(x) para poder graficar
      endfor 
    disp(["\n\n      Funcion ", num2str(contador), "   es :"]);
     v=genvarname(['Fun',num2str(contador)]); #crea una nueva variable con un nombre dinamico
     eval([v, '=matriz']);#asigna nuestro string fun_s a la varibale con nombre dinamico
     disp("\n\n    ");
  contador++;
endwhile

#se le pide al usuario que ingrese la funcion que quiere comparar
ok = false;
while (~ok)#Se asegura que no se salga del ciclo sin haber leido correctamente el dato 
  try
    fun_char=input('ingrese la funcion con la que quiere comparar ',"s");#La variable 'fun' representa la funcion con la que quiere comparar 
    fun=inline(fun_char);
     for i=1:length(vector) #recorre el vector1 para mas info
        fun_g(contador+1,i)= fun(vector(i));#crea las f(x) para poder graficar
      endfor 
      for i=1:length(vector1) #recorre el vector1 para mas info
        fun_g1(contador+1,i)= fun(vector1(i));#crea las f(x) para poder graficar
      endfor 
    ok = true;#para cabar el ciclo
  catch
    printf("Por favor, ingrese una funcion valida.\n\n");#Esta función try-catch es para que el usuario solo pueda ingresar números, ya que n es una variable numérica. Esta función se ve frecuentemente en este código.
  end_try_catch
endwhile

#producir graficos 

#creamos el legend
  for i=1:com #recorre todas las funciones
  len_c{i,1} = ["fun ", num2str(i)];#crea el legend como una celda
  endfor
  len_c{com+1,1} =fun_char;#agrega el coseno

#Todas juntas
  figure;#crea la figura
   hold on; #inicia el proceso
   for i=1:com #recorre el numero de graficas
     plot(vector,fun_g(i,:));# crea la linea
    endfor
    plot(vector,fun_g(contador+1,:));#grafica la funcion a comparar
    legend(len_c); #agrega una leyenda
    title("Todas juntas");#titulo
    hold off; #termina la figura
    
#Todas separadas
  figure;#crea la figura
   hold on; #inicia el proceso
   for i=1:com #recorre el numero de graficas
     len = ["fun ", num2str(i)];#crea el titulo
     subplot(2,2,i); #crea el subplot
     plot(vector,fun_g(i,:));# crea la linea
     title(len); #pon el titulo
    endfor
    subplot(2,2,com+1);
    plot(vector,fun_g(contador+1,:));#grafica la funcion a comparar
    title(fun_char);#titulo
    hold off; #termina la figura
    
#Todas juntas extrapolada

  figure;#crea la figura
   hold on; #inicia el proceso
   for i=1:com #recorre el numero de graficas
     plot(vector1,fun_g1(i,:));# crea la linea
    endfor
    plot(vector1,fun_g1(contador+1,:)); #grafica la funcion a comparar
    legend(len_c); #agrega una leyenda
    title("Todas juntas <<extrapoladas>>"); #titulo
    hold off; #termina la figura







