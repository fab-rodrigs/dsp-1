function [b0,B,A] = dir2cas(b,a);
% Convers�o da forma DIRETA para a forma em CASCATA (vers�o cplxpair)
% -------------------------------------------------------------------
% [b0,B,A] = dir2cas(b,a)
% b0 = coeficiente de ganho
% B = matriz K por 3 de coeficientes reais contendo os bk's (numeradores das se��es)
% A = matriz K por 3 de coeficientes reais contendo os ak's (denominadores das se��es)
% b = coeficientes do polin�mio do numerador da forma DIRETA
% a = coeficientes do polin�mio do denominador da forma DIRETA

% Calcula o coeficiente de ganho b0
b0 = b(1); % O primeiro coeficiente de 'b' � o ganho inicial
b = b/b0;  % Normaliza o numerador
a0 = a(1); % O primeiro coeficiente de 'a' � o ganho do denominador
a = a/a0;  % Normaliza o denominador
b0 = b0/a0;% O ganho final � a raz�o dos ganhos iniciais

% Obt�m os comprimentos dos vetores de coeficientes
M = length(b); % Comprimento do numerador
N = length(a); % Comprimento do denominador

% Zera os vetores para que tenham o mesmo comprimento
if N > M
    b = [b zeros(1,N-M)]; % Adiciona zeros ao final de 'b' se 'a' for mais longo
elseif M > N
    a = [a zeros(1,M-N)]; % Adiciona zeros ao final de 'a' se 'b' for mais longo
    N = M;                % Atualiza o comprimento de 'N' para corresponder a 'M'
end

% Inicializa as matrizes B e A para armazenar os coeficientes das se��es
K = floor(N/2); % Calcula o n�mero de se��es de segunda ordem (metade do comprimento)
B = zeros(K,3); % Matriz para os numeradores das se��es (K linhas, 3 colunas)
A = zeros(K,3); % Matriz para os denominadores das se��es (K linhas, 3 colunas)

% Se o n�mero de coeficientes for �mpar, adiciona um zero para garantir que todos os pares sejam processados
if K*2 == N;
    b = [b 0]; % Adiciona um zero ao final de 'b' se 'N' for par, para formar um par com um zero extra
    a = [a 0]; % Adiciona um zero ao final de 'a' se 'N' for par
end

% Calcula as ra�zes dos polin�mios e as organiza em pares conjugados complexos
broots = cplxpair(roots(b)); % Ra�zes do numerador, emparelhadas
aroots = cplxpair(roots(a)); % Ra�zes do denominador, emparelhadas

% Itera para construir as se��es de segunda ordem
for i=1:2:2*K % Loop de 2 em 2 para pegar pares de ra�zes
    % Processa o numerador (B)
    Brow = broots(i:1:i+1,:); % Seleciona um par de ra�zes do numerador
    Brow = real(poly(Brow));  % Converte o par de ra�zes de volta para coeficientes de polin�mio reais
    B(fix((i+1)/2),:) = Brow; % Armazena os coeficientes na matriz B

    % Processa o denominador (A)
    Arow = aroots(i:1:i+1,:); % Seleciona um par de ra�zes do denominador
    Arow = real(poly(Arow));  % Converte o par de ra�zes de volta para coeficientes de polin�mio reais
    A(fix((i+1)/2),:) = Arow; % Armazena os coeficientes na matriz A
end