function out = solve17_foo(t, in)
%initialisation
x = in(1); 
y = in(2); 
w = in(3);%in realtà è z

%parameters
a=0.02;
b=2;
alpha=1;
beta=0.1;
csi=1;

%ODE
dxdt=alpha*(y-W(w, a, b)*x);
dydt=-csi*x + beta*y;
dzdt=x;   
out = [dxdt dydt dzdt]';