x = [1 2 -1 -2 0 1  4 -4 -2 -3 1 2 0 1];
P = length(x);
h = [1 0 -1];
N = 5;
M = length(h);
L = N-M+1;
r = rem(length(x),L);
if(r~=0)
    x = [x zeros(1,L-r)];
end
h = [h zeros(1,L-1)];
xn(1,:) = [zeros(1,M-1) x(1:L)];
for i = 2: length(x)/L;
    temp = xn(i-1,:);
    xn(i,:) = [temp(end-M+2:end) x(1+(i-1)*L:i*L)];
end
xn
% Finding Convolution
n = 0:N-1;
k = 0:N-1;
nk = n'*k;
wn = exp(-2*j*pi*nk/N);
Hk = wn*h';
Xk = wn * xn';
Yk = Hk .* Xk;
yn = ((conj(wn)*Yk))';
y = 0;
for i=1:length(x)/L
    temp = yn(i,:);
    y = [y temp(M:end)];
end
y = y(:)';
y = y(2:end)
