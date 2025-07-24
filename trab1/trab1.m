%% 1. SIMULAR O SINAL DO SENSOR
fs = 10;
t = 0:1/fs:10;
N = length(t);

temp_real = 25 + 0.5 * sin(2*pi*0.2*t);
ruido = 0.4 * randn(1, N);
temp_sensor = temp_real + ruido;

%% 2. DEFINIR O FILTRO IIR
a1 = 0.9;
b0 = 0.1;
b = [b0];
a = [1 -a1];
temp_filtrada = filter(b, a, temp_sensor); % filtro

%% 3. PLOTAR
figure;
plot(t, temp_sensor, 'r--', 'DisplayName', 'Sinal com Ruído');
hold on;
plot(t, temp_filtrada, 'b', 'LineWidth', 1.5, 'DisplayName', 'Sinal Filtrado');
plot(t, temp_real, 'g', 'LineWidth', 1.2, 'DisplayName', 'Sinal Real');
xlabel('Tempo (s)');
ylabel('Temperatura (°C)');
title('Filtro IIR aplicado à leitura de sensor com ruído');
legend;
grid on;

