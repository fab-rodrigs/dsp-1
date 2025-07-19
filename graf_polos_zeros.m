pkg load signal

num = 5;
den = [1, -0.25];

zplane(num, den);
title('Polos e Zeros de H(z)');
grid on;

[z, p, k] = tf2zpk(b, a);

disp('Zeros:');
disp(z);
disp('Polos:');
disp(p);

