function X = dtft(x, n, w)
% DTFT Computa a Transformada Discreta no Tempo (DTFT)
% X = dtft(x, n, w) computa a DTFT de x[n] para
% frequências w
% x: sinal
% n: índices correspondentes a x
% w: vetor de frequências
X = zeros(1, length(w));
for k = 1:length(w)
X(k) = sum(x .* exp(-1j * w(k) * n));
end
end

