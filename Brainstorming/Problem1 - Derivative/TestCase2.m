function TestCase2()
    n = 1;
    x = 0 : 1e-5 : 2;
    f = 12 * x.^3 + 23 * x.^2 - 7 * x + 4;

    [xd, fd] = Derivative(x, f, n);
    
    xd_truth = x(2 : end - 1);
    fd_truth = 36 * xd_truth.^2 + 46 * xd_truth - 7;
        
    xd_err = norm(xd - xd_truth)^2;
    fd_err = norm(fd - fd_truth)^2;
    
    if fd_err < 1e-12 && xd_err == 0
        fprintf("Congratulations! Test Case 2 has been succesfully passed.\n");
    elseif fd_err >= 1e-12 && xd_err ~= 0
        fprintf("Oops! Test Case 2 has been failed. (Both the derivative function, fd, and the range of the derivative function, xd, is erroneous)\n");
    elseif fd_err >= 1e-12
        fprintf("Oops! Test Case 2 has been failed. (The derivative function, fd, is erroneous)\n");
    elseif xd_err ~= 0
        fprintf("Oops! Test Case 2 has been failed. (The range of the derivative function, xd, is erroneous)\n");
    end
end