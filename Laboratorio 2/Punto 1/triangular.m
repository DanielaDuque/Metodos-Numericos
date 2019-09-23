  clear;
 #tamaño de la matriz 
  ok=false;
  while (~ok)
    try
      n = input("Ingrese el tamano N de la matriz "); #lee el tamaño de la matriz
      ok=true;
    catch
      printf("ingrese un numero valido");
    end_try_catch
  endwhile
  
 #crear la matriz M
      ok=false;
  while (~ok)
    try
      M  = input("inserte la matriz M "); #lee el dato
      ok=true;
    catch
      disp ("Matriz no valida")
          
    end_try_catch
  endwhile
 #mostramos la matriz obtenida
  disp (" Matriz M ingresada");
  disp(M)
  
 #crea el vector B

ok=false;
  while (~ok)
    try
      B = input("inserte el valor del vector B "); #lee el dato
      ok=true;
    catch
      disp ("Vector no valido")
    end_try_catch
  endwhile
    

  
 #mostramos el vector b
    disp (" Vector B ingresado");
    disp(B')
  
 #miramos si la matriz tiene solucion
  
  if det(M) ==0
    disp("matriz insuluble");
  else
 #si no es insoluble se procede
 #calculamos L y U al mismo tiempo
     U=M;
     L = zeros(n);
    for q=1:n
      for r=q+1:n
       L(r,q) = U(r,q)/U(q,q);
       U(r,q)=0;
       for c=q+1:n
         U(r,c)= U(r,c)-L(r,q)*U(q,c);
       endfor
      endfor
    endfor
  #asignamos 1's a la diagonal de L  
    for q=1:n
      L(q,q)=1;
    endfor
  #mostramos la matriz U
    disp (" Matriz U");
    disp(U);
    
  # mostramos la matriz L
    disp (" Matriz L");
    disp(L);
    
 #solucionamos el sistema Ly=B mediante sustitucion progresiva
    Y=B;# se X=B, ya que la formula es y = b - sum(Li)*Yi 
    for r=1:n
      for c=1:r-1
      Y(r) -= L(r,c)*Y(c);#  -sum(Li)*Yi 
      endfor
  endfor
    
  #mostramos el ventor Y
    disp (" vector solucion parcial Y de LY=B");
    disp(Y');
    
  #solucionamos el sistema Ux=Y mediante sustitucion regresiva
    X=Y; # se X=Y, ya que la formula es x = y - sum(Ui)*Xi 
    for r=n:-1:1 # el -1 indica que es un ciclo decreciente 
      for c=r+1:n
        X(r) -= U(r,c)*X(c);#  -sum(Ui)*Xi 
    endfor
        X(r)/=U(r,r);
  endfor
    
 #mostramos el ventor X solucion 
    disp (" vector solucion X de  Ux=Y");
    for i=1:n
      printf("X%d = %d \n",i,X(i));
    endfor
    
  endif


  
 
  
  

