clear al; close all; clc
Rs_1 = 30; 
Rs_2 = 50;
fs = 10000;
n = 2048;

figure();
lpButterworth(Rs_1, fs, n);

figure();
lpButterworth(Rs_2, fs, n);
