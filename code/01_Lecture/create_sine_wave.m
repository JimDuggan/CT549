function sw = create_sine_wave(from,to,start_temp,amplitude, period)
% The sine wave equation is START_TEMP+ Amplitude * (2 * t * PI/PERIOD)
% amplitude is the maximum height of the wave
% period is the time between minima/maxima
    t = from:to;
    sw = start_temp + amplitude * sin(2*pi*t/period);
end