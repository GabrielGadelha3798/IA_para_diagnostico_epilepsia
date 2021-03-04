##fs = 500; ## amostragem, 1s=500pnts % Tirar o P3 que o T0 é so metade
#url= '/opt/Epilepsy_database';
 url= 'C:/Users/gaabr/Desktop/IA/Projeto';
%P = {"2","3","4","5","6","7","9","10"};

## FUNÇÃO PARA ABRIR ARQUIVOS
P = {"2","3","4","5","6","7","9","10"};
for p = 1:length(P)
switch P{p}	case {"1" "3" "5" "6" "9" "10" "13" }	sexo = 'f';	case {"2" "4" "7" "8" "11" "12" "14"}	sexo = 'm'; end
open(strcat(url, "/P", P{p}, "_", sexo, "/T0_p", P{p}, ".mat")); T0 = X; 
open(strcat(url, "/P", P{p}, "_", sexo, "/T1_p", P{p}, ".mat")); T1 = X;

% extrai parte do sinal durante SONO (15-25min) e ESTIMULO (40-50min) do paciente durante periodo de 10min no intervalo de: 
SonoT0 = T0(((4.5)*(10^5)):((7.5)*(10^5)),:); SonoT1 = T1(((3)*(10^5)):((6)*(10^5)),:);
 
## F: Vetor de string usado para chamar as funções
F = {"energiaD","std","mean","range","kurtosis","skewness","var","potenciaD", "mode","median","iqr","meansq","quantile","quantile"};

for b = 1:300 ;fprintf('\nP: %s \tB: %d/300 \t',P{p},b);
## Função para pegar janelas de 500 pontos de cada sinal
janSonoT0 = SonoT0(1000*b - 500:1000*b,:); janSonoT1 = SonoT1(1000*b - 500:1000*b,:); %divisao com/sem estimulo  
## Função para reorganizar os 20 canais de 500 pontos em 1 canal de (500*20) pontos
janSonoT0 = reshape(janSonoT0,1,[]); janSonoT1 = reshape(janSonoT1,1,[]); %janelas em 1 linha
## Transformada de Wavlet
wavSonoT0 = TransformadaWaveletHaar(janSonoT0,3); wavSonoT1 = TransformadaWaveletHaar(janSonoT1,3); %wavlet com 3 niveis

%calculo atributos: cada nivel do wavlet é considerado um sinal diferente 
for c = 1:4 ; qua = ',0.25';
for f = 1:length(F) ;fprintf('.');
switch F{f}
	case "quantile"	ext = qua; qua = ',0.75';
	otherwise				ext = ''; end;
Atributos(b  + (p*600) -600 	+ 0	, c+ (4*f) - 4) 	= eval(strcat(F{f}, "(wavSonoT0(", num2str(c), ",:)", ext, ")"));
Atributos(b  + (p*600) -600		+ 300, c+ (4*f) - 4) = eval(strcat(F{f}, "(wavSonoT1(", num2str(c), ",:)", ext, ")"));
endfor
% Criando matriz com atributos para cada wavlet para todos os pacientes ao mesmo tempo e para o caso com e sem estimulo 
% Classes: 0 = sem estimulo; 1 = com estimulo
Atributos(b + (p*600) -600 + 0,   (length(F)*4) +1 ) = 0;
Atributos(b + (p*600) -600 + 300, (length(F)*4) +1 ) = 1;
endfor;endfor;endfor;fprintf('\n');
