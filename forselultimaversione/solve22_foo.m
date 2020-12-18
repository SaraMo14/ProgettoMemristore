function out = solve22_foo(t, in)
%initialisation
x = in(1); 
y = in(2); 

a=0.01;
b=0.05;
alpha=1;
beta=0.03;

%ODE
dxdt=alpha*(beta-W(y, a, b))*x;
dydt=x;
out = [dxdt dydt]';
end

