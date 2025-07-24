
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
x = 0.6*sin(2*pi*300*t) + 0.3*sin(2*pi*1000*t) + 0.2*randn(size(t));

w = rectwin(N + 1);
h = hd .* w';  % filtro final

% Filtra o sinal
y = filter(h, 1, x);

% Resposta em frequência
[Hf, f] = freqz(h, 1, 1024, Fs);

% Janela
subplot(2,2,1);
stem(w);
title('Janela Retangular');

% Resposta ao impulso
subplot(2,2,2);
stem(h);
title('Resposta ao Impulso');

% Resposta em frequência
[Hf, f] = freqz(h, 1, 1024, Fs);
subplot(2,2,3);
plot(f, 20*log10(abs(Hf)));
title('Resposta em Frequência (dB)');
xlabel('Hz'); ylabel('Magnitude (dB)');
grid on;

% Sinal de entrada e saída
subplot(2,2,4);
plot(t, x, '--k'); hold on;
plot(t, y, 'b');
title('Entrada vs Saída');
legend('Entrada', 'Filtrado');
xlabel('Tempo (s)');

grid on;


