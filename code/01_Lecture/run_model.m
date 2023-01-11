clear;
% We can change these global params and then use the value in the ode function
% Usually better to pass as arguments to ode45
global param_k;
global outside_temp;

% Create sine wave data
outside_temp = create_sine_wave(1,48,10,15,24);

rng(100);
% resample to add some noise, with sd=1.5
% outside_temp = add_noise_normal(outside_temp,3);

param_k = 0.90;

[t,y] = ode45(@solve_temperature, 1:48, 15);

plot(y);
hold on;
plot(outside_temp);













