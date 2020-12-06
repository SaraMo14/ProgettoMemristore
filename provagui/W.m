function [s] = W(x, a, b)
if abs(x) < 1
    s = a;
else if abs(x) > 1
    s = b;
    end 
end

