x = [3,11,7,0,-1,4,2];
h = [2,3,0,-5,2,1];

y = conv(x,h);
plot(y,'r')
hold on

nx = [-3:3];
ny = [-1:4];
[y,ny] = conv_m(x,nx,h,ny);
plot(ny,y)

