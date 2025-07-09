function y = circonvt(x1, x2, N)
    % CIRCONVT - Calcula a convolução circular de duas sequências no domínio do tempo
    %
    % y = circonvt(x1, x2, N)
    %
    % Esta função realiza a convolução circular de x1 com x2 utilizando um buffer
    % de tamanho N. A operação é feita no domínio do tempo usando uma matriz de
    % deslocamento circular de x2 invertido.
    %
    % Entradas:
    %   x1 - primeira sequência de entrada (comprimento <= N)
    %   x2 - segunda sequência de entrada (comprimento <= N)
    %   N  - tamanho do buffer circular
    %
    % Saída:
    %   y - sequência resultante da convolução circular

    if length(x1) > N
        error('N deve ser >= ao comprimento de x1');
    end
    if length(x2) > N
        error('N deve ser >= ao comprimento de x2');
    end

    x1 = [x1, zeros(1, N - length(x1))];                 % Preenchimento de x1
    x2 = [x2, zeros(1, N - length(x2))];                 % Preenchimento de x2
    x2 = x2(mod(- (0:N-1), N) + 1);                      % Inversão circular de x2

    H = zeros(N, N);                                     % Inicializa matriz de convolução
    for n = 0:N-1
        H(n+1, :) = cirshftt(x2, n, N);                  % Cada linha é x2 circularmente deslocado
    end

    y = x1 * H';                                         % Produto vetorial (convolução circular)
end
