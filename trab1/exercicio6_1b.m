% --- 1. Definir os Coeficientes do Filtro (Forma Direta) ---
% Estes são os mesmos coeficientes do Exercício 6.1
b = [1 -3 11 -27 18];
a = [16 12 2 -4 -1];

% --- 2. Converter para a Forma em Cascata ---
% Usa a função dir2cas para obter o ganho b0 e as matrizes B e A
[b0, B, A] = dir2cas(b, a);

% --- 3. Gerar o Impulso Unitário ---
% Vamos calcular as primeiras 8 amostras. O impulso unitário tem valor 1 na
% primeira posição e 0 nas demais.
num_amostras = 8;
impulso = zeros(1, num_amostras);
impulso(1) = 1;

% --- 4. Calcular a Resposta ao Impulso Usando a Forma Direta ---
% A função 'filter' do MATLAB pode ser usada diretamente com os coeficientes
% da forma direta para encontrar a resposta ao impulso.
h_direta = filter(b, a, impulso);

% --- 5. Calcular a Resposta ao Impulso Usando a Forma em Cascata ---
% Usa a função 'casfiltr' para processar o impulso unitário com a estrutura em cascata.
h_cascata = casfiltr(b0, B, A, impulso);

% --- 6. Exibir e Comparar os Resultados ---
disp('--- Resposta ao Impulso (Forma Direta) ---');
disp(h_direta);

disp('--- Resposta ao Impulso (Forma em Cascata) ---');
disp(h_cascata);

disp('--- Diferença Absoluta entre as Respostas ---');
disp(abs(h_direta - h_cascata));

% --- 7. Verificação Visual (Opcional) ---
% Você também pode plotar as respostas para uma verificação visual.
figure;
stem(0:num_amostras-1, h_direta, 'b', 'DisplayName', 'Forma Direta');
hold on;
stem(0:num_amostras-1, h_cascata, 'ro', 'DisplayName', 'Forma em Cascata');
title('Comparação da Resposta ao Impulso');
xlabel('Amostra (n)');
ylabel('Amplitude');
legend;
grid on;
hold off;

% --- 8. Confirmação Numérica ---
% Uma forma programática de verificar se são (quase) idênticas.
% Use uma pequena tolerância para lidar com possíveis erros de ponto flutuante.
tolerancia = 1e-9;
if all(abs(h_direta - h_cascata) < tolerancia)
    disp('As respostas ao impulso das duas formas são praticamente idênticas. A conversão está CORRETA!');
else
    disp('As respostas ao impulso das duas formas SÃO DIFERENTES. Pode haver um erro na conversão.');
end