% Parameters
Ts = 0.2;  % Sampling period in seconds
Fc = 2;   % Cutoff frequency in rad/sec
Rp = 3;   % Passband ripple in dB

% First filter - 2nd order
n1 = 2;
[b1, a1] = cheby1(n1, Rp, Fc*Ts, 's');
[num1, den1] = bilinear(b1, a1, 1/Ts);

% Second filter - 16th order
n2 = 16;
[b2, a2] = cheby1(n2, Rp, Fc*Ts, 's');
[num2, den2] = bilinear(b2, a2, 1/Ts);

% Number of samples
numSamples = 256;

% Frequency axis in radians/sample, normalized to [0, 1]
frequencies = linspace(0, 1, numSamples);

% Frequency response of the 2nd-order filter
H1 = freqz(num1, den1, 2*pi*frequencies, 1/Ts);

% Frequency response of the 16th-order filter
H2 = freqz(num2, den2, 2*pi*frequencies, 1/Ts);

% Plot the frequency responses
figure;
plot(frequencies, 20*log10(abs(H1)), 'b', 'LineWidth', 2);
hold on;
plot(frequencies, 20*log10(abs(H2)), 'r', 'LineWidth', 2);

title('Chebyshev Type I Filters');
xlabel('Frequency (normalized)');
ylabel('Magnitude (dB)');
legend('2nd Order Filter', '16th Order Filter');
grid on;
xlim([0, 1]);  % Set x-axis limits to [0, 1]
hold off;
