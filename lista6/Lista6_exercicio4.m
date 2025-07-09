% SCRIPT PRINCIPAL - Comparação entre convolução circular e linear

x1 = [2, 1, 1, 2];
x2 = [1, -1, -1, 1];

disp('x1 ='), disp(x1)
disp('x2 ='), disp(x2)

% Convolução circular com N = 4
y = circonvt(x1, x2, 4);
disp('Convolução circular (N=4):'), disp(y)

% Convolução circular com N = 7
y = circonvt(x1, x2, 7);
disp('Convolução circular (N=7):'), disp(y)

% Convolução circular com N = 8
y = circonvt(x1, x2, 8);
disp('Convolução circular (N=8):'), disp(y)

% Convolução linear padrão
y = conv(x1, x2);
disp('Convolução linear:'), disp(y)
