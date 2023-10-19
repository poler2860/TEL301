clear all;close all;clc;

%2
dt = 0.01*10^(-3);
t = dt:dt:500*10^(-3)-dt;
xt = 5*cos(24*pi*t) - 2*sin(1.5*pi*t);

%---------------Print graph-------------------
figure;
plot(t,xt);
axis([0 0.5 -7 7]);
xlabel('time (s)');
ylabel('Amplitude');
grid on;
title('x(t)=5cos(24*pi*t)-2sin(1.5*pi*t)');\
hold off;

dTs1 = 1/48; Ts1 = dTs1:dTs1:500*10^(-3)-dTs1 ;
dTs2 = 1/24; Ts2 = dTs2:dTs2:500*10^(-3)-dTs2 ;
dTs3 = 1/12; Ts3 = dTs3:dTs3:500*10^(-3)-dTs3 ;

xa1 = 5*cos(24*pi*Ts1) - 2*sin(1.5*pi*Ts1);
xa2 = 5*cos(24*pi*Ts2) - 2*sin(1.5*pi*Ts2);
xa3 = 5*cos(24*pi*Ts3) - 2*sin(1.5*pi*Ts3);
%------------first sampling--------------
figure;
plot(t,xt,'-b');
axis([0 0.5 -7 7]);
xlabel('time (s)');
ylabel('Amplitude');
grid on;
hold on;
title('a) Ts = 1/48');
stem(Ts1,xa1, '-r');
plot(Ts1,xa1,'-g');
legend('x(t)','Sampling with Ts=1/48','Recover');
hold off;
%------------second sampling--------------
figure;
plot(t,xt,'-b');
axis([0 0.5 -7 7]);
xlabel('time (s)');
ylabel('Amplitude');
grid on;
hold on;
stem(Ts2,xa2,'-r');
title('b) Ts = 1/24');
plot(Ts2,xa2,'-g');
legend('x(t)','Sampling with Ts=1/24','Recover');
hold off;
%------------third sampling--------------
figure;
plot(t,xt,'-b');
axis([0 0.5 -7 7]);
grid on;
hold on;
title('c) Ts = 1/12');
stem(Ts3,xa3,'-r');
axis([0 0.5 -7 7]);
plot(Ts3,xa3,'-g');
legend('x(t)','Sampling with Ts=1/12','Recover');
hold off;
%----sampling with Ts form team number-----
As = 51; %we are team number 51
dTs0 = 1/As; Ts0 = dTs0:dTs0:500*10^(-3)-dTs0 ;
xa0 = 5*cos(24*pi*Ts0) - 2*sin(1.5*pi*Ts0);

figure;
plot(t,xt,'-b');
axis([0 0.5 -7 7]);
xlabel('time (s)');
ylabel('Amplitude');
grid on;
hold on;
title('d) Ts = 1/51 , 51 is the number of the team');
stem(Ts0,xa0,'-r');
plot(Ts0,xa0,'-g');
legend('x(t)','Sampling with Ts=1/51','Recover');
hold off;
