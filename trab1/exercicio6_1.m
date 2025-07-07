%Exercicio 6.1 codigo: 
% Primeiro, você precisa ter as funções dir2cas, casfiltr e cas2dir salvas como 
% arquivos .m no mesmo diretório em que você vai rodar o seu script,
% ou em um diretório que esteja no path do MATLAB.


% Define os coeficientes do numerador e denominador do filtro na forma direta
b = [1 -3 11 -27 18];
a = [16 12 2 -4 -1];

% Converte a forma direta para a forma em cascata
% b0: coeficiente de ganho
% B: matriz de coeficientes do numerador das seções em cascata
% A: matriz de coeficientes do denominador das seções em cascata
[b0, B, A] = dir2cas(b, a);

% Exibe os resultados
disp('b0 = ');
disp(b0);

disp('B = ');
disp(B);

disp('A = ');
disp(A);