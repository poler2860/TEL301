clear ; close all ; clc ; 
%first bullet
Vc = 0.5 * pi;
Fs = 100;
N = [21 , 41];
freq = 0:0.01:0.5;

% Filter design with hamming window
h_hamming1 = fir1(N(1)-1, Vc/(Fs/2), 'low', hamming(N(1)));
h_hamming2 = fir1(N(2)-1, Vc/(Fs/2), 'low', hamming(N(2)));

H_hamming1 = freqz(h_hamming1, 1, freq * 2 * pi);
H_hamming2 = freqz(h_hamming2, 1, freq * 2 * pi);

% Figure for hamming
figure;
sgtitle('Hamming');
subplot(1,2,1);
plot(freq * Fs/2, 20 * log10(abs(H_hamming1)));
grid on;
title('Filters Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
subplot(1,2,2);
plot(freq * Fs/2, 20 * log10(abs(H_hamming2)));
grid on;
title('Filters Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');


% Filter design with hanning window
h_hanning1 = fir1(N(1)-1, Vc/(Fs/2), 'low', hanning(N(1)));
h_hanning2 = fir1(N(2)-1, Vc/(Fs/2), 'low', hanning(N(2)));

H_hanning1 = freqz(h_hanning1, 1, freq * 2 * pi);
H_hanning2 = freqz(h_hanning2, 1, freq * 2 * pi);

% Figure for hanning
figure;
sgtitle('Hanning');
subplot(1,2,1);
plot(freq * Fs/2, 20 * log10(abs(H_hanning1)));
grid on;
title('Filters Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');
subplot(1,2,2);
plot(freq * Fs/2, 20 * log10(abs(H_hanning2)));
grid on;
title('Filters Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Amplitude (dB)');

%------------------------------------------------------------
%second bullet
x = sin(15*t) + 0.25*sin(200*t);
