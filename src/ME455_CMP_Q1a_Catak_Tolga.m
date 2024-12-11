clc
clear
close all

% Define the parameters
gamma = 1.4;

% Define the area function 
A = @(x) 0.1 + x^2;

% Calculate the area at x = 0 (throat), x = 0.4m (shock), 
% x = 0.5m (inlet and outlet)
A_star = A(0);
A_shock = A(0.4);
A_outlet = A(0.5);
A_inlet = A(0.5);

% Make an initial guess for the function. 
% (Should be bigger than 1 since it is before the shock.)
M0_shock = 2.5; 

% Find Mach number before the shock (Mx)
fun = @(M) A_shock/A_star - (1/M) * ...
    (2/(gamma+1)*(1+(gamma-1)/2*M^2))^((gamma+1)/(2*(gamma-1)));
Mx = fzero(fun, M0_shock);

% Make an initial guess for the function. 
% (Should be smaller than 1 since it is before the shock.)
M0_inlet = 0.5; 

% Find Mach number at the inlet (M1)
fun = @(M) A_star/A_shock*A_inlet/A_star - ((1/M) * ...
    (2/(gamma+1)*(1+(gamma-1)/2*M^2))^((gamma+1)/(2*(gamma-1))))*((1/Mx)...
    * (2/(gamma+1)*(1+(gamma-1)/2*Mx^2))^((gamma+1)/(2*(gamma-1))))^-1;
M1 = fzero(fun, M0_inlet);

% Calculate Mach number after the shock (My) and pressure ratio P2/P1
My = ((Mx^2 + 2 / (gamma - 1)) / ((2*gamma/(gamma - 1)) * Mx^2 - 1))^0.5;
Py_Px = (2 * gamma * Mx^2 - (gamma - 1)) / (gamma + 1);

% Make an initial guess for the function. 
% (Should be smaller than 1 since it is before the shock.)
M0_outlet = 0.5;

% Find Mach number at the outlet (M2)
fun = @(M) A_star/A_shock*A_outlet/A_star - ((1/M) * ...
    (2/(gamma+1)*(1+(gamma-1)/2*M^2))^((gamma+1)...
    /(2*(gamma-1))))*((1/My) * (2/(gamma+1)*(1+(gamma-1)/2*My^2))...
    ^((gamma+1)/(2*(gamma-1))))^-1;
M2 = fzero(fun, 0.5);

% Calculate the stagnation pressure ratio across the shock
p0y_p0x =(((gamma+1)*(Mx^2)/2)^(gamma/(gamma-1)))*(((1+(gamma-1)*...
    (Mx^2)/2))^(gamma/(1-gamma)))/((2*gamma/(gamma+1)*Mx^2 - ...
    (gamma-1)/(gamma+1))^(1/(gamma-1)));

% Since stagnation pressure for an isentropic flow is equal, 
% p01=p0x and p02=p0y
p02_p01 = p0y_p0x;

% Calculate the exit pressure to exit stagnation pressure ratio
p2_p02 = (1 / (1+ (gamma-1)/2*M2^2)) ^ (gamma/(gamma-1));

% Combine the ratios to get the requested ratio
p2_p01 = p2_p02*p02_p01;
fprintf(['The ratio of duct exit pressure to duct inlet ' ...
    'stagnation pressure is p2/p01 = %.4f. \n'],p2_p01)

% Find the stagnation pressure loss
% format long
fprintf(['The stagnation pressure loss is (1-(p02_p01))' ...
    '*100 = %.4f%%. \n'],(1-(p02_p01))*100)


