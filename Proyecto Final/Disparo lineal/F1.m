function Z = F1(t,Z)
  
	x=Z(1);
	y=Z(2);
 

	Z=[y,(((200*2*pi*0.004)/(164*pi*0.004^2)*x))];
endfunction
