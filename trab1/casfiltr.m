function y = casfiltr(b0,B,A,x);
% casfiltr: Realiza a filtragem de uma sequ�ncia de entrada 'x' usando uma estrutura em cascata de filtros IIR ou FIR.
%
% Este c�digo implementa a filtragem em cascata, onde um filtro de ordem superior
% � decomposto em uma s�rie de se��es de segunda ordem (biquadr�ticas).
% Isso � frequentemente feito para melhorar a estabilidade num�rica e a precis�o
% da filtragem, especialmente para filtros de alta ordem.
%
% Sintaxe:
%   y = casfiltr(b0,B,A,x);
%
% Entradas:
%   b0 = Coeficiente de ganho global da forma em cascata.
%   B  = Matriz K por 3 de coeficientes reais que representam os numeradores (bk's)
%        de cada uma das K se��es de segunda ordem. Cada linha de B corresponde
%        aos coeficientes [b0 b1 b2] de uma se��o.
%   A  = Matriz K por 3 de coeficientes reais que representam os denominadores (ak's)
%        de cada uma das K se��es de segunda ordem. Cada linha de A corresponde
%        aos coeficientes [a0 a1 a2] de uma se��o.
%   x  = Sequ�ncia de entrada a ser filtrada.
%
% Sa�da:
%   y  = Sequ�ncia de sa�da filtrada.

% Obt�m as dimens�es da matriz B. K � o n�mero de se��es de segunda ordem.
[K,L] = size(B);

% Obt�m o comprimento da sequ�ncia de entrada.
N = length(x);

% Inicializa a matriz 'w' que armazenar� as sa�das intermedi�rias de cada se��o.
% A primeira linha de 'w' � a sequ�ncia de entrada 'x'.
% Ter� K+1 linhas (uma para a entrada e uma para a sa�da de cada uma das K se��es)
% e N colunas (correspondendo ao comprimento da sequ�ncia de entrada).
w = zeros(K+1,N);
w(1,:) = x;

% Loop para processar cada se��o de segunda ordem em cascata.
for i = 1:1:K
    % Aplica o filtro da i-�sima se��o.
    % filter(B(i,:), A(i,:), w(i,:)) aplica o filtro definido pelos coeficientes
    % da i-�sima linha de B (numerador) e da i-�sima linha de A (denominador)
    % � sa�da da se��o anterior (w(i,:)).
    % A sa�da desta se��o � armazenada na pr�xima linha de 'w'.
    w(i+1,:) = filter(B(i,:),A(i,:),w(i,:));
end

% A sa�da final 'y' � a sa�da da �ltima se��o (w(K+1,:)) multiplicada pelo
% coeficiente de ganho global b0.
y = b0*w(K+1,:);