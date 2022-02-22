function TestCase4()
    n = 5;
    p_zero_2 = (5 / 6)^n;
    p_single_2 = n * (1 / 6) * (5 / 6)^(n - 1);
    p_theo = 1 - (p_zero_2 + p_single_2);
    
    p_exp = Dice(n);
    p_err = norm(p_exp - p_theo)^2;
    
    if p_err < 1e-5
        fprintf("Congratulations! Test Case 4 has been succesfully passed.\n");
    else
        fprintf("Oops! Test Case 4 has been failed. (The experimental probability is not close enough to the theoretical probability.)\n");
    end
end