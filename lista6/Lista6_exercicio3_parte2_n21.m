% x(n)=n?(0.9)n,0?n?20
% 
% Você criou dois gráficos: um com N=21 (mesmo tamanho da sequência) 
%e outro com N=81 (maior resolução espectral).

n = 0:20;                           % Vetor de tempo de 0 a 20
x = n .* (0.9).^n;                  % Sequência x(n) = n*(0.9)^n

N = 21;                             % Tamanho da DFT
x = [x, zeros(1,N-length(x))];     % Zerar até tamanho N

X = fft(x, N);                     % Cálculo da DFT
k = 0:N-1;                          % Índices da DFT

magX = abs(X);                      % Magnitude da DFT
phaX = angle(X);                    % Fase da DFT

figure;
subplot(2,1,1);
plot(k, magX, 'b', 'LineWidth', 1.5);
title('Magnitude da DFT (x2): N=21');
xlabel('k'); ylabel('|X(k)|');
grid on;

subplot(2,1,2);
plot(k, phaX, 'r', 'LineWidth', 1.5);
title('Fase da DFT (x2): N=21');
xlabel('k'); ylabel('Fase (rad)');
grid on;
