% Lista 1 - Matlab %

% 1) Gere as seguintes sequências usando as funções de sinal básicas do MATLAB e
% as operações de sinal básicas. Plote as amostras dos sinais usando a função stem.

%% 1. x1(n) = 3?(n+2) + 2?(n) - ?(n-3) + 5?(n-7), -5<=n<=15
x = 3*impseq(-2, -5, 15) + 2*impseq(0, -5, 15) - impseq(3, -5, 15) + 5*impseq(7, -5, 15);
stem(x)

%% 2. x2(n) = ?(k=-5->k=5)e^(-|k|)?(n-2k), -10<=n<=10 
for k=-5:5 
    x = exp(-(abs(k)))*impseq(2*k,-10,10);
end 
stem(x)

%% 3. x3(n) = 10u(n) - 5u(n-5) - 10u(n-10) + 5u(n-15)
x = 10*stepseq(0, -10, 10) - 5*stepseq(5, -10, 10) - 10*stepseq(10, -10, 10) + 5*stepseq(15, -10, 10);
stem(x)

%% 4. x4(n) = e^(0.1n)*[u(n+20)-u(n-10)]
n = [-10:10];
x = exp(0.1*n).*(stepseq(-20,-10,10)-stepseq(10,-10,10));
stem(x,n)

%% 5. x5(n)= 5[cos(0.49?n) + cos(0.51?n)], -200<=n<=200. Comente sobre o formato da onda.
n = [-200:200];
x = 5*(cos(0.49*pi*n)+cos(0.51*pi*n));
stem(x,n)

%% 6. x6(n)= 2sin(0.1?n)cos(0.5?n), -200<=n<=200. Comente sobre o formato da onda.
n = [-200:200];
x = 2*sin(0.1*pi*n)+cos(0.5*pi*n);
stem(x,n);

%% 7. x7(n)= e^(-0.05?n)sin(0.1?n+?/3), 0<=n<=100. Comente sobre o formato da onda.
n = [0:100];
x = exp(-0.05*pi*n).*sin(0.1*pi*n+pi/3);
stem(x,n)

%% 8. x8(n)= e^(0.01?n)sin(0.1?n), 0<=n<=100. Comente sobre o formato da onda.
n = [0:100];
x = exp(0.01*pi*n).*sin(0.1*pi*n);
stem(x,n)

%% 2) Seja x(n)={2,4,-3,1,-5,4,7} Gere e plote as amostras (use a função stem) das
% seguintes sequências:
