% Função porta ou retângulo unitário

function y = retD(N,n)
  if N == round(N)
    y = double(abs(n)<=abs(N));
  else
    disp('Em retD, o parâmetro N não é um inteiro.');
  endif
endfunction