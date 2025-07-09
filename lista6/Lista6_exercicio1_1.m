% ---------------------
% EXERCÍCIO 1 - Item 1
% ---------------------
x1 = [4, 1, -1, 1];
N1 = length(x1);
X1 = zeros(1, N1);

for k = 0:N1-1
    for n = 0:N1-1
        X1(k+1) = X1(k+1) + x1(n+1)*exp(-1j*2*pi*k*n/N1);
    end
end

disp('DFS de x1(n):');
disp(X1);

