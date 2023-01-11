function ts_noise = add_noise_normal(ts,sd)
% Resample each value with the mean = time series value and a standard
% deviation
ts_noise = normrnd(ts,sd);
end