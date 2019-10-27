  clear; #limpia la ventana
  clc;#limpia la variables
  validos=false; #salir del ciclo
  
  while (~validos)#inicia ciclo
    ok = false; #variable de lectura
    while (~ok)#ciclo de lectura
      try
        M = input('Inqrese la matriz (x,y): ');#lee los puntos
        rows = size(M)(1); #calcula las filas
        columns = size(M)(2); #calcula las colummnas
        if (columns != 2) #verifica que solo de den dos datos por punto
          printf("Error, dimension incorrecta de tamaño %d, favor ingresar unicamente tuplas (x, y)\n" , columns);
        elseif (rows <= 1) #verifica que hallan mas de un punto
         printf("Error, no se puede hacer una aproximacion lineal con un punto.\n");
        else # si no pasa nada de lo anterior es valido
          ok = true;#para salir del ciclo de lectura
        endif #acba el if
      catch #por si ocurre un error
        printf("Por favor, inqrese una matris valida de la\nforma [[x1, y1] ; [x2, y2] ; ... ; [Xn Yn]]\n\n");
      end_try_catch#acaba try_catch
    endwhile #fin ciclo lectura
    
    validos= true; #asume que todo esta bien para seguir
    
    M(rows+1,:)=0; #hace la sumatoria igual cero
    x = M( : , 1);# seleciona las x
    y = M( : , 2);# seleciona las y
    x2 = zeros(9 , 1); #para los x^2
    xy=zeros(9,1);#para los x*y
    
    for i=1:rows #este ciclo va a calcular todos los valores
      x(rows+1)+=x(i); # Sumatoria de x
      y(rows+1)+=y(i); # suamtoria de y
      xy(i)=x(i)*y(i); # calcula x*y
      xy(rows+1)+=xy(i); # Sumatoria x*y
      x2(i)= x(i).^2; # Calcula x^2
      x2(rows+1)+=x2(i); # Sumatoria x^2
    endfor # finaliza ciclo calculos

    # sistema de ecuaciones
    solution_vector = [ xy(rows+1) ; y(rows+1)]; # crea el vector solucion
    values_matrix = [[x2(rows+1) x(rows+1)] ; [x(rows+1) rows]]; #crea la matriz de coeficientes
    
    if (det(values_matrix) == 0) # mira si la matriz de coeficientes en invertible
      printf("Error. No se puede construir una recta de regresion usando la matris suministrada. \nFavor ingresar mayor cantidad de datos\n");
      ok = false; #vuelve al ciclo inicial al ser el problema insoluble
    endif
  endwhile#termina ciclo inicial
  
  # Se procede a realizar los calculos y mostrar los reultados en pantalla
  
  #  ---- tabla--- 
 printf("\n\n\k\tX\tY\tX^2\tX*Y\n"); # parte de arriba de la tabla
  for i = 1 : rows # este ciclo se encarga de escribir las filas de la tabla
    printf("%d\t%.2f\t%.2f\t%.2f\t%.2f\n",i,  x(i), y(i), x2(i), xy(i));# fila de la tabla
  endfor
  #sumatorias
  printf("________________________________________\n"); #aqui se escriben las sumatorias
  printf("Total:\t%.2f\t%.2f\t%.2f\t%.2f\n", x(rows+1), y(rows+1),x2(rows+1) , xy(rows+1));
  
  #---- fin tabla----

  

#Se procede a calcular los parametros A y B
  parametros = inv(values_matrix) * solution_vector; # se calcula la inversa de la matriz, ya que asi es la 
    A = parametros(1); #calculo a                    # forma correcta de "dividir " matrices
    B = parametros(2);#calculo B
  
  # imprimir ecuaciones lineales 
printf("\n\n\nSistema de ecuaciones:\n");
printf("%.2f A + %.2f B = %.2f\n", x2(rows+1),  x(rows+1), xy(i)); #ecucuacion 1
printf("%.2f A + %.2f B = %.2f\n", x(rows+1), rows, y(rows+1)); #ecuacion 2
  
  

    #se imprimen las soluciones de A y B
  printf("\nSolucion:\n");
  printf("A = %f\n", A); #solucion A
  printf("B = %f\n", B); # solucion B
  
  
  #se realiza la ecuacion de la recta
  printf("\nEcuacion de la recta : Y = %f X + %f\n", A, B); #se imprime la ecuacion de la recta
  
  #se calculan los vactores para graficar
  x_funtion =(-2:0.1:7); #vector x
  y_funtion = A.*x_funtion .+B; #vector y aplicando la ecuacion anterior
 
  x(rows+1,:) = []; #se elimina la fila de sumatorias para graficar 
  y(rows+1,:) = [];#se elimina la fila de sumatorias para graficar 
  
  #--- grafica-----
  figure
  hold on#inicia la figura
  
  title("Aproximacion lineal  "); #titulo
  plot (x, y, 'o',  x_funtion, y_funtion );#grafica las funcion con linea y los puntos con 'o'
  xlabel('Eje X');#titulo eje x
  ylabel('Eje Y');#titulo eje y
  len= strcat("Y =   ", num2str(A), " X + ", num2str(B)); #se crea el string para la legenda del grafico
  legend("datos",len);#leyenda del grafico
  
  hold off #fin figura
  #--- grafica----