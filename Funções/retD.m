% Fun��o porta ou ret�ngulo unit�rio

function y = retD(N,n)
  if N == round(N)
    y = double(abs(n)<=abs(N));
  else
    disp('Em retD, o par�metro N n�o � um inteiro.');
  endif
endfunction