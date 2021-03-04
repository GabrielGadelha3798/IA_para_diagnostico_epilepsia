% Transformada de Wavelets de Haar usando o Algoritmo de Mallat

function TW = TransformadaWaveletHaar(Janela, Niveis) 
  
% Transformada de Wavelets
% Niveis: Número de níveis da transformada, resultando (Niveis + 1) componentes.

x = Janela;
TW = zeros(Niveis + 1, length(x));  

for i = 1:Niveis
  % u: aproximação
  % v: detalhe
  FPB = (1/3).*[1 1 1];
  FPA = [2 -1 -1];
  u = filter(FPB, 1, x);
  v = filter(FPA, 1, x);
  TW(i, :) = v(:);           %Detalhe está em TW(i,:), sendo i=1,2,3,4,5,...,Niveis
  x = u;
endfor
TW(Niveis + 1, :) = u;

endfunction