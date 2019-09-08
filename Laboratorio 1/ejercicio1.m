clear # limpia la ventana de variables

fun_ingr = false;

while (~fun_ingr)
 try
  fun = input( "ingrese su funcion en terminos de x f(x)= : ",'s'); #pide al usuario ingresar la funcion que desee
  if (index(fun, 'x')==0)#verifica si la funcion ingresada contiene por lo menos una x
    input ("funcion no valida");
   continue;
  endif
  fun = inline(fun,'x'); #convierte el string optenido en una funcion 
  fun_ingr= true;
 catch
  input("funcion no valida");
  end_try_catch
endwhile

rango =false;

valor =input("valor en el que desea calcular la funcion = ");#lee valor en el que desa calcular la función

while (~rango)
  try
    izq=input("ingrese el limite izquierdo = ");#lee el limite izquierdo
    der=input("ingrese el limite derecho = ");#lee el limite derecho
    if(der!=izq)#determina que el intervalo sea valido 
      
      if (der<izq)# intercambia los limites derecho e izquierdo en caso de ser necesario
        ans = der;
        der = izq;
        izq = ans;
      endif
        rango = true;
    else
      input("Rango no valido");
    endif
    
  catch
    input("Valor no valido");
  end_try_catch
endwhile

opcion = 0;
while(opcion!=1 && opcion !=2) #elige la opcion de finalizacion;
printf("Desea terminar el proceso por : \n");
printf("1. Numero de iteracion.\n");
printf("2. Ancho del intervalo final. \n");

opcion = input("digite el numero de su opcion =");
endwhile


if (opcion==1) #opcion por numero de iteraciones
  k=0;
  numero_veces = input("digite el numero de veces que desea realizar el proceso =");
  printf("%2s %15s %15s %15s %15s %15s %15s \n","k","Extremo izquierdo","Punto medio","Extremo derecho","f(a)","f(c)","f(b)");
  while(numero_veces>0)#se encarga de realizar el proceso el numero de veces solicitadas, contando la iteracion cero.
  c = (der+izq)/2;#calcula el valor medio
  #evalua las funciones
  fa= fun(izq)-valor;
  fb= fun (der)-valor;
  fc = fun(c)-valor;
  printf("%2d %15d %15d %15d %15f %15f %15f \n",k,izq,c,der,fa,fc,fb);
  #elige el nuevo intervalo 
  if fa.*fc>0
    izq = c;
  else
    der =c;
  endif
  numero_veces--;#actualiza la variable de finalizacion del ciclo
  k++;
  endwhile
 
else #opcion por ancho de intervalo
  k=0;
  ancho_intervalo = input("Digite el ancho del intervalo =");
  printf("%2s %15s %15s %15s %15s %15s %15s \n","k","Extremo izquierdo","Punto medio","Extremo derecho","f(a)","f(c)","f(b)");
  
  while(ancho_intervalo<abs(der-izq))#se encarga comprobar si el tamaño del intervalo es menor al especificado
  
  c= (der+izq)/2; #calcula el valor medio
  #evalua las funciones
  fa= fun(izq)-valor;
  fb= fun (der)-valor;
  fc = fun(c)-valor;
  printf("%2d %15d %15d %15d %15f %15f %15f \n",k,izq,c,der,fa,fc,fb);
  #elige el nuevo intervalo 
  if(fa*fc<0)
    der=c;
  else
    izq=c;
  endif
  k++;
  endwhile
endif
