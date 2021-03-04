% Função sinal

function y = sgn(n)
  y = double(n > 0) - double(n < 0);
endfunction