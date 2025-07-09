% x(n)=n?(0.9)n,0?n?20
% 
% Voc� criou dois gr�ficos: um com N=21 (mesmo tamanho da sequ�ncia) 
%e outro com N=81 (maior resolu��o espectral).

n = 0:20;                           % Vetor de tempo de 0 a 20
x = n .* (0.9).^n;                  % Sequ�ncia x(n) = n*(0.9)^n

N = 21;                             % Tamanho da DFT
x = [x, zeros(1,N-length(x))];     % Zerar at� tamanho N

X = fft(x, N);                     % C�lculo da DFT
k = 0:N-1;                          % �ndices da DFT

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
