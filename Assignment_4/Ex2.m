clear ; close all ; clc ; 
%first bullet
Vc = 0.5 * pi;
Fs = 100;
N = [21 , 41];
freq = 0:0.01:0.5;

% Filter design with hamming window
h_hamming1 = fir1(N(1)-1, Vc/(Fs/2), 'low', hamming(N(1)));
h_hamming2 = fir1(N(2)-1, Vc/(Fs/2), 'low', hamming(N(2)));

[H_hamming1,hamw1]=freqz(h_hamming1,N(1));
[H_hamming2,hamw2]=freqz(h_hamming1,N(2));

% Figure for hamming
drawFigureForFirstBullet('Hamming',H_hamming1,hamw1,H_hamming2,hamw2);

% Filter design with hanning window
h_hanning1 = fir1(N(1)-1, Vc/(Fs/2), 'low', hanning(N(1)));
h_hanning2 = fir1(N(2)-1, Vc/(Fs/2), 'low', hanning(N(2)));

[H_hanning1,hanw1]=freqz(h_hanning1,N(1));
[H_hanning2,hanw2]=freqz(h_hanning1,N(2));

% Figure for hanning
drawFigureForFirstBullet('Hanning',H_hanning1,hanw1,H_hanning2,hanw2);

%---------------------------------------------------------------
%second bullet
passSingalFromFiltersWithHz(100,H_hamming1,H_hamming2,H_hanning1,H_hanning2);
%---------------------------------------------------------------
%third bullet
passSingalFromFiltersWithHz(50,H_hamming1,H_hamming2,H_hanning1,H_hanning2);
%-------------------------!!FUNCTIONS!!-------------------------
%function for drawing the plots for the first bullet
function drawFigureForFirstBullet(figureTitle,yLeftPlot,xLeftPlot,yRightPlot,xRightPlot)
    figure;sgtitle(figureTitle);
    subplot(1,2,1);
    plot(linspace(0,1,length(xLeftPlot)), 20*log10(abs(yLeftPlot)),'LineWidth',2);
    grid on;title('Filters Frequency Response');xlabel('Normalize Frequency');ylabel('Magnitude (dB)');
    subplot(1,2,2);
    plot(linspace(0,1,length(xRightPlot)),20*log10(abs(yRightPlot)),'LineWidth',2);
    grid on;title('Filters Frequency Response');xlabel('Normalize Frequency');ylabel('Magnitude (dB)');
end
%function for the second and third bullet
function passSingalFromFiltersWithHz(Fs,H_hamming1,H_hamming2,H_hanning1,H_hanning2)
    t = 0:1/Fs:1-1/Fs;
    x = sin(15*t) + 0.25*sin(200*t);
    NFFT = 2^nextpow2(length(x));
    F= -Fs/2:Fs/NFFT:Fs/2-Fs/NFFT;

    spectrum_original = fftshift(fft(x,NFFT)*(1/Fs));
    %x pass by the hamming filter
    filteredHam1 = filter(H_hamming1,1,x);
    filteredHam2 = filter(H_hamming2,1,x);
    %find the spectrum
    spectrum_filteredHam1 = fftshift(fft(filteredHam1,NFFT)*(1/Fs));
    spectrum_filteredHam2 = fftshift(fft(filteredHam2,NFFT)*(1/Fs));
    %x pass by the hanning filter
    filteredHan1 = filter(H_hanning1,1,x);
    filteredHan2 = filter(H_hanning2,1,x);
    %find the spectrum
    spectrum_filteredHan1 = fftshift(fft(filteredHan1,NFFT)*(1/Fs));
    spectrum_filteredHan2 = fftshift(fft(filteredHan2,NFFT)*(1/Fs));


    %ploting for hamming
    figure;sgtitle('Hamming');
    subplot(3,1,1);
    plot(F, abs(spectrum_original),'LineWidth',2);
    grid on;title('Spectrum X');xlabel('Frequency (Hz)');ylabel('|X(f)|');
    subplot(3,1,2);
    plot(F, abs(spectrum_filteredHam1),'LineWidth',2);
    grid on;title('X with filter hamming N = 21');xlabel('Frequency (Hz)');ylabel('|Xfiltered(f)|');
    subplot(3,1,3);
    plot(F, abs(spectrum_filteredHam2),'LineWidth',2);
    grid on;title('X with filter hanning N = 41');xlabel('Frequency (Hz)');ylabel('|Xfiltered(f)|');

    %ploting for hanning
    figure;sgtitle('Hanning');
    subplot(3,1,1);
    plot(F, abs(spectrum_original),'LineWidth',2);
    grid on;title('X');xlabel('Frequency (Hz)'); ylabel('|X(f)|');
    subplot(3,1,2);
    plot(F, abs(spectrum_filteredHan1),'LineWidth',2);
    grid on;title('X with filter hanning N = 21');xlabel('Frequency (Hz)'); ylabel('|Xfiltered(f)|');
    subplot(3,1,3);
    plot(F, abs(spectrum_filteredHan2),'LineWidth',2);
    grid on;title('X with filter hanning N = 41');xlabel('Frequency (Hz)'); ylabel('|Xfiltered(f)|');
end
