clc;
clear all;
close all;
%Create a Yagi-Uda Antenna
yagi=yagiUda;
yagi.NumDirectors=5;
yagi.ReflectorLength=0.9;
yagi.ReflectorSpacing=0.25;
yagi.DirectorLength=0.45;
yagi.DirectorSpacing=0.3;
yagi.Exciter.Length=0.47;
yagi.Exciter.Width=0.01;
%1.Display Antenna Geometry
figure;
show(yagi);title('Yagi-Uda Antenna Geometry');
freq=linspace(100e6,300e6,201);
%Impedance Matching Plot
Z=impedance(yagi,freq);
figure;
plot(freq/1e6,real(Z),'b','LineWidth',1.5);hold on;
plot(freq/1e6,imag(Z),'r','LineWidth',1.5);
xlabel('Frequency(Mhz)');
ylabel('Impedance(ohms)');
legend('Real','Imaginary');title('input Impedance vs Frequency');
grid on;
s=sparameters(yagi,freq);
S11=rfparam(s,1,1);
vswrVals=vswr(S11);
%VSWR Plot
figure;
plot(freq/1e6,vswrVals,'k','LineWidth',1.5);
xlabel('Frequency(MHz)');
ylabel('VSWR');
title('VSWR vs Frequency');
grid on;
%Radiation Pattern at 150Mhz
freq0=150e6;
figure;pattern(yagi,freq0);
title(['Radiation pattern at',num2str(freq0/1e6),'MHz']);
%gain at boresight(0,0)
boresightGain = pattern(yagi,freq0,0,0);
disp(['Gain at ',num2str(freq0/1e6),'MHz = ',num2str(boresightGain),'dBi']);
