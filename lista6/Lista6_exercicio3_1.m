% A fun��o x(n)=(0.6)?n?x(n)=(0.6)?n? limitada ao intervalo ?10?n?10.
% 
%     O termo u(n+10)?u(n?11) garante essa janela de tempo.
% 
%     ?n? faz com que a sequ�ncia seja sim�trica ao redor de n=0.
% 
% 
% Resultado Esperado
% 
%     Magnitude com um pico claro devido � simetria da sequ�ncia 
%     (comportamento de tipo exponencial decrescente).
% 
%     Fase cont�nua (sem saltos), com forma suave j� que o sinal � 
%     real e par ? espera-se uma fase nula ou pr�xima disso (exceto por ru�dos num�ricos).


% Faixa de tempo
n = -10:10;
x = (0.6).^abs(n);         % x(n) = (0.6)^|n|, sim�trica em n=0

N = 200;                   % Tamanho da DFT � grande o suficiente para boa resolu��o
x = [x(11:end), zeros(1,N - length(n)), x(1:10)]; 
% x(11:end): n de 0 a 10 | x(1:10): n de -10 a -1
% A sequ�ncia x(n) � centrada em n=0, por isso rearranjamos como n >= 0 seguido de n < 0

X = fft(x, N);             % Calcula a DFT
w = (0:N/2)*2*pi/N;        % Frequ�ncia normalizada

% Magnitude e Fase
magX = abs(X(1:N/2+1));
phaX = angle(X(1:N/2+1))*180/pi;  % Convertendo fase para graus

% Plotagem
figure;
subplot(2,1,1);
plot(w/pi, magX, 'b', 'LineWidth', 1.5);
title('Magnitude da DTFT X(e^{j\omega})');
xlabel('\omega/\pi'); ylabel('|X(e^{j\omega})|'); grid on;

subplot(2,1,2);
plot(w/pi, phaX, 'r', 'LineWidth', 1.5);
title('Fase da DTFT X(e^{j\omega})');
xlabel('\omega/\pi'); ylabel('Fase (graus)'); grid on;
