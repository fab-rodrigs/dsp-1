function [b,a] = cas2dir(b0,B,A);
% cas2dir: Converte os coeficientes de um filtro da **forma em cascata** para a **forma direta**.
%
% Este c�digo pega as se��es de segunda ordem (biquadr�ticas) de um filtro
% (representadas pelas matrizes B e A) e as combina para obter os
% coeficientes do polin�mio do numerador e do denominador na forma direta.
% O ganho global 'b0' tamb�m � aplicado ao numerador.
%
% Sintaxe:
%   [b,a] = cas2dir(b0,B,A)
%
% Entradas:
%   b0 = Coeficiente de ganho global da forma em cascata.
%   B  = Matriz K por 3 de coeficientes reais que cont�m os bk's (numeradores)
%        de cada uma das K se��es de segunda ordem. Cada linha de B � [b0 b1 b2].
%   A  = Matriz K por 3 de coeficientes reais que cont�m os ak's (denominadores)
%        de cada uma das K se��es de segunda ordem. Cada linha de A � [a0 a1 a2].
%
% Sa�das:
%   b = Coeficientes do polin�mio do numerador na forma direta.
%   a = Coeficientes do polin�mio do denominador na forma direta.

% Obt�m o n�mero de se��es de segunda ordem (K) a partir das dimens�es da matriz B.
[K,L] = size(B);

% Inicializa os polin�mios do numerador (b) e do denominador (a) com 1.
% Isso serve como um elemento neutro para a convolu��o, garantindo que
% a primeira se��o seja corretamente combinada.
b = [1];
a = [1];

% Itera por cada se��o de segunda ordem (de 1 a K).
for i=1:1:K
    % Realiza a convolu��o dos coeficientes do numerador.
    % A fun��o 'conv' realiza a multiplica��o de polin�mios. Aqui,
    % ela combina os coeficientes do numerador atual ('b') com os
    % coeficientes do numerador da i-�sima se��o (B(i,:)).
    b=conv(b,B(i,:));

    % Realiza a convolu��o dos coeficientes do denominador.
    % Similarmente, combina os coeficientes do denominador atual ('a')
    % com os coeficientes do denominador da i-�sima se��o (A(i,:)).
    a=conv(a,A(i,:));
end

% Aplica o coeficiente de ganho global 'b0' ao polin�mio do numerador resultante.
b = b*b0;