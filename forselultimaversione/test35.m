% Defining the three differential equations of the problem
f=@(t,x) 1/(x-0.3);
tspan = [0 600];
[t,x]=runge_kutta_4(f,tspan,0.3,0.003); % Calling RK4 function defined below
plot(t,x);
xlabel('t')
ylabel('x')
ylim([-250 100]);
xlim(tspan);
