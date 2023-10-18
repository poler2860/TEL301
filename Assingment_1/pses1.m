clear all;close all;clc;

%2
dt = 0.01*10^(-3);
t = dt:dt:500*10^(-3)-dt;
xt = 5*cos(24*pi*t) - 2*sin(1.5*pi*t);

dTs1 = 1/48; Ts1 = dTs1:dTs1:500*10^(-3)-dTs1 ;
dTs2 = 1/24; Ts2 = dTs2:dTs2:500*10^(-3)-dTs2 ;
dTs3 = 1/12; Ts3 = dTs3:dTs3:500*10^(-3)-dTs3 ;

xa1 = 5*cos(24*pi*Ts1) - 2*sin(1.5*pi*Ts1);
xa2 = 5*cos(24*pi*Ts2) - 2*sin(1.5*pi*Ts2);
xa3 = 5*cos(24*pi*Ts3) - 2*sin(1.5*pi*Ts3);
%------------first sampling--------------
figure;
subplot(3,1,1);
plot(t,xt);
ylim([-7 7]);
grid on;
title('xt = 5*cos(24*pi*t) - 2*sin(1.5*pi*t)');

subplot(3,1,2);
stem(Ts1,xa1);
ylim([-7 7]);
grid on;
title('sampling with Ts1 = 1/48');

subplot(3,1,3);
plot(Ts1,xa1);
ylim([-7 7]);
grid on;
title('After sampling with Ts1 = 1/48');

%------------second sampling--------------
figure;
subplot(3,1,1);
plot(t,xt);
ylim([-7 7]);
grid on;
title('xt = 5*cos(24*pi*t) - 2*sin(1.5*pi*t)');

subplot(3,1,2);
stem(Ts2,xa2);
ylim([-7 7]);
grid on;
title('sampling with Ts2 = 1/24');

subplot(3,1,3);
plot(Ts2,xa2);
ylim([-7 7]);
grid on;
title('After sampling with Ts2 = 1/24');

%------------third sampling--------------
figure;
subplot(3,1,1);
plot(t,xt);
ylim([-7 7]);
grid on;
title('xt = 5*cos(24*pi*t) - 2*sin(1.5*pi*t)');

subplot(3,1,2);
stem(Ts3,xa3);
ylim([-7 7]);
grid on;
title('sampling with Ts3 = 1/12');

subplot(3,1,3);
plot(Ts3,xa3);
ylim([-7 7]);
grid on;
title('After sampling with Ts3 = 1/12');

%----sampling with Ts form team number-----
As = 51; %we are team number 51
dTs0 = 1/As; Ts0 = dTs0:dTs0:500*10^(-3)-dTs0 ;
xa0 = 5*cos(24*pi*Ts0) - 2*sin(1.5*pi*Ts0);

figure;
subplot(3,1,1);
plot(t,xt);
ylim([-7 7]);
grid on;
title('xt = 5*cos(24*pi*t) - 2*sin(1.5*pi*t)');

subplot(3,1,2);
stem(Ts0,xa0);
ylim([-7 7]);
grid on;
title('sampling with Ts0 = 1/As');

subplot(3,1,3);
plot(Ts0,xa0);
ylim([-7 7]);
grid on;
title('After sampling with Ts0 = 1/As');

%=========================================================
%3

%%%xt3 = 10*cos(2*pi*20*t)-4*sin(2*pi*40*t+5);

%3-B
f = 5l; %we are team number 51
xt3b1 = sin(2*pi*f0*t+f);

