function L = linsht(F1,F2,a,b,alpha,beta,M)
	#F1 y F2 son sistemas de ecuacion de primer orden
	#a y b son los extremos derecho e izquierdo del intervalo
	#alpha = x(a) y beta = x(b) son las condiciones de contorno
	#M es el numero de pasos
	#resultado
	#L=M[T',X]; donde T' es el vector de dimension (M+1)x1 de las abscisas y X el vector de dimesion (M+1)x1 de las coordenadas
	
	%Resolucion del sistema F1
	Za=[alpha,0];
	[T,Z] = rks4(F1,a,b,Za,M);
	U=Z(:,1);
  
	%Resolucion del sistema F2
	Za=[0,1];
	[T,Z] = rks4(F2,a,b,Za,M);
	V=Z(:,1);
  
	%Calculo de la solucion del problema de contorno
	X=U+(beta-U(M+1))*V/V(M+1);
  

  Y=zeros(M-1,1); % Solucion exacta iniciaizacion
  Z=zeros(M-1,1); % Error inicialiazcion

   i=0;
  const = (b-a)/M; %Calculo aumento
  for k=1: M+1 %inicio for
    Y(k)= f(i); % Calculo solucion exacta
    Z(k)= Y(k) - X(k) -20; %Calculo del error
    i+= const;
  endfor % fin for 

	L=[T' X Y Z]; %resultado
	
endfunction
