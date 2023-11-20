close all; clear all; clc

Rs_1 = 30; 
Rs_2 = 50;
Fs = 10000; %Sampling frequency
Ts = 1/Fs; %Sampling period
N= 500; %Number of samples

n = 0:(N-1);

x_n = 1+ cos(1000*n)+cos(16000*n)+cos(30000*n);

figure();
[num_d30 den_d30]=lpButterworth(Rs_1, Fs, N);

figure();
[num_d50 den_d50]=lpButterworth(Rs_2, Fs, N);

figure();
stem(n,x_n);
xlabel('Frequency(Hz)','Fontsize',11);
ylabel('Values of function', 'Fontsize',11);
title('The first 500 samples of x(t)=1+cos(1000t)+cos(16000t)+cos(30000t)','Fontsize',11,'FontWeight','bold');

figure();
f_axis=-Fs/2:Fs/N:Fs/2-1;
Xf=fftshift(fft(x_n));      % Fourier transform
stem(f_axis,Xf);
xlabel('Frequency(Hz)','Fontsize',11);
ylabel('Values of function', 'Fontsize',11);
title('The Fourier transform of x(t)=1+cos(t)+cos(5t)','Fontsize',11,'FontWeight','bold'); 

figure();
xf_filter=filter(num_d30,den_d30,x_n);
stem(f_axis,xf_filter);
xlabel('Frequency(Hz)','Fontsize',11);
ylabel('Values of function', 'Fontsize',11);
title('x(F) with lowband filter with Attenuation 30dB ','Fontsize',11,'FontWeight','bold'); 















