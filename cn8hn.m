xn=[1 2 -1 -2 0 1]
hn=[1 -1 1]
N = length(xn)+length(hn)-1;
xn = [xn zeros(1,N-length(xn))];
hn = [hn zeros(1,N-length(hn))];
h = hn(end:-1:1);
for i=1:N
    y(1,i) = h(end-i+1:end)*xn(1:i)';
end
disp("Convoltuion by pattern");
y