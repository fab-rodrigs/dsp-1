% Exercicio 5.3 - Parte 1 (N = 40)

n = 0:19;
x = 5 * sin(0.1 * pi * n);
zero = zeros(1,20); % 20 zeros
x1 = [x, zero];     % sequência de 40 amostras

N = 40;
k = 0:N-1;

X1 = fft(x1, N);           % cálculo da FFT
magX = abs(X1);            % magnitude
phaX = angle(X1);          % fase (em radianos)

% Plotagem
figure;
subplot(2,1,1);
stem(k, magX, 'filled');
title('Magnitude da DFS (x_1)');
xlabel('k');
ylabel('|X(k)|');
grid on;

subplot(2,1,2);
stem(k, phaX, 'filled');
title('Fase da DFS (x_1)');
xlabel('k');
ylabel('Radianos');
grid on;
