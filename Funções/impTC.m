% Funçãoo impulso periódico unitário

function y = impTC(T,t)
  y = double(t/T == round(t/T));
endfunction