% cada amostra de x(n) � deslocada y(n)
% se m = n - k, ent�o n = m+k

function [y,n] = sigshift(x,m,k)
% implements y(n) = x(n-k)
% -----------------------
% [y,n] = sigshift(x,m,k)
n = m+k;
y =x;