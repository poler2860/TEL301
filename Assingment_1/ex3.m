close all; clear;
%------------Part A------------
Fs = 600; % Sampling frequency
T = 1/Fs; % Sampling period
n = 128; % number of samples

t = (0:n-1) * T;

% Define the signal x(t)
xt = 10*cos(2*pi*20*t) - 4*sin(2*pi*40*t + 5);

% Compute the two-sided spectrum using FFT
X = fftshift(abs(fft(xt)));

% Define the frequency axis
f = Fs*(-n/2:(n/2-1))/n;

% Plot the two-sided spectrum
figure();
plot(f, X);
title('Two-Sided Amplitude Spectrum of x(t)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
grid on;

%------------Part B------------
ph = 51;            
fs = 8000;      % Sample frequency    
Ts = 1/fs;
f2 = -fs/2:fs/128:fs/2-fs/128;
n=0:Ts:127*Ts;

% Phase diagrams for frequencies 100Hz to 475Hz with 125Hz step
i = 1;
figure();
for f0=100:125:475
    x_n = sin(2*pi*(f0)*n + ph);
    y_2 = fftshift(abs(fft(x_n)));
    subplot(4,1,i);
    stem(f2, y_2);
    title("Frequency " + f0 + "Hz");
    xlabel('Frequency (Hz)');
    ylabel("Amplitude");
    grid on;
    i = i + 1;
end

% Phase diagrams for frequencies 7525Hz to 7900Hz with 125Hz step
i = 1;
figure();
for f0=7525:125:7900
    x_n = sin(2*pi*(f0)*n + ph);
    y_2 = fftshift(abs(fft(x_n)));
    subplot(4,1,i);
    stem(f2, y_2);
    title("Frequency " + f0 + "Hz");
    xlabel('Frequency (Hz)');
    ylabel("Amplitude");
    grid on;
    i = i + 1;
end