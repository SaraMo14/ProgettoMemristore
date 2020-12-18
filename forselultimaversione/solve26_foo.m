function out = solve26_foo(t, in)
%initialisation
x = in(1); 
y = in(2); 
z = in(3);
w = in(4);

%parameters
a=0.3;
b=0.8;
alpha=10;
beta=13;
gamma =0.35;
csi=1.5;

%ODE
dxdt=alpha*(y-x+(csi*x)-(W(w, a, b)*x));
dydt=x-y+z;
dzdt=(-beta*y)-(gamma*z);
dwdt=x;
out = [dxdt dydt dzdt dwdt]';