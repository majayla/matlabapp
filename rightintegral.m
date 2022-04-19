function[S] = rightintegral(a, b, n)
    h = (b - a) / n;
    x0 = a + h;
    S = 0;
    for i = 1:n 
        if (x0 <= b)
            S = S + gause(x0);
            x0 = x0 + h;
        end
    end
    S = S * h;
end

function [f] = gause(x)
    f = exp((-x^2)/2)/(sqrt(2*pi));
end
