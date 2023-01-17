clear;

f = @(t,x) 2*t;

[t,y] = ode45(f,0:10,0);

plot(t,y,'-o');