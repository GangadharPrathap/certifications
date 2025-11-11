fc = 1.8e9;    % 1.8 GHz 
radius = 28e-3;    % 28 mm turn radius 
width = 1.2e-3;    % 1.2 mm strip width 
turns = 4;         % 4 turns 
spacing = 35e-3;   % 35 mm spacing between turns 
gndRadius = 75e-3;   % 75 mm ground plane radius 
hx = helix(Radius=radius, Width=width, Turns=turns, ... 
           Spacing=spacing, GroundPlaneRadius=gndRadius); 
figure; 
show(hx); 
title('Helical Antenna Structure');% --- Radiation Pattern Analysis --- 
% Plot the 3D directivity radiation pattern at the operating frequency 
figure; 
pattern(hx, fc); 
title(['3D Radiation Pattern at ', num2str(fc/1e9), ' GHz']); 
% Plot the radiation pattern in the XZ-plane 
figure; 
pattern(hx, fc, 0, 1:1:360); 
title(['XZ-Plane Radiation Pattern at ', num2str(fc/1e9), ' GHz']); 
% Plot the Right-Hand Circularly Polarized (RHCP) pattern 
figure; 
pattern(hx, fc, Polarization="RHCP"); 
title(['RHCP Radiation Pattern at ', num2str(fc/1e9), ' GHz']); 
% --- Gain and Directivity Analysis --- 
D = pattern(hx, fc, 0, 90); % Directivity at 90 degrees elevation 
disp(['Peak Directivity at ', num2str(fc/1e9), ' GHz: ', num2str(D), ' dBi']); 
% Calculate the gain 
figure; 
pattern(hx, fc, Type="gain"); 
title('Gain Pattern'); 
% --- Impedance and S-Parameter Analysis --- 
f_range = (1.7e9:1e7:2.2e9); 
s_params = sparameters(hx, f_range); 
% Plot the S11 parameter (Return Loss) on a Smith chart 
figure; 
smithplot(s_params); 
title('S11 on Smith Chart'); 
% Plot S11 vs. Frequency 
figure; 
rfplot(s_params); 
title('S11 (Return Loss)'); 
% --- Voltage Standing Wave Ratio (VSWR) Analysis --- 
figure; 
vswr(hx,f_range); 
grid on; 
title('VSWR vs. Frequency'); 
xlabel('Frequency (GHz)'); 
ylabel('VSWR'); 