clear all; close all; clc

%b
fs=1;       %sampling frequency
Ts=1/fs;

num1=[0.2 0];
den1=[1 -0.9];
G1=tf(num1,den1,Ts);

num2=[0 1];
den2=[1 0.2];
G2=tf(num2,den2,Ts);

H = G1*G2;
[num den] = tfdata(H, 'v');


zplane(num, den);

%d

f = -pi:pi/128:pi;
figure();
freqz(num, den, f);
title("Frequency response with 3rd argument");

figure();
freqz(num, den);
title("Frequency response without 3rd argument");

%e
den_2 = [1 -1.7 0.52 0.18]; % new denimonator

figure(4);
freqz(num, den_2);
title('Frequency response - extra pole(z=1)');



