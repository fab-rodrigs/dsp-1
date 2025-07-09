function y = cirshftt(x, m, N)
    % CIRSHFTT - Realiza o deslocamento circular de uma sequ�ncia x
    %
    % y = cirshftt(x, m, N)
    %
    % Esta fun��o aplica um deslocamento circular de m amostras � sequ�ncia x,
    % considerando um buffer de tamanho N. O deslocamento � feito no dom�nio do tempo.
    %
    % Entradas:
    %   x - sequ�ncia de entrada com comprimento <= N
    %   m - n�mero de amostras para deslocar circularmente
    %   N - tamanho do buffer circular
    %
    % Sa�da:
    %   y - sequ�ncia de sa�da com o deslocamento circular aplicado

    if length(x) > N
        error('N deve ser maior ou igual ao comprimento de x');
    end
    
    x = [x, zeros(1, N - length(x))];       % Preenchimento com zeros
    n = mod((0:N-1) - m, N);                % �ndices deslocados circularmente
    y = x(n + 1);                           % MATLAB usa �ndice come�ando em 1
end
