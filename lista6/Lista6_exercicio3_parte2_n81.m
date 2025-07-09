% x(n)=n?(0.9)n,0?n?20
% 
% Você criou dois gráficos: um com N=21 (mesmo tamanho da sequência) 
%e outro com N=81 (maior resolução espectral).

n = 0:20;
x = n .* (0.9).^n;

N = 81;                              % Tamanho maior da DFT
x = [x, zeros(1,N-length(x))];      % Preenchimento com zeros

X = fft(x, N);
k = 0:N-1;

magX = abs(X);
phaX = angle(X);

figure;
subplot(2,1,1);
plot(k, magX, 'b', 'LineWidth', 1.5);
title('Magnitude da DFT (x2): N=81');
xlabel('k'); ylabel('|X(k)|');
grid on;

subplot(2,1,2);
plot(k, phaX, 'r', 'LineWidth', 1.5);
title('Fase da DFT (x2): N=81');
xlabel('k'); ylabel('Fase (rad)');
grid on;

