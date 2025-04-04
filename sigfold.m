function[y,n] = sigfold(x,n)
% y(n) = x(-n)

y = fliplr(x);
n = -fliplr(n);
