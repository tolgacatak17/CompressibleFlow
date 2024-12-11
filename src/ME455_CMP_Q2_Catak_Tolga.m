clc
clear
close all

% Define the parameters
gamma_air = 1.4;
gamma_helium = 1.667;
f = 0.02;
D = 0.2;
M1 = 0.1;
l1 = 0;


% Calculate the required length for the Mach number of unity
l_star = @(M1,gamma) l1 + D / f * (1 / (gamma) * ...
    (1 - M1^2) / M1^2 + (gamma + 1) / (2 * gamma) * ...
    log(((gamma + 1) / 2 * M1^2) / (1 + (gamma - 1) / 2 * M1^2)));

% Define the range of the initial Mach number
M_values = [0.1:0.1:1];

% Iterate through the values for both air and helium
m=1;
for i = M_values
    l_air(m) = l_star(i,gamma_air);
    l_helium(m) = l_star(i,gamma_helium);
    m = m + 1 ;
end

% Repeat the same process for the continuous graph
M_range_cont = [0.1:0.001:1];

% Iterate through the values for both air and helium
n=1;
for j = M_range_cont
    l_air_cont(n) = l_star(j,gamma_air);
    l_helium_cont(n) = l_star(j,gamma_helium);
    n = n + 1;
end

% Plot the graphs

figure(1)
scatter(M_values,l_air,'*','SizeData', 100)
hold on
grid on
plot(M_range_cont,l_air_cont)
xlabel('Mach Number')
ylabel('Required Duct Length (m)')
title('Mach Number vs Duct Length for Air (γ=1.4)')


figure(2)
scatter(M_values,l_helium,'*','SizeData', 100)
hold on
grid on
plot(M_range_cont,l_helium_cont)
xlabel('Mach Number')
ylabel('Required Duct Length (m)')
title('Mach Number vs Duct Length for Helium (γ=1.667)')

% Display results
fprintf(['The required duct length to accelerate the flow from M = 0.1 '...
    'to M = 1.0 is l_air = %.4f m. \n'],l_air(1))

% Display results in a table
T = table(M_values', round(l_air',4), round(l_helium',4), ...
    'VariableNames', {'M_values', 'l_air', 'l_helium'});
disp(T)
