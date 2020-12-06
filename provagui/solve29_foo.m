function out = solve29_foo(t, in)
%initialisation
x = in(1); 
y = in(2); 
z = in(3);

a=0.1;
b=0.5;
alpha=2;
gamma=0.3;
beta = 1;

%ODE
dxdt=alpha*(-y-W(z, a, b)*x + gamma*x);
dydt=beta*x;
dzdt=x;   
out = [dxdt dydt dzdt]';

end