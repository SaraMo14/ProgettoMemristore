function out = solve10_foo(t, in)
%initialisation
x = in(1); 
y = in(2); 
z = in(3);
w = in(4);

a=0.2;
b=10;
alpha=4;
beta=1;
gamma=0.65;

%ODE
dxdt=alpha*(y-W(w, a, b)*x);
dydt=z-x;
dzdt=-beta*y + gamma*z;   
dwdt = x;
out = [dxdt dydt dzdt dwdt]';