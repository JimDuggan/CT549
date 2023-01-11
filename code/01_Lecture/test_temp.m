clear;

temp1 = create_sine_wave(0,24,10,10,24);
temp2 = add_noise_normal(temp1,.5);
temp3 = add_noise_normal(temp1,.75);

plot(temp1);
hold on;
plot(temp2);
hold on;
plot(temp3);
