function y = cirshftt(x, m, N)
    % CIRSHFTT - Realiza o deslocamento circular de uma sequência x
    %
    % y = cirshftt(x, m, N)
    %
    % Esta função aplica um deslocamento circular de m amostras à sequência x,
    % considerando um buffer de tamanho N. O deslocamento é feito no domínio do tempo.
    %
    % Entradas:
    %   x - sequência de entrada com comprimento <= N
    %   m - número de amostras para deslocar circularmente
    %   N - tamanho do buffer circular
    %
    % Saída:
    %   y - sequência de saída com o deslocamento circular aplicado

    if length(x) > N
        error('N deve ser maior ou igual ao comprimento de x');
    end
    
    x = [x, zeros(1, N - length(x))];       % Preenchimento com zeros
    n = mod((0:N-1) - m, N);                % Índices deslocados circularmente
    y = x(n + 1);                           % MATLAB usa índice começando em 1
end
