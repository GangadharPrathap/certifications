clc;
clear all;
close all;
Z0=50;
ZL=25+1j*50;%inductive load
%ZL=25-1j*50;%capacitive load
%ZL=50;%resistive load
%reflection coeficient
gammaL=(ZL-Z0)/(ZL+Z0);
figure;
smithplot;hold on;
plot(real(gammaL),imag(gammaL),'ro','MarkerSize',8,'LineWidth',2);
title('smith chart-single stub matching');
grid on;
z1=ZL/Z0;
y1=1/z1;
b=imag(y1);
yMatched=1+1j*(b-b);
zMatched=1;
plot(0,0,'gs','MarkerSize',10,'LineWidth',2);
str = ['ZL =  ' num2str(real(ZL)) ' + j' num2str(imag(ZL))];
text(real(gammaL),imag(gammaL)+0.05,str,'Fontsize',12,'Color','blue');
text(-0.1,0.05,'Matched point','FontSize',12,'Color','black');
fprintf('characteristic impedance Z = %.2f ohm\n',Z0);
fprintf('Load impedance ZL=%.2f+%.2fj ohm\n',real(ZL),imag(ZL));
fprintf('reflection coefficient(gammaL=%.3f %.3fj\n)',real(gammaL),imag(gammaL));
fprintf('|gammaL|=%.3f\n',abs(gammaL));
fprintf('VSWR(before matching) = %.3f\n',(1+abs(gammaL))/(1-abs(gammaL)));
fprintf('After matching: Zin = %.2f ohm(perfect match)\n',Z0);