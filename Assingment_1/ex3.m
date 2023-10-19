%------------Part A------------
SR1 = 1200;
n1 = 0:128;
x_1 = 10*cos(2*pi*(20/SR1)*n1) - 4*sin(2*pi*(40/SR1)*n1+5);

figure();
stem(n1,x_1);
xlabel("Hz");
ylabel("Amplitude");
grid on;

%------------Part B------------
n = 0:100;
ph = 51;            
fs = 8000;          

% Phase diagrams for frequencies 100Hz to 475Hz with 125Hz step
i = 1;
figure();
for f0=100:125:475
    x_n = sin(2*pi*(f0/fs)*n + ph);
    subplot(4,1,i);
    stem(n, x_n);
    title("Frequency " + f0 + "Hz");
    ylabel("Amplitude");
    grid on;
    i = i + 1;
end

% Phase diagrams for frequencies 7525Hz to 7900Hz with 125Hz step
i = 1;
figure();
for f0=7525:125:7900
    x_n = sin(2*pi*(f0/fs)*n + ph);
    subplot(4,1,i);
    stem(n, x_n);
    title("Frequency " + f0 + "Hz");
    ylabel("Amplitude");
    grid on;
    i = i + 1;
end