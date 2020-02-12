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
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
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
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
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
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;
while (~ok)
  try
    a=input('Ingrese el valor a. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;
while (~ok)
  try
    b=input('Ingrese el valor b. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;
while (~ok)
  try
    alpha=input('Ingrese el valor alpha. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;
while (~ok)
  try
    beta=input('Ingrese el valor beta. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#Se le pide al usuario que ingrese el valor x del nodo x.
ok = false;
while (~ok)
  try
    N=input('Ingrese el valor N. ');#La variable 't0' representa el valor de la coordenada x del primer nodo.
    ok = true;
  catch
    printf("Por favor, ingrese un numero v�lido.\n\n");#Esta funci�n try-catch es para que el usuario solo pueda ingresar n�meros, ya que n es una variable num�rica. Esta funci�n se ve frecuentemente en este c�digo.
  end_try_catch
endwhile

#Se igualan los vectores a ceros, por ejemplo el vector T tendira N-1 ceros.
T=zeros(1,N+1);
X=zeros(1,N-1);
Y=zeros(1,N-1);
Z=zeros(1,N-1);
Va=zeros(1,N-2);
Vb=zeros(1,N-1);
Vc=zeros(1,N-2);
Vd=zeros(1,N-1);
h=(b-a)/N;

#Calculo del vector de los t�rminos independientes B en AX = B
Vt=a+h:h:a+h*(N-1);
Vb=-h^2*feval(r,Vt);
Vb(1)=Vb(1)+(1+h/2*feval(p,Vt(1)))*alpha;
Vb(N-1)=Vb(N-1)+(1-h/2*feval(p,Vt(N-1)))*beta;

#Calculo de la diagonal principal A en AX = B
Vd=2+h^2*feval(q,Vt);

#Calculo de la superdiagonal A en AX = B
Vta=Vt(1,2:N-1);
Va=-1-h/2*feval(p,Vta);

#Calculo de la suBdiagonal A en AX = B
Vtc=Vt(1,1:N-2);
Vc=-1+h/2*feval(p,Vtc);

#Resolucion de AX = B usando sistemas tridiagonales
Y = [];
N1=length(Vb);
  for k=2:N1  %inico for
    mult=Va(k-1)/Vd(k-1); 
    Vd(k)=Vd(k)-mult*Vc(k-1);
    Vb(k)=Vb(k)-mult*Vb(k-1);
  endfor % fin for
  X(N1)=Vb(N1)/Vd(N1);
  for k=N1-1:-1:1 %inicio for
    X(k)=(Vb(k)-Vc(k)*X(k+1))/Vd(k);
  endfor %fin for
for k=1: N+1
  %Calculamos el valor exacto
  i=0;
  const = (b-a)/N; % tama�o intervalos
  for k=1: N+1  %incio for
    Y(k)= f(i); % Calculo el valor exacto
    i+= const; %fin for
  endfor
  
  
T=[a,Vt,b];
X=[alpha,X,beta]; %colocar valores principio y final

  
  for k=1: N+1
    Z(k)= Y(k) - X(k); %Calculamos el eror
  endfor
  
  
  
L=[T' X' Y' Z'];

#Funcion F resultado de la aproximacion
printf( "%s %20s %20s %15s \n","k" ,"Solucion Metodo", "Solucion exacta", "Error"); %impriminos titulo
for i=1:N+1
  printf( "%d %15d %20d %20d \n",L(i,1),L(i,2),L(i,3),L(i,4));%imprimimos el resto de la tabla
endfor

figure
  hold on#inicia la figura
  
  title("Disparo Lineal"); #titulo
  plot (L(:,1), L(:,2),  L(:,1), L(:,3) );#grafica las funcion con linea y los puntos con 'o'
  xlabel('Eje X');#titulo eje x
  ylabel('Eje Y');#titulo eje y
  legend("Funion aproximada","Funcion real");#leyenda del grafico
  
  hold off #fin figura
  #--- grafica----

