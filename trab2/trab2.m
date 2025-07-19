
% Projetar um filtro FIR passa-baixas digital para ser utilizado em um sistema embarcado de aquisição de sinais biomédicos. O filtro deve atender os seguintes requisitos:
%
%     Frequência de amostragem (Fs): 2000 Hz
%
%     Frequência de corte (Fc): 500 Hz
%
%     Ordem do filtro (N): 40
%
%     Tipo do filtro: FIR passa-baixas linear fase
%
%     Método de projeto: Janela
%
% a) Janela Retangular
%
% Para cada janela:
%
%     Calcule a resposta ideal do filtro FIR (sinc ideal)
%
%     Aplique a janela correspondente
%
%     Plote a resposta em frequência
%
%     Compare as janelas em termos de largura da banda de transição e atenuação lateral
%       O uso de janelas permite controlar o compromisso entre largura da banda de transição
%       e rejeição fora da banda. A janela Retangular possui uma transição mais abrupta, mas
%       alta distorção (ripple). Já janelas como a Blackman têm melhor supressão das frequências
%       indesejadas, mas uma transição mais suave (menos precisa).

%% Parâmetros do filtro
Fs = 2000;           % Frequência de amostragem (Hz)
Fc = 500;            % Frequência de corte (Hz)
N = 40;              % Ordem do filtro
wc = 2 * pi * Fc / Fs;
n = 0:N;

%% Resposta ideal (sinc)
hd = (sin(wc * (n - N/2)) ./ (pi * (n - N/2)));
hd(N/2+1) = wc/pi;  % Corrige divisão por zero

%% Sinal de entrada: seno de 300 Hz (passa) + 800 Hz (deve ser atenuado)
t = 0:1/Fs:0.05;  % 50 ms
x = sin(2*pi*300*t) + sin(2*pi*800*t);

%% Lista de janelas
janelas = {
    'Retangular', rectwin(N+1);
};

nome = janelas{1, 1};
w = janelas{1, 2};
h = hd .* w';  % filtro final

% Filtra o sinal
y = filter(h, 1, x);

% Resposta em frequência
[Hf, f] = freqz(h, 1, 1024, Fs);

figure('Name', ['Filtro FIR - Janela ', nome], 'NumberTitle', 'off');

% Subplot 1: Forma da janela
subplot(2,2,1);
plot(w, 'LineWidth', 1.2);
title(['Janela ', nome]);
xlabel('Amostra'); ylabel('Amplitude'); grid on;

% Subplot 2: Resposta ao impulso
subplot(2,2,2);
stem(h, 'filled');
title('Resposta ao impulso h[n]');
xlabel('n'); ylabel('Amplitude'); grid on;

% Subplot 3: Resposta em frequência
subplot(2,2,3);
plot(f, 20*log10(abs(Hf)));
grid on;
axis([0 Fs/2 -100 5]);
title('Resposta em frequência do filtro');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');

% Subplot 4: Sinal de entrada e saída
subplot(2,2,4);
plot(t, x, '--k'); hold on;
plot(t, y, 'b');
title('Sinal filtrado vs. entrada');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Entrada', 'Saída filtrada');
grid on;


