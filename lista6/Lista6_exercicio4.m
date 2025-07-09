% SCRIPT PRINCIPAL - Compara��o entre convolu��o circular e linear

x1 = [2, 1, 1, 2];
x2 = [1, -1, -1, 1];

disp('x1 ='), disp(x1)
disp('x2 ='), disp(x2)

% Convolu��o circular com N = 4
y = circonvt(x1, x2, 4);
disp('Convolu��o circular (N=4):'), disp(y)

% Convolu��o circular com N = 7
y = circonvt(x1, x2, 7);
disp('Convolu��o circular (N=7):'), disp(y)

% Convolu��o circular com N = 8
y = circonvt(x1, x2, 8);
disp('Convolu��o circular (N=8):'), disp(y)

% Convolu��o linear padr�o
y = conv(x1, x2);
disp('Convolu��o linear:'), disp(y)
