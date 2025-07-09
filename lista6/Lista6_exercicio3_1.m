% A função x(n)=(0.6)?n?x(n)=(0.6)?n? limitada ao intervalo ?10?n?10.
% 
%     O termo u(n+10)?u(n?11) garante essa janela de tempo.
% 
%     ?n? faz com que a sequência seja simétrica ao redor de n=0.
% 
% 
% Resultado Esperado
% 
%     Magnitude com um pico claro devido à simetria da sequência 
%     (comportamento de tipo exponencial decrescente).
% 
%     Fase contínua (sem saltos), com forma suave já que o sinal é 
%     real e par ? espera-se uma fase nula ou próxima disso (exceto por ruídos numéricos).


% Faixa de tempo
n = -10:10;
x = (0.6).^abs(n);         % x(n) = (0.6)^|n|, simétrica em n=0

N = 200;                   % Tamanho da DFT — grande o suficiente para boa resolução
x = [x(11:end), zeros(1,N - length(n)), x(1:10)]; 
% x(11:end): n de 0 a 10 | x(1:10): n de -10 a -1
% A sequência x(n) é centrada em n=0, por isso rearranjamos como n >= 0 seguido de n < 0

X = fft(x, N);             % Calcula a DFT
w = (0:N/2)*2*pi/N;        % Frequência normalizada

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
