% Exercicio 5.3 - Parte 2 (N = 80)

n = 0:19;
x = 5 * sin(0.1 * pi * n);
zero = zeros(1,60); % 60 zeros
x2 = [x, zero];     % sequência de 80 amostras

N = 80;
k = 0:N-1;

X2 = fft(x2, N);           % cálculo da FFT
magX2 = abs(X2);           % magnitude
phaX2 = angle(X2);         % fase (em radianos)

% Plotagem
figure;
subplot(2,1,1);
stem(k, magX2, 'filled');
title('Magnitude da DFS (x_2)');
xlabel('k');
ylabel('|X(k)|');
grid on;

subplot(2,1,2);
stem(k, phaX2, 'filled');
title('Fase da DFS (x_2)');
xlabel('k');
ylabel('Radianos');
grid on;
