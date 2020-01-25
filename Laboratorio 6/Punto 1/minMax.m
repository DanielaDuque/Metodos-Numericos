function [low,high] = minMax(x)
		low = x(1);
		high = x(1);
		for i = 2:length(x),
				if x(i)<low,
					%low = x(i);
				elseif x(i)>high,
					high = x(i); 
    endif
   endfor
	 low = mini(x);
endfunction
