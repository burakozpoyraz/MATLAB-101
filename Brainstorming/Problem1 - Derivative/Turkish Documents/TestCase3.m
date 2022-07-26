function TestCase3()
    n = 2;
    x = 0 : 1e-5 : 2;
    f = exp(2 * x);

    [xd, fd] = Derivative(x, f, n);

    xd_truth = x(3 : end - 2);
    fd_truth = 4 * exp(2 * xd_truth);

    xd_err = norm(xd - xd_truth)^2;
    fd_err = norm(fd - fd_truth)^2;
    
    if fd_err < 1e-5 && xd_err == 0
        fprintf("Congratulations! Test Case 3 has been succesfully passed.\n");
    elseif fd_err >= 1e-5 && xd_err ~= 0
        fprintf("Oops! Test Case 3 has been failed. (Both the derivative function, fd, and the range of the derivative function, xd, is erroneous)\n");
    elseif fd_err >= 1e-5
        fprintf("Oops! Test Case 3 has been failed. (The derivative function, fd, is erroneous)\n");
    elseif xd_err ~= 0
        fprintf("Oops! Test Case 3 has been failed. (The range of the derivative function, xd, is erroneous)\n");
    end
end