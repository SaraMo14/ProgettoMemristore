% Fourth order Runge-Kutta method
function [x,y]=runge_kutta_4(f,tspan,y0,h)
x = tspan(1):h:tspan(2); 
y = zeros(length(x), 1);
y(1) = y0; % Initial Conditions
for i=1:(length(x)-1)
k_1 = f(x(i),y(i));
k_2 = f((x(i)+0.5*h), (y(i)+0.5*h*k_1));
k_3 = f((x(i)+0.5*h),(y(i)+0.5*h*k_2));
k_4 = f((x(i)+h),(y(i)+k_3*h));
y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;

end

end