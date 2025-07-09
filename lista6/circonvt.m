function y = circonvt(x1, x2, N)
    % CIRCONVT - Calcula a convolu��o circular de duas sequ�ncias no dom�nio do tempo
    %
    % y = circonvt(x1, x2, N)
    %
    % Esta fun��o realiza a convolu��o circular de x1 com x2 utilizando um buffer
    % de tamanho N. A opera��o � feita no dom�nio do tempo usando uma matriz de
    % deslocamento circular de x2 invertido.
    %
    % Entradas:
    %   x1 - primeira sequ�ncia de entrada (comprimento <= N)
    %   x2 - segunda sequ�ncia de entrada (comprimento <= N)
    %   N  - tamanho do buffer circular
    %
    % Sa�da:
    %   y - sequ�ncia resultante da convolu��o circular

    if length(x1) > N
        error('N deve ser >= ao comprimento de x1');
    end
    if length(x2) > N
        error('N deve ser >= ao comprimento de x2');
    end

    x1 = [x1, zeros(1, N - length(x1))];                 % Preenchimento de x1
    x2 = [x2, zeros(1, N - length(x2))];                 % Preenchimento de x2
    x2 = x2(mod(- (0:N-1), N) + 1);                      % Invers�o circular de x2

    H = zeros(N, N);                                     % Inicializa matriz de convolu��o
    for n = 0:N-1
        H(n+1, :) = cirshftt(x2, n, N);                  % Cada linha � x2 circularmente deslocado
    end

    y = x1 * H';                                         % Produto vetorial (convolu��o circular)
end
