% Função triângulo simétrico de largura 2N+1
% Domínio similar ao da função retângulo

function y = triD(N,n)
  if N == round(N)
    y = rmpD(n+N)-2*rmpD(n)+rmpD(n-N);
  else
    disp('Em triD, o parâmetro N não é um inteiro.');
  endif
endfunction