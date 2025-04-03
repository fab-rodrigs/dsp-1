% Plot de exponencial discreta
%    n = [0 : 10];
%    x = (0.9).^n;
%    stem(x);
% Sequencia exponencial de valor complexo
%    n = [0 : 10];
%    x = exp((2+3j)*n);
%    stem(x)

% n = [0:10];
% x = 3 * cos(0.1 * pi * n + pi / 3) + 2 * sin(0.5 * pi * n);
% stem(x);

% exercicio 2a - gere e plote cada uma das seguintes sequencias no
% intervalo indicado

% x(n) = 2 * imp(n+2) - imp(n-4), -5 <= n <= 5

% n= [-5:5];
% x = 2 * impseq(2, -5, 5) - impseq(-4, -5, 5);

% exercicio 2b

%n = [0:20];
%a = stepseq(0, 0, 20);
%b = stepseq(10, 0, 20);
%c = stepseq(20, 0, 20);

%x = n .* (a - b) + 10 * exp(-0.3*(n-10)) .* (b - c);

% exercicio 2c
% x(n) = cos(0.4*pi*n) + 0.2*w(n), 0 <= n <= 50

n = (0:50);
tam = size(n);

x = cos(0.04*pi.*n) + 0.2 * randn(tam);

% exercicio 2d
% x(n) = {...,5,4,3,2,15,4,3,2,1,5,4,3,2,1,...}; -10 <= n <= 9

n = [-10,9];
x = [5,4,3,2,1];

xtilde = x' ones(1,4);

xtilde = (xtilde(:))';

stem(n,xtilde);

