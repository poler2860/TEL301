close all; clear all; clc

%a
Rs_1 = 30; 
Rs_2 = 50;
Fs = 10000; %Sampling frequency
Ts = 1/Fs; %Sampling period
N= 500; %Number of samples
f1=500/pi;
f2=800/pi;
f3=15000/pi;
n = 0:(N-1);

x_n = 1+cos(2*pi*f1*n)+cos(2*pi*f2*n)+cos(2*pi*f3*n);

figure;
[num_d30 den_d30]=lpButterworth(Rs_1, Fs, N);

figure;
[num_d50 den_d50]=lpButterworth(Rs_2, Fs, N);

figure();
subplot(2,1,1);
stem(n,x_n);
xlabel('Time(sec)','Fontsize',11);
ylabel('Amplitude', 'Fontsize',11);
title('The first 500 samples of x(t)=1+cos(1000t)+cos(16000t)+cos(30000t)','Fontsize',11,'FontWeight','bold');

subplot(2,1,2);
f_axis=-Fs/2:Fs/N:Fs/2-1;
Xf=fftshift(fft(x_n));      % Fourier transform
stem(f_axis,Xf);
xlabel('Frequency(Hz)','Fontsize',11);
ylabel('Amplitude', 'Fontsize',11);
title('The Fourier transform of x(t)=1+cos(t)+cos(5t)','Fontsize',11,'FontWeight','bold'); 

figure;
subplot(2,1,1);
xn_filter=filter(num_d30,den_d30,x_n);
stem(n,xn_filter);
xlabel('Time(sec)','Fontsize',11);
ylabel('Amplitude', 'Fontsize',11);
title('x(F) with lowband filter with Attenuation 30dB ','Fontsize',11,'FontWeight','bold'); 

subplot(2,1,2);
Xf30=fftshift(fft(xn_filter));      % Fourier transform
stem(f_axis,Xf30);
xlabel('Frequency(Hz)','Fontsize',11);
ylabel('Amplitude', 'Fontsize',11);
title('The Fourier transform of x(t)=1+cos(t)+cos(5t) filtered with Attenuation 30dB ','Fontsize',11,'FontWeight','bold'); 

figure;
subplot(2,1,1);
xn_filter2=filter(num_d50,den_d50,x_n);
stem(n,xn_filter2);
xlabel('Time(sec)','Fontsize',11);
ylabel('Amplitude', 'Fontsize',11);
title('x(F) with lowband filter with Attenuation 50dB ','Fontsize',11,'FontWeight','bold'); 

subplot(2,1,2);
Xf50=fftshift(fft(xn_filter2));      % Fourier transform
stem(f_axis,Xf50);
xlabel('Frequency(Hz)','Fontsize',11);
ylabel('Amplitude', 'Fontsize',11);
title('The Fourier transform of x(t)=1+cos(t)+cos(5t) filtered with Attenuation 50dB','Fontsize',11,'FontWeight','bold'); 



%b
Ts2 = 0.2; %sampling period
Fs2 = 1/Ts2; %sampling frequency 
f1_b = 0.75/pi;
f2_b = 2.5/pi;
N_b= 500; %Number of samples
t = 0:(N_b-1);

x1_n=1+cos(2*pi*f1_b*t)+cos(2*pi*f2_b*t);

figure();
subplot(3,1,1);
stem(t,x1_n);
xlabel('Time(sec)','Fontsize',11);
ylabel('Amplitude', 'Fontsize',11);
title('The first 500 samples of x(t)=1+cos(1.5t)+cos(5t)','Fontsize',11,'FontWeight','bold');

Rp = 3;   % Passband ripple in dB
fc = 1/pi;
Wp = fc/((1/Ts)/2); 

% First filter - 2nd order high-pass
n1 = 2;
[b1, a1] = cheby1(n1, Rp,Wp , 'high');

% Second filter - 16th order high-pass
n2 = 16;
[b2, a2] = cheby1(n2, Rp, Wp, 'high');

% Number of samples
numSamples = 256;

% Frequency axis in radians/sample, normalized to [0, 1]
frequencies = linspace(0, 1, numSamples);

% Frequency response of the 2nd-order filter
H1 = freqz(b1, a1, numSamples);

% Frequency response of the 16th-order filter
H2 = freqz(b2, a2, numSamples);



subplot(3,1,2);
Xn1_filter=filter(b1,a1,x1_n);  
stem(t,Xn1_filter);
xlabel('Time(sec)','Fontsize',11);
ylabel('Amplitude', 'Fontsize',11);
title('The filtered x(t)=1+cos(t)+cos(5t) with 2nd order filter','Fontsize',11,'FontWeight','bold');




subplot(3,1,3);
Xn2_filter=filter(b2,a2,x1_n); 
stem(t,Xn2_filter);
xlabel('Time(sec)','Fontsize',11);
ylabel('Amplitude', 'Fontsize',11);
title('The filtered x(t)=1+cos(t)+cos(5t) with 16th order filter','Fontsize',11,'FontWeight','bold');











 




