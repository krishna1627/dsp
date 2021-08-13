clc;
clear;
close all;
xn = input("D D M M");
N = length(xn);
for k=0:N-1
    xk = 0;
    for n=0:N-1
        xk = xk + xn(n+1)*exp(-2*pi*n*k*i/N);
    end
    Xk(k+1,1) = xk;
end
Xk
plot(Xk)