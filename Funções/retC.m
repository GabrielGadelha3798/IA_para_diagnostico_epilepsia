% Função porta ou retângulo unitário

function y = retC(T,t)
  y = uC(t + T/2) - uC(t - T/2);
endfunction