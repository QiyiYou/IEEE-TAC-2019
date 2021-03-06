%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DESCRIPTION: Defines discrete-time dynamics of Thermostatically controlled load 
% Adopted from: Yang, A Dynamic Game Approach to Distributionally Robust Safety Specifications for Stochastic Systems, Automatica, 2018
% INPUT:
    % xk : temperature at time k [deg C]
    % uk : power setting at time k [no units]
    % wk : disturbance at time k [deg C]
    % config struct 
    % config scneario 
% OUTPUT:
    % xkPLUS1 : temperature at time k+1 [deg C]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function xkPLUS1 = therm_ctrl_load( xk, uk, wk, config, scenario) 

h = config.dt; % in hours
C = 2; % thermal capacitance in kilowatt hours per deg C
R = 2; % thermal resistance in deg C per kilowatt
a = exp( -h / (C*R) ); % (called "alpha" in Yang 2018)
Pow = 14; % range of energy transfer to/from thermal mass in kilowatts
eta = 0.7; % control efficiency coefficient
b = 32; % degrees C (called "theta" in Yang 2018)

xkPLUS1 = a*xk + (1 - a)*(b - eta * R * Pow * uk) + wk;
