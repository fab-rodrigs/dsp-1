% Este script:
% 
% Usa a DTFT (função feita a parte, deve estar no mesmo arquivo) para obter o espectro contínuo do sinal amostrado.
% Apresenta os gráficos da magnitude e da fase (em graus) em função da frequência normalizada.
% Está ajustado para T_s = 0.1 ms.


% P0319a: x_a(t) = sin(1000*pi*t + pi/4); T_s = 0.1 ms
clc; clear all; close all;

%% Parâmetros do sinal
%caso 1) 
Ts = 0.0001;                         % Intervalo de amostragem (0.1 ms)
%% caso 2)
% Ts = 0.001;                          % Intervalo de amostragem (1 ms=0.001s)
%% caso 3)
%Ts = 0.01;                        % Intervalo de amostragem (10 ms=0.01s)
%% Continuação dos parâmetros do sinal
n = -250:250;                       % Índice de amostragem
x = sin(1000*pi*n*Ts );       % Sinal amostrado x[n]

%% Espectro no domínio da frequência normalizada
w = linspace(-pi, pi, 501);         % Vetor de frequência
X = dtft(x, n, w);                  % DTFT do sinal
magX = abs(X);                      % Magnitude
phaX = angle(X);                    % Fase

% Plot do espectro
LFS = 12;                           % Tamanho da fonte dos eixos
TFS = 11;                           % Tamanho da fonte dos títulos

Hf_1 = figure;
set(Hf_1, 'NumberTitle', 'off', 'Name', 'P0319a');

% Plot da magnitude
subplot(2,1,1);
plot(w/pi, magX, 'LineWidth', 1.5);
axis([-1 1 0 300]);
xlabel('\omega / \pi','FontSize',LFS);
ylabel('|X(\omega)|','FontSize',LFS);

%Caso 1
title('Magnitude response x_1[n] = sin(1000\pi n T_s), T_s = 0.1 ms', 'FontSize', TFS);
%Caso 2
% title('Magnitude response x_2[n] = sin(1000\pi n T_s), T_s = 1 ms', 'FontSize', TFS);
%Caso 3
% title('Magnitude response x_3[n] = sin(1000\pi n T_s), T_s = 10 ms', 'FontSize', TFS);

grid on;
set(gca, 'XTick', -1:0.2:1);
set(gca, 'YTick', 0:100:300);

% Plot da fase
subplot(2,1,2);
plot(w/pi, phaX*180/pi, 'LineWidth', 1.5);  % Converte para graus
axis([-1 1 -180 180]);
xlabel('\omega / \pi','FontSize',LFS);
ylabel('Phase (Degrees)','FontSize',LFS);
% caso 1, mudar o valor de Ts para os demais gráficos
title('Phase response x_1[n] = sin(1000\pi n T_s), T_s = 0.1 ms', 'FontSize', TFS);
grid on;
set(gca, 'XTick', -1:0.2:1);
set(gca, 'YTick', -180:60:180);


