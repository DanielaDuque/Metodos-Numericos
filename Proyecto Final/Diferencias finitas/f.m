function value = f (x)
  
  #value1=24.3975*(0.1-x);
  #value= (cosh(value1)*30/5.7787) + 20;
  
  
  alpha = sqrt((200*2*pi*0.004)/(164*pi*0.004^2));
  value1=alpha*(0.1-x);
  dec=alpha*0.1;
  value= 30*(cosh(value1)/cosh(dec)) + 20;

endfunction
