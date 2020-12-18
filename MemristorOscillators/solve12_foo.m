function out = solve12_foo(t, in)
%initialisation
x = in(1); 
y = in(2); 
z = in(3);
w=  in(4);
alpha=4.2;
beta=-20;
a=-2;
b=9;
epsilon=-1;

%ODE
dxdt=alpha*(y-(x*W(w, a, b)));
dydt=-epsilon*(x+z);
dzdt=beta*y;
dwdt=x;
out = [dxdt dydt dzdt dwdt]';