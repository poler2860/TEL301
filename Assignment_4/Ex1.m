clear ; close all ; clc ; 
Vc = 0.4 * pi;
Fs = 100;
N = 21;

% Filter design with rectangular window
h_rect = fir1(N-1, Vc/(Fs/2), 'low', rectwin(N));

% Filter design with hamming window
h_hamming = fir1(N-1, Vc/(Fs/2), 'low', hamming(N));

[H_rect,w1]=freqz(h_rect,N);
[H_hamming,w2]=freqz(h_hamming,N);

figure;
plot(linspace(0,1,length(w1)),20*log10(abs(H_rect)), 'b');
hold on;
plot(linspace(0,1,length(w2)),20*log10(abs(H_hamming)), 'r--');
title('Filters Frequency Response');
xlabel('Normalize Frequency');
ylabel('Magnitude (dB)');
legend('Rectangular', 'Hamming');
grid on;
