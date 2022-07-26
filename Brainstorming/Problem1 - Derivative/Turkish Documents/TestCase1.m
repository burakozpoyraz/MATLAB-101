function TestCase1()
    n = 2;
    x = 0 : 1e-5 : 2 * pi;
    f = sin(x);

    [xd, fd] = Derivative(x, f, n);
    
    xd_truth = x(3 : end - 2);
    fd_truth = -sin(xd_truth);
    
    xd_err = norm(xd - xd_truth)^2;
    fd_err = norm(fd - fd_truth)^2;
    
    if fd_err < 1e-7 && xd_err == 0
        fprintf("Congratulations! Test Case 1 has been succesfully passed.\n");
    elseif fd_err >= 1e-7 && xd_err ~= 0
        fprintf("Oops! Test Case 1 has been failed. (Both the derivative function, fd, and the range of the derivative function, xd, is erroneous)\n");
    elseif fd_err >= 1e-7
        fprintf("Oops! Test Case 1 has been failed. (The derivative function, fd, is erroneous)\n");
    elseif xd_err ~= 0
        fprintf("Oops! Test Case 1 has been failed. (The range of the derivative function, xd, is erroneous)\n");
    end
end