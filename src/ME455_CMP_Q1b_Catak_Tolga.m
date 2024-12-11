clc
clear
close all

% Define the parameters
gamma = 1.4;

% Define the area function 
A = @(x) 0.1 + x^2;

% Calculate the area at x = 0 (throat), 
% x = 0.4m (shock), x = 0.5m (inlet and outlet)
A_star = A(0);
A_outlet = A(0.5);
A_inlet = A(0.5);

% Define the function to find the Mach number before the shock
fun = @(M,A1_Astar) A1_Astar - (1/M) * ...
    (2/(gamma+1)*(1+(gamma-1)/2*M^2))^((gamma+1)/(2*(gamma-1)));

% Find Mach number at the outlet (M2)
fun2 = @(M,My,A_shock) A_star/A_shock*A_outlet/A_star - ...
    ((1/M) * (2/(gamma+1)*(1+(gamma-1)/2*M^2))^((gamma+1)...
    /(2*(gamma-1))))*((1/My) * (2/(gamma+1)*(1+(gamma-1)/2*My^2))...
    ^((gamma+1)/(2*(gamma-1))))^-1;

% Define the error
error = 1e-4;

% Define the pressure ratios to iterate
pressure_ratios = [0.4 0.6 0.8];

% Create a for loop for the iteration
for p2_p01 = pressure_ratios
    for position = 0.1:0.0001:0.5
        
        % Define the area of the shock
        A_shock = A(position);
        
        % Find the Mach number before the shock
        Mx = fzero(@(M) fun(M, A_shock/A_star), 2);

        % Find the Mach number after the shock
        My = ((Mx^2 + 2 / (gamma - 1)) / ...
            ((2*gamma/(gamma - 1)) * Mx^2 - 1))^0.5;
        
        % Find the stagnation pressure ratio before and after the shock
        p0y_p0x = (((gamma+1)*(Mx^2)/2)^(gamma/(gamma-1)))...
            *(((1+(gamma-1)*(Mx^2)/2))^(gamma/(1-gamma)))/...
            ((2*gamma/(gamma+1)*Mx^2 - (gamma-1)/(gamma+1))...
            ^(1/(gamma-1)));
        
        % Find the stagnation pressure of the inlet and outlet 
        p02_p01 = p0y_p0x;

        % Find the Mach number at the exit 
        M2 = fzero(@(M) fun2(M,My,A_shock), 0.5);
        
        % Find the exit 
        p2_p02 = (1 / (1+ (gamma-1)/2*M2^2)) ^ (gamma/(gamma-1));

        % Find the calculated pressure ratio with the given location 
        p2_p01_calc = p2_p02*p02_p01;
        
        % Compare the calculated pressure ratio to the required ratio
        if abs(p2_p01_calc - p2_p01) < error
            fprintf('The location of the normal shock is x = %.4f m,'...
                , position);
            fprintf(' when the pressure ratio is p2/p01 = %.4f. \n'...
                ,p2_p01)
         
            % Break the loop if the difference is smaller ...
            % than the defined error
            break
        end
    end
end