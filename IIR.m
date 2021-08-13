% IIR filter design
% butterworth filter 
clc
clear
wp=input('Enter the value of passband frequency in rad/sec : ')
ws=input('Enter the value of stopband frequency in rad/sec : ')
rp=input('Enter the value of passband ripple : ')
rs=input('Enter the value of stoband ripple : ')
lwp= length(wp);
[n , wn]=buttord(wp,ws,rp,rs,'s')
if lwp==1
    if wp<ws
        disp('low pass')
        [b ,a] =butter(n, wn, 'low', 's')
        w=0:1:(2*max(wp,ws));
    else
         disp('High pass')
        [b ,a] =butter(n, wn, 'high', 's')
        w=0:1:(2*max(wp,ws));
    end
else
    if wp(1)>ws(1)
     disp('band pass')
        [b ,a] =butter(n, wn, 'pass', 's')
        w=0:1:(2*max(wp(1),ws(1)));
    else
         disp('Band stop')
        [b ,a] =butter(n, wn, 'stop', 's')
        w=0:1:(2*max(wp(1),ws(1)));
    end
end
h=freqs(b,a,w)
mag=20*log(abs(h))
plot(w,mag)
[z p k]=buttap(n)
%% chebyshev filter
clc
clear
wp=input('Enter the value of passband frequency in rad/sec : ')
ws=input('Enter the value of stopband frequency in rad/sec : ')
rp=input('Enter the value of passband ripple : ')
rs=input('Enter the value of stoband ripple : ')
lwp= length(wp);
[n , wn]=cheb1ord(wp,ws,rp,rs,'s')
if lwp==1
    if wp<ws
        disp('low pass')
        [b ,a] =cheb1(n, wn, 'low', 's')
        w=0:1:(2*max(wp,ws));
    else
         disp('High pass')
        [b ,a] =cheb1(n, wn, 'high', 's')
        w=0:1:(2*max(wp,ws));
    end
else
    if wp(1)>ws(1)
     disp('band pass')
        [b ,a] =cheb1(n, wn, 'pass', 's')
        w=0:1:(2*max(wp(1),ws(1)));
    else
         disp('Band stop')
        [b ,a] =cheb1(n, wn, 'stop', 's')
        w=0:1:(2*max(wp(1),ws(1)));
    end
end
h=freqs(b,a,w)
mag=20*log(abs(h))
plot(w,mag)
[z p k]=cheb1ap(n)