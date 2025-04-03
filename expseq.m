% Unit step sequence

function [x,n] = expseq(n0, n1, n2)
% Generates x(n) = a^n
%----------------------------------------------
%[x, n] = expseq(n0, n1, n2)
%

n = [n1 : n2];
x = n0.^n;
stem(x);
