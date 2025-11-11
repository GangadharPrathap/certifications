clc; 
clear all; 
close all; 
lamda=0.03; % wavelength (m)(-->c/f) 
k=2*pi/lamda; % Wave Number 
a=0.15; % Width of the aperture(along x-axis) 
b=0.10; % Height of the aperture(along y-axis) 
theta=linspace(-pi/2,pi/2,1000); %Observation angle(elevation) 
phi=0;% Azimuth angle 
%Array factor (Far-Field Approximation 
E_theta =(sin((k*a/2)*sin(theta))./((k*a/2)*sin(theta))).*(sin((k*b/2)*cos(theta))./((k*b/2)*cos(theta))); 
%Normalize Pattern 
E_theta_dB=20*log10((E_theta)/max(abs(E_theta))); 
%Plot Radiation Pattern 
figure; 
polarplot(theta,E_theta_dB,'LineWidth',2); 
title('Radiation Pattern of Rectangular Aperture Antenna'); 
thetalim([-90 90]); 
rlim([-40 0]); 
grid on; 
% Cartesian plot 
figure; 
plot(rad2deg(theta),E_theta_dB,'LineWidth',2); 
xlabel('Theta(degrees)'); 
ylabel('Normalized |E(\theta)|[dB]'); 
title('Radiation Pattern (E-phase cut)'); 
grid on; 
axis([-90 90 -40 0]); 