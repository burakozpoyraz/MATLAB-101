function [xd, fd] = P1_Derivative(x, f, n)
    if n == 1
        N = length(x);
        xd = x(2 : end - 1);
        fd = zeros(1, N - 2);
        for j = 2 : N - 1
            fd(j - 1) = (f(j + 1) - f(j - 1)) / (x(j + 1) - x(j - 1));
        end
    else
        xd = x;
        fd = f;
        for i = 1 : n
            [xd, fd] = P1_Derivative(xd, fd, 1);
        end
    end
end