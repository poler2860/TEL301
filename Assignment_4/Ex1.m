clear ; close all ; clc ; 
Vc = 0.4 * pi;
Fs = 100;
N = 21;

% Filter design with rectangular window
h_rect = fir1(N-1, Vc/(Fs/2), 'low', rectwin(N));

% Filter design with hamming window
h_hamming = fir1(N-1, Vc/(Fs/2), 'low', hamming(N));

freq = 0:0.01:0.5;
H_rectangular = freqz(h_rect, 1, freq * 2 * pi);
H_hamming = freqz(h_hamming, 1, freq * 2 * pi);

figure;
plot(freq * Fs/2, 20 * log10(abs(H_rectangular)), 'b');
hold on;
plot(freq * Fs/2, 20 * log10(abs(H_hamming)), 'r--');
title('Filters Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
legend('Rectangular', 'Hamming');
grid on;
