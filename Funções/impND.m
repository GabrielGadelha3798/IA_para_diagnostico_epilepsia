% Funçãoo impulso periódico unitário

function y = impND(N,n)
  if N == round(N)
    y = double(n/N==round(n/N));
  else
    disp('Em retD, o par�metro per�odo N n�o � um inteiro.');
  endif
endfunction