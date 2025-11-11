
function simple_EM_wave()
lambda = 2*pi;
k = 2*pi/lambda;
omega = 2*pi;
x = linspace(0,4*lambda,200);
dt =0.1;
figure('color','w');
axis tight manual 
for t=0:dt:4*pi
    E=sin(k*x-omega*t);
    H=sin(k*x-omega*t);
    plot3(x,zeros(size(x)),E,'r','LineWidth',2);hold on;
    plot3(x,H,zeros(size(x)),'b','LineWidth',2);
    legend('E-field(z-axis)','H-field(Y-axis)','Location','north outside');
    xlabel('X-axis');ylabel('Y-axis');zlabel('Z-axis');
    title('simple EM wave Animation');
    axis([0,4*lambda -1.5,1.5,-1.5,1.5]);
    view([30 30]);
    grid on;
    pause(0.05);hold off;
end
end