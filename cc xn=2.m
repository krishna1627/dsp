%% N-point circular xn=2n & hn=(-2)^n
xn = [0 2 4 6];
hn = [1 -2 4];
%N = max(length(xn),length(hn));
N=input("enter: ");
xn = [xn zeros(1,N-length(xn))];
hn = [hn zeros(1,N-length(hn))];
temp = xn;
xn(1,:) = temp;
for i=1:N-1
    temp = [temp(end) temp(1:end-1)];
    xn(i+1,:) = temp;  
end
yn = xn'*hn'