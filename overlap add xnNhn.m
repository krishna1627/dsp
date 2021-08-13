x = [1 2 -1 -2 0 1 3 4 -4 -2 -3 1 2 0 1 1 0 2];
h = [1 -1 1]
N = 7;
M = length(h);
L = N-M+1;
r = rem(length(x),L);
if (r~=0)
    x = [x zeros(1,L-r)]
end
h = [h zeros(1,L-1)];
for i=1:length(x)/L
    xn(i,:) = [x(1+(i-1)*L:i*L) zeros(1,(M-1))]
end
%Finding Convolution
n = 0:N-1;
k = 0:N-1;
nk = n'*k;
wn = exp(-2*j*pi*nk/N);
Hk = wn*h';
Xk = wn * xn';
Yk = Xk .* Hk;
yn = ((conj(wn)*Yk))';
for i = 1:length(x)/L
    t = [zeros(1,(i-1)*L) yn(i,:) zeros(1,length(x)+M-1-N-(i-1)*L)];
    y(i,:) = t;
end
sum(y,1)