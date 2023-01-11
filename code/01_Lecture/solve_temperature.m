function dT_dt = solve_temperature(t,x)
%This contains the differential equation that must be solved
% Based on Newtons Law of Cooling
% Outside termperature is 
global param_k;
global outside_temp;

T = x(1);

T_External = outside_temp(floor(t));

dT_dt = param_k* (T_External - T);

end