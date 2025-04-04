%% exercicio 2.2 a
% a) x1(n)=2x(n-5)-3x(n+4)

%n = -2:10;
%x = [1:7,6:-1:1];

%% exercicio 2.2 b
% b) x2(n)=x(3-n)+x(n)x(n-2)

n = -2:10;
x = [1:7,6:-1:1];

[x21,n21] = sigfold(x,n);
[x21,n21] = sigshift(x21,n21,3);
[x22,n22] = sigshift(x,n,2);
[x22,n22] = sigmult(x,n,x22,n22);
[x2,n2] = sigadd(x21,n21,x22,n22);
stem(n2,x2);
title('Sequencia problema 2.2b');
xlabel('n');
ylabel('x2(n)');
