#f = inline(" 30*(cosh(24.3975*(0.1-x))/(cosh(24.3975*0.1) - 20","x");

f= inline("24.3975*(0.1-x)","x");

g=inline ("(cosh(x)*30/5.7787) + 20","x");

x=(0:0.01:0.1);
y=zeros(1,11);
y1=zeros(1,11);

for i=1:11
  y1(i)=f(x(i));
  y(i)=g(y1(i));
endfor




figure
  hold on#inicia la figura
  
  title("Solucion Analitica"); #titulo
  plot (x,y );#grafica las funcion con linea y los puntos con 'o'
  xlabel('Longitud (m)');#titulo eje x
  ylabel('Temperatura (C)');#titulo eje y
  
  
  hold off #fin figura
  