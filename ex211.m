a = [1,-1,0.9];
b = [1];

% a) Calcule e plote a resposta ao impulso h[n] com n=-20, ..., 100.
n = [-20:100];
h = impz(b,a,n);
subplot(2,1,1);
stem(n,h);
title('Impulse Response');
xlabel('n');
ylabel('h(n)');
subplot(2,1,2);
plot(n,h);
