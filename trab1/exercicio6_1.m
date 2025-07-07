%Exercicio 6.1 codigo: 
% Primeiro, voc� precisa ter as fun��es dir2cas, casfiltr e cas2dir salvas como 
% arquivos .m no mesmo diret�rio em que voc� vai rodar o seu script,
% ou em um diret�rio que esteja no path do MATLAB.


% Define os coeficientes do numerador e denominador do filtro na forma direta
b = [1 -3 11 -27 18];
a = [16 12 2 -4 -1];

% Converte a forma direta para a forma em cascata
% b0: coeficiente de ganho
% B: matriz de coeficientes do numerador das se��es em cascata
% A: matriz de coeficientes do denominador das se��es em cascata
[b0, B, A] = dir2cas(b, a);

% Exibe os resultados
disp('b0 = ');
disp(b0);

disp('B = ');
disp(B);

disp('A = ');
disp(A);