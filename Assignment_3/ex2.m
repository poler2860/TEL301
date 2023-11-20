clc;close all;clear;
% Parameters
Ts = 0.2;  % Sampling period in seconds
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

% Plot the frequency responses
figure;
plot(frequencies, 20*log10(abs(H1)), 'b', 'LineWidth', 2);
hold on;
plot(frequencies, 20*log10(abs(H2)), 'r', 'LineWidth', 2);

title('Chebyshev Type I High-Pass Filters');
xlabel('Frequency (normalized)');
ylabel('Magnitude (dB)');
legend('2nd Order Filter', '16th Order Filter');
grid on;
xlim([0, 1]);  % Set x-axis limits to [0, 1]
hold off;
