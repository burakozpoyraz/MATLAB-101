function TestCase1()
    d = 0;
    n = 1;
    
    b = Dec2Bin(d, n);
    b_truth = de2bi(d, n, "left-msb");
    
    num_bit_errors = sum(xor(b, b_truth));
    if num_bit_errors == 0
        fprintf("Congratulations! Test Case 1 has been succesfully passed.\n");
    else
        fprintf("Oops! Test Case 1 has been failed.\n");
    end
end