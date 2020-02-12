function [T,Z] = rks4(F,a,b,Za,M)
	#F es la funcion que esta como una cadena de caracteres
	#a y b son los extremos derecho e izquierdo del intervalo
	#Za es la condicion inicial
	#M es el numero de pasos
	#resultados
	#T es el vector de los nodos
	#Z=[x1(t)...x(n)] donde xk(t) es la aproximacion a la k esima variable dependiente

  
  % inicializacion variable
	h=(b-a)/M;
	T=zeros(1,M+1);
	Z=zeros(M+1,length(Za));
	T=a:h:b;
	Z(1,:)=Za;

 %Calculo solucion por el metodo 
	for j=1:M
		k1=h*feval(F,T(j),Z(j,:));
		k2=h*feval(F,T(j)+h/2,Z(j,:)+k1/2);
		k3=h*feval(F,T(j)+h/2,Z(j,:)+k2/2);
		k4=h*feval(F,T(j)+h,Z(j,:)+k3);
		Z(j+1,:)=Z(j,:)+(k1+2*k2+2*k3+k4)/6;
	endfor
	
endfunction