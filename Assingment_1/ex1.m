clear all
close all
clc

n1 = -5:1:5
x1 = exp(n1);

figure(1);
subplot(2,1,1)
stem(n1,x1);
axis([-6 6 0 150]);
xlabel("time");
ylabel("amplitude");
title("Discrete-Time exponential signal");
grid on;

n2 = 0:1:10;
f = 0.1;
x2 = 2*cos(2*pi*f*n2);

subplot(2,1,2)
stem(n2,x2);
axis([-1 11 -2.5 2.5]);
title('Discrete-Time cosine Signal');
xlabel('time');
ylabel('Amplitude');
grid on;



% convolution without conv function
m=length(x1);
t=length(x2);
%zero-padding
h1=[x1,zeros(1,t)];
h2=[x2,zeros(1,m)];
for i=1:t+m-1
    X(i)=0;
    for j=1:m
        if(i-j+1>0)
            X(i)=X(i)+h1(j)*h2(i-j+1);
        else
        end
    end
end
n_conv = n1(1) + n2(1):1:n1(end) + n2(end);

figure(2);
subplot(2,1,1);
stem(n_conv,X);
axis([-1 20 -410 410]);
ylabel('Amplitude'); 
xlabel('time'); 
grid on;
title('Convolution of Two Signals without conv function');

% convolution with conv function
X3 = conv(x1,x2);
subplot(2,1,2);
stem(n_conv, X3);
axis([-1 20 -410 410]);
ylabel('Amplitude'); 
xlabel('time'); 
grid on;
title('Convolution of Two Signals with conv function');


%2
t1 = -15:1:10;
y1 = (1/2).^abs(t1);
figure(3)
subplot(2,1,1)
stem(t1,y1);
axis([-16 11 0 1.5]);
ylabel('Amplitude'); 
xlabel('time'); 
title('Signal y1');
grid on;

t2 = -15:1:15;
y2 = 4*(t2>=4)+(-t2+4>=0).*(-t2+4);
subplot(2,1,2)
stem(t2,y2);
axis([-16 16 0 25]);
ylabel('Amplitude'); 
xlabel('time'); 
title('Signal y2');
grid on;


%convolution in time
Y = conv(y1,y2);
n_conv1 = t1(1) + t2(1):1:t1(end) + t2(end);

%Discrete-Time Fourier Tranformation
N1 = length(y1);
N2 = length(y2);
N = N1 + N2 - 1; % Length of the convolution result

fy1 = fft([y1, zeros(1, N - N1)]);
fy2 = fft([y2, zeros(1, N - N2)]);



figure(4)
subplot(2,1,1);
stem(fy1);
xlabel('frequency');
ylabel('Amplitude');
grid on;
title('Fourier Tranformation of signal y1');

subplot(2,1,2);
stem(fy2);
xlabel('frequency');
ylabel('Amplitude');
grid on;
title('Fourier Tranformation of signal y2');

% Verify the multiplication property
fy_mult = fy1 .* fy2;
y_mult = ifft(fy_mult);

figure(5)
subplot(2,1,1)
stem(n_conv1,Y,'-r');
ylabel('Amplitude'); 
xlabel('time'); 
grid on;
title('Convolution of Two Signals in time');

subplot(2,1,2)
stem(n_conv1,y_mult, '-r');
ylabel('Amplitude'); 
xlabel('time'); 
grid on;
title('Convolution of Two Signals after multiplication in frequency');


