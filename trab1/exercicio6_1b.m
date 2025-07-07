% --- 1. Definir os Coeficientes do Filtro (Forma Direta) ---
% Estes s�o os mesmos coeficientes do Exerc�cio 6.1
b = [1 -3 11 -27 18];
a = [16 12 2 -4 -1];

% --- 2. Converter para a Forma em Cascata ---
% Usa a fun��o dir2cas para obter o ganho b0 e as matrizes B e A
[b0, B, A] = dir2cas(b, a);

% --- 3. Gerar o Impulso Unit�rio ---
% Vamos calcular as primeiras 8 amostras. O impulso unit�rio tem valor 1 na
% primeira posi��o e 0 nas demais.
num_amostras = 8;
impulso = zeros(1, num_amostras);
impulso(1) = 1;

% --- 4. Calcular a Resposta ao Impulso Usando a Forma Direta ---
% A fun��o 'filter' do MATLAB pode ser usada diretamente com os coeficientes
% da forma direta para encontrar a resposta ao impulso.
h_direta = filter(b, a, impulso);

% --- 5. Calcular a Resposta ao Impulso Usando a Forma em Cascata ---
% Usa a fun��o 'casfiltr' para processar o impulso unit�rio com a estrutura em cascata.
h_cascata = casfiltr(b0, B, A, impulso);

% --- 6. Exibir e Comparar os Resultados ---
disp('--- Resposta ao Impulso (Forma Direta) ---');
disp(h_direta);

disp('--- Resposta ao Impulso (Forma em Cascata) ---');
disp(h_cascata);

disp('--- Diferen�a Absoluta entre as Respostas ---');
disp(abs(h_direta - h_cascata));

% --- 7. Verifica��o Visual (Opcional) ---
% Voc� tamb�m pode plotar as respostas para uma verifica��o visual.
figure;
stem(0:num_amostras-1, h_direta, 'b', 'DisplayName', 'Forma Direta');
hold on;
stem(0:num_amostras-1, h_cascata, 'ro', 'DisplayName', 'Forma em Cascata');
title('Compara��o da Resposta ao Impulso');
xlabel('Amostra (n)');
ylabel('Amplitude');
legend;
grid on;
hold off;

% --- 8. Confirma��o Num�rica ---
% Uma forma program�tica de verificar se s�o (quase) id�nticas.
% Use uma pequena toler�ncia para lidar com poss�veis erros de ponto flutuante.
tolerancia = 1e-9;
if all(abs(h_direta - h_cascata) < tolerancia)
    disp('As respostas ao impulso das duas formas s�o praticamente id�nticas. A convers�o est� CORRETA!');
else
    disp('As respostas ao impulso das duas formas S�O DIFERENTES. Pode haver um erro na convers�o.');
end