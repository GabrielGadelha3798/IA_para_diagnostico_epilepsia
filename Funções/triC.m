% Função triângulo simétrico de largura 2T

function y = triC(T,t)
  y = rmpC(t + T/2) - 2*rmpC(t) + rmpC(t - T/2);
endfunction