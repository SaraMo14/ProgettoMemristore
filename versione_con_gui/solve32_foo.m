function out = figura32_foo(t, in)
%valori iniziali 
z = in(1);

%parametri
beta = 1;
gamma = 1;
c = 1;

%ODE
dzdt=(beta*z+c)/(gamma-z*z);

out = [dzdt]';
end