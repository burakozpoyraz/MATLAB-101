function [fd, xd] = Derivative(f, x, n)
    fd = f;
    xd = x;
    for i = 1 : n
        fd = diff(fd) ./ diff(xd);
        xd = xd(2 : end);
    end
end