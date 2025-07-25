% Filtro Elíptico Passa-Baixa


% parâmetros do filtro
Omega_p = 0.25 * pi; % frequência de passagem (rad/amostra)
Omega_s = 0.35 * pi; % frequência de rejeição (rad/amostra)
Rp = 1;              % ripple banda passagem (dB)
As = 40;             % atenuação banda de rejeição (dB)

% normalizando das frequências(onde 1 corresponde a pi rad/amostra)
Wp = Omega_p / pi;
Ws = Omega_s / pi;

% 1. Calcular a ordem do filtro (N) e a frequência de corte (Wn)
% A função ellipord retorna a ordem mínima necessária e a frequência de corte natural do filtro
[N, Wn] = ellipord(Wp, Ws, Rp, As);

fprintf('Filtro Elíptico:\n');
fprintf('Ordem calculada do filtro (N): %d\n', N);
fprintf('Frequência de corte normalizada (Wn): %f * pi rad/amostra\n', Wn);

% 2. Projetar o filtro Elíptico
% A função ellip retorna os coeficientes do numerador (b) e do denominador (a)
% da função de transferência do filtro digital.
[b, a] = ellip(N, Rp, As, Wn);

% 3. Plotar as figuras

% Vetor de frequências para plotagem (de 0 a pi rad/amostra)
[H, w] = freqz(b, a, 1024, 'whole'); % 1024 pontos, 'whole' para 0 a pi
w_norm = w / pi; % Normaliza a frequência para unidades de pi rad/amostra

% Figura 1: Magnitude Linear
figure;
plot(w_norm, abs(H));
title('Filtro Elíptico: Resposta de Magnitude Linear');
xlabel('Frequência Normalizada (\times \pi rad/amostra)');
ylabel('Magnitude |H(e^{j\omega})|');
grid on;
xlim([0 max(w_norm)]); % Ajusta o limite do eixo X para ir até o máximo normalizado
ylim([0 1.1]); % Ajusta o limite do eixo Y para melhor visualização

% Figura 2: Magnitude em dB
figure;
plot(w_norm, 20*log10(abs(H)));
title('Filtro Elíptico: Resposta de Magnitude em dB');
xlabel('Frequência Normalizada (\times \pi rad/amostra)');
ylabel('Magnitude em dB');
grid on;
xlim([0 max(w_norm)]); % Ajusta o limite do eixo X
hold on;
% Adicionar linhas de referência para Rp e As para melhor visualização
line([0 Wp], [-Rp -Rp], 'Color', 'r', 'LineStyle', '--'); % Linha do ripple da banda de passagem
line([Ws max(w_norm)], [-As -As], 'Color', 'r', 'LineStyle', '--'); % Linha da atenuação da banda de rejeição
hold off;

% Figura 3: Resposta de Fase
figure;
plot(w_norm, angle(H));
title('Filtro Elíptico: Resposta de Fase');
xlabel('Frequência Normalizada (\times \pi rad/amostra)');
ylabel('Fase (radianos)');
grid on;
xlim([0 max(w_norm)]); % Ajusta o limite do eixo X

% Figura 4: Resposta ao Impulso
figure;
% impz retorna a resposta ao impulso h e o vetor de tempo t
[h, t] = impz(b, a);
stem(t, h); % Usar stem para resposta de impulso discreta
title('Filtro Elíptico: Resposta ao Impulso');
xlabel('Amostras (n)');
ylabel('Amplitude h[n]');
grid on;
