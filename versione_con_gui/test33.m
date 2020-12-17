f=@(t,z) (z+1)/(1-z^2);
tspan = [0 1000];
step = 0.002;
[t,z]=runge_kutta_4(f,tspan,0,step); % Calling RK4 function defined below
plot(t,z);
xlabel('t')
ylim([-30 10]);
xlim(tspan);
ylabel('Z')