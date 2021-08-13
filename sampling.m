clear;
clc;
fm = input("Enter modulating frequency");
t = 0: 0.01: 1;
s1 = 2*sin(2*pi*fm*t)+3*sin(3*pi*fm*t)+5*sin(5*pi*fm*t);
fs = input("Enter sampling frequency");
n = 0: 0.01 : 1;
subplot(2,1,1);
plot(t,s1);
hold on;
subplot(2,1,2);
stem(n,s1)