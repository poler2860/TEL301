clear ; close all ; clc ; 
%first bullet
Vc = 0.5 * pi;
Fs = 100;
N = [21 , 41];

% Make the filters
[h_hamming1, h_hamming2, h_hanning1, h_hanning2] = makeFilters(Fs,Vc,N);

[H_hamming1,hamw1]=freqz(h_hamming1,N(1));
[H_hamming2,hamw2]=freqz(h_hamming2,N(2));

[H_hanning1,hanw1]=freqz(h_hanning1,N(1));
[H_hanning2,hanw2]=freqz(h_hanning2,N(2));

% Figure for hamming
drawFigureForFirstBullet('Hamming Fs = 100Hz',H_hamming1,hamw1,H_hamming2,hamw2);

% Figure for hanning
drawFigureForFirstBullet('Hanning Fs = 100Hz',H_hanning1,hanw1,H_hanning2,hanw2);

%---------------------------------------------------------------
%second bullet
[X1,F1,spectrum_filteredHam11, spectrum_filteredHam21, spectrum_filteredHan11, spectrum_filteredHan21]=passSingalFromFiltersWithHz(100,h_hamming1,h_hamming2,h_hanning1,h_hanning2);
%---------------------------------------------------------------
%third bullet
[h_hamming1, h_hamming2, h_hanning1, h_hanning2] = makeFilters(50,Vc,N);
[X2,F2,spectrum_filteredHam12, spectrum_filteredHam22, spectrum_filteredHan12, spectrum_filteredHan22]=passSingalFromFiltersWithHz(50,h_hamming1,h_hamming2,h_hanning1,h_hanning2);
%---------------------------------------------------------------
%draw all graphs from 2 and 3 bullter all in one figure
drawFigureForSecondThirdBullet(2,[100;50],[F1;F2],[X1;X2],[spectrum_filteredHam11;spectrum_filteredHam12],[spectrum_filteredHam21;spectrum_filteredHam22],[spectrum_filteredHan11;spectrum_filteredHan12],[spectrum_filteredHan21;spectrum_filteredHan22]);

%-------------------------!!FUNCTIONS!!-------------------------
%function to make the filters
function [h_hamming1, h_hamming2, h_hanning1, h_hanning2] = makeFilters(Fs,Vc,N)
    h_hamming1 = fir1(N(1)-1, Vc/(Fs/2),'low',  hamming(N(1)));
    h_hamming2 = fir1(N(2)-1, Vc/(Fs/2), 'low', hamming(N(2)));
    h_hanning1 = fir1(N(1)-1, Vc/(Fs/2), 'low', hanning(N(1)));
    h_hanning2 = fir1(N(2)-1, Vc/(Fs/2), 'low', hanning(N(2)));
end
%function for drawing the plots for the first bullet
function drawFigureForFirstBullet(figureTitle,yLeftPlot,xLeftPlot,yRightPlot,xRightPlot)
    figure;sgtitle(figureTitle);
    subplot(1,2,1);
    plot(linspace(0,1,length(xLeftPlot)), abs(yLeftPlot),'LineWidth',2);
    grid on;title('Filters Frequency Response Ν = 21');xlabel('Normalize Frequency');ylabel('Magnitude');
    subplot(1,2,2);
    plot(linspace(0,1,length(xRightPlot)),abs(yRightPlot),'LineWidth',2);
    grid on;title('Filters Frequency Response Ν = 41');xlabel('Normalize Frequency');ylabel('Magnitude');
end
%function for the second and third bullet
function [X,F,spectrum_filteredHam1, spectrum_filteredHam2, spectrum_filteredHan1, spectrum_filteredHan2]=passSingalFromFiltersWithHz(Fs,H_hamming1,H_hamming2,H_hanning1,H_hanning2)
    Ts = 1/Fs;
    W1 = 15;
    W2 = 200;
    F1 = W1/(2*pi);
    F2 = W2/(2*pi);
    samples = 500;                  
    n = 0:samples-1;

    x = sin(2*pi*F1*n*Ts)+0.25*sin(2*pi*F2*n*Ts);
    F = -Fs/2:Fs/samples:Fs/2-Fs/samples;                    
    X = fftshift(fft(x));  

    %x pass by the hamming filter
    filteredHam1 = filter(H_hamming1,1,x);
    filteredHam2 = filter(H_hamming2,1,x);
    %find the spectrum
    spectrum_filteredHam1 = fftshift(fft(filteredHam1));
    spectrum_filteredHam2 = fftshift(fft(filteredHam2));
    %x pass by the hanning filter
    filteredHan1 = filter(H_hanning1,1,x);
    filteredHan2 = filter(H_hanning2,1,x);
    %find the spectrum
    spectrum_filteredHan1 = fftshift(fft(filteredHan1));
    spectrum_filteredHan2 = fftshift(fft(filteredHan2));

    %ploting for hamming
    figure;sgtitle(['Hamming ',num2str(Fs),'Hz']);
    subplot(3,1,1);
    plot(F, abs(X),'LineWidth',2);
    grid on;title('Spectrum X');xlabel('Frequency (Hz)');ylabel('|X(f)|');
    subplot(3,1,2);
    plot(F, abs(spectrum_filteredHam1),'LineWidth',2);
    grid on;title('X with filter hamming N = 21');xlabel('Frequency (Hz)');ylabel('|Xfiltered(f)|');
    subplot(3,1,3);
    plot(F, abs(spectrum_filteredHam2),'LineWidth',2);
    grid on;title('X with filter hanning N = 41');xlabel('Frequency (Hz)');ylabel('|Xfiltered(f)|');

    %ploting for hanning
    figure;sgtitle(['Hanning with Fs = ',num2str(Fs),'Hz']);
    subplot(3,1,1);
    plot(F, abs(X),'LineWidth',2);
    grid on;title('X');xlabel('Frequency (Hz)'); ylabel('|X(f)|');
    subplot(3,1,2);
    plot(F, abs(spectrum_filteredHan1),'LineWidth',2);
    grid on;title('X with filter hanning N = 21');xlabel('Frequency (Hz)'); ylabel('|Xfiltered(f)|');
    subplot(3,1,3);
    plot(F, abs(spectrum_filteredHan2),'LineWidth',2);
    grid on;title('X with filter hanning N = 41');xlabel('Frequency (Hz)'); ylabel('|Xfiltered(f)|');
    drawFigureForSecondThirdBullet(1,[Fs],[F],[X],[spectrum_filteredHam1], [spectrum_filteredHam2], [spectrum_filteredHan1], [spectrum_filteredHan2]);
end
%function to draw multiplate plot in one figure
function drawFigureForSecondThirdBullet(num,Fs,F,XF,spectrum_filteredHam1F,spectrum_filteredHam2F,spectrum_filteredHan1F,spectrum_filteredHan2F)
    %ploting for hamming
    figure;
    for i = 1:num
        subplot(num,5,1+((i-1)*5));
        plot(F(i,1:end), abs(XF(i,1:end)),'LineWidth',2);
        grid on;title(['Spectrum X Fs = ', num2str(Fs(i)),'Hz']);xlabel('Frequency (Hz)');ylabel('|X(f)|');
        subplot(num,5,2+((i-1)*5));
        plot(F(i,1:end), abs(spectrum_filteredHam1F(i,1:end)),'LineWidth',2);
        grid on;title('X Spectrum with filter hamming N = 21');xlabel('Frequency (Hz)');ylabel('|Xfiltered(f)|');
        subplot(num,5,3+((i-1)*5));
        plot(F(i,1:end), abs(spectrum_filteredHam2F(i,1:end)),'LineWidth',2);
        grid on;title('X Spectrum with filter hamming N = 41');xlabel('Frequency (Hz)');ylabel('|Xfiltered(f)|');

        %ploting for hanning
        subplot(num,5,4+((i-1)*5));
        plot(F(i,1:end), abs(spectrum_filteredHan1F(i,1:end)),'LineWidth',2);
        grid on;title('X Spectrum with filter hanning N = 21');xlabel('Frequency (Hz)'); ylabel('|Xfiltered(f)|');
        subplot(num,5,5+((i-1)*5));
        plot(F(i,1:end), abs(spectrum_filteredHan2F(i,1:end)),'LineWidth',2);
        grid on;title('X Spectrum with filter hanning N = 41');xlabel('Frequency (Hz)'); ylabel('|Xfiltered(f)|');
    end
end
