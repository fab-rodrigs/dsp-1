function [y,ny] = conv_m(x,nx,h,nh)
% [y,ny] = conv_m(x,nx,h,nh)
% [y,ny] = convolution result
% [x,nx] = first signal
% [h,nh] = second signal

nyb = nx(1)+nh(1);
nye = nx(lenght(x)) + nh(lenght(h));
ny = [nyb:nye];
y = conv(x,h);
