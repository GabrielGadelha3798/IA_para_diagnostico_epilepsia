% Função rampa unitária

function y = rmpC(t)
  y = t.*double(t >= 0);
endfunction