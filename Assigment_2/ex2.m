clear all; close all; clc

%coefficient of numerator
n= [4 -3.5 0];
%coefficient of denominator
d = [1 -2.5 1];

%po-poles 
%ro-Residues
[ro,po,ko] = residuez(n,d);

syms z;

H1 = ro(1)/(1-po(1)*z^(-1));
H2 = ro(2)/(1-po(2)*z^(-1));
Hz= H1 + H2;
pretty(Hz);

Hn= iztrans(Hz);
pretty(Hn);
