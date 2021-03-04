% Função degrau unitário discretizada

function y = uC(t)
  y = double(t >= 0);
endfunction