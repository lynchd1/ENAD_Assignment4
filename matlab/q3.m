% Question 3

clear 
clc
format shortEng
format compact

%Prototype values
C_p = 1;
R_p = 1;

%Capacitance values given
C = 100 * 10^(-9);

% Cutoff frequency given (Hz)
f_c = 1000;

% Cutoff frequency given (rad/s)
w_c = f_c * 2 * pi;

% Prototype cutoff frequency%
w_cn = 1/sqrt(sqrt(2) - 1);

% Frequency Scaling %
kf = w_c / w_cn;

% Magnitude scaling %
km = C_p / (kf * C);

% Resistor value from magnitude scaling %
R = km * R_p;

% Generic print statements%
fprintf('Prototype values Cp = %f Farads, Rp = %f Ohms \n', C_p, R_p);
fprintf('Cutoff frequency fc = %d Hertz \ntherefore wc = %f radians/second \n', f_c, w_c);
fprintf('Prototype cutoff frequency w_cn = %f radians/second\n', w_cn);
fprintf('Frequency scaling factor kf = %f\n', kf);
fprintf('Magnitude scaling factor km = %f\n', km);
fprintf('Ri = %f Ohms\n', R);

%1/(R*C)
%2/(R*C)
%(1/(R*C))^2

% Bode plot with transfer function %
s=tf('s');
H = 10 * (s^2 / (s^2 + 2 * (1/(R*C)) * s + (1/(R*C))^2)  );

bode(H, [1 : 10:   100/(R * C)]);
