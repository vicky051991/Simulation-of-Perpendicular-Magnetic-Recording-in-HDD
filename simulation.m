close all;
clear all;
clc;
 
%parameters initialization
count = 1;
A = 2;
Tb = 20;
T50 = 30;
 
%% Computation of Impulse Response
for t = -100:0.1:100
    
impulse(count) = A*tanh(2*t/(0.579*pi*T50));
count = count+1;
end
plot([-100:0.1:100],impulse);
 
%Compute s(t-Tb)
delayed_imp = [-A*ones(1,Tb) impulse];
 
 
impulse = [impulse A*ones(1,Tb)];
 
 
%% h(t) computation
dibit1 = (impulse - delayed_imp)/2;
 
dibit = dibit1;
 
figure
plot(dibit);
xlabel 'time ', ylabel 'Magnetic field'
title('Dibit Response of perpendicular recording');
 
chnl_freq_resp = fft(dibit);
%% Frequency response LPF
figure
axis([0 100 0 100]);
plot(abs(chnl_freq_resp(1:80)));
xlabel 'frequency ', ylabel 'Channel response'
title('Frequency response of perpendicular read/ write channel');
