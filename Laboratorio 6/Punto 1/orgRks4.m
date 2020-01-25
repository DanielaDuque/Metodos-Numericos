function R = orgRks4(F,a,b,Za,M)
	#F es la funcion que esta como una cadena de caracteres
	#a y b son los extremos derecho e izquierdo del intervalo
	#Za es la condicion inicial
	#M es el numero de pasos
	#resultados
	#T es el vector de los nodos
	#Z=[x1(t)...x(n)] donde xk(t) es la aproximacion a la k esima variable dependiente

	h=(b-a)/M;
	T=zeros(1,M+1);
	
	T=a:h:b;
	Y(1)=Za

	for j=1:M
		k1=h*feval(F,T(j),Y(j));
		k2=h*feval(F,T(j)+h/2,Y(j)+k1/2);
		k3=h*feval(F,T(j)+h/2,Y(j)+k2/2);
		k4=h*feval(F,T(j)+h,Y(j)+k3);
		Y(j+1)=Y(j)+(k1+2*k2+2*k3+k4)/6
	endfor
  [T' Y']
	
endfunction