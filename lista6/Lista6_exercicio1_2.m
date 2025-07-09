% ---------------------
% EXERCÍCIO 1 - Item 2
% ---------------------
x2 = [2, 0, 0, 0, -1, 0, 0, 0];
N2 = length(x2);
X2 = zeros(1, N2);

for k = 0:N2-1
    for n = 0:N2-1
        X2(k+1) = X2(k+1) + x2(n+1)*exp(-1j*2*pi*k*n/N2);
    end
end

disp('DFS de x2(n):');
disp(X2);
