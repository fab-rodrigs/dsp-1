x_num = [3 1.1045];
x_den = [1 -0.8817 0.5625];

x = tf(x_num, x_den);

z = zero(x)
p = pole(x)