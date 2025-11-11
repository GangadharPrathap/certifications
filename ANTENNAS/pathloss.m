 clc;
 clear all;
 close all;
 f = 900;%frequency in MHz
 d = 0.1:0.1:20;%Distance in km(from 0.1 to 20km)
 hb = 50;%Base station antenna height(m)
 hm = 1.5;%Mobile antenna height(m)
 %%free space path loss(FSPL)
 %FSPL formula in dB:32.45+20*log10(f)+20*log10(d)
 PL_fs = 32.45 + 20*log10(f) + 20*log10(d);
 %correction factor for mobile antenna height(a_hm)
 a_hm = (1.1*log10(f) - 0.7)*hm - (1.56*log10(f) - 0.8);
 %Hata urban path loss
 PL_hata_urban=69.55 + 26.16*log10(f)-13.82*log10(hb) ...
    - a_hm + (44.9 - 6.55*log10(hb))*log10(d);
 PL_suburban = PL_hata_urban - 2*(log10(f/28))^2 - 5.4;
 %%Rural(open area)correction
 PL_rural = PL_hata_urban - 4.78*(log10(f))^2 + 18.33*log10(f) - 40.94;
 %%Plot results
 figure;
 plot(d,PL_fs,'b','LineWidth',1.5);%Free space path loss
 hold on;
 plot(d,PL_hata_urban,'r','LineWidth',1.5);%Hata ubran path loss
 plot(d,PL_suburban,'g','LineWidth',1.5);%Hata sububran path loss
 plot(d,PL_rural,'m','LineWidth',1.5);%Hata rural path loss
 grid on;
 %grid minor;
 %set(gca,'XScale','log');
 xlabel('Distance(km)[log scale]');
 ylabel('Path Loss(dB)');
 title(['Path Loss Models at f=',num2str(f),'MHz']);
 legend('Free space','Hata Urban(small/medium)','Hatasuburban','Hata Rural','Location','northwest')