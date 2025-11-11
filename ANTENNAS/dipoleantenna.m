%23A91A0416 
%D S S G PRATHAP 
%ECE-A 
lambda=input('enter your value of wavelength = '); 
l=input('enter the dipole length l= '); 
ratio=l/lambda; 
B=(2*pi/lambda); 
theta=pi/100:pi/100:2*pi; 
if ratio<=0.1 
    E=sin(theta); 
    En=abs(E); 
    subplot(2,1,1); 
    polar(theta,En); 
else 
    f1=cos(B*l/2.*cos(theta)); 
    f2=cos(B*l/2); 
    f3=sin(theta); 
    E=(f1-f2)./f3; 
    En=abs(E); 
    subplot(2,1,2) 
    polar(theta,En); 
end 