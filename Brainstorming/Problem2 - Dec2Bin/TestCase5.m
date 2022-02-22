function TestCase5()
    d = 972;
    n = 10;
    
    b = Dec2Bin(d, n);
    b_truth = de2bi(d, n, "left-msb");
    
    num_bit_errors = sum(xor(b, b_truth));
    if num_bit_errors == 0
        fprintf("Congratulations! Test Case 5 has been succesfully passed.\n");
    else
        fprintf("Oops! Test Case 5 has been failed.\n");
    end
end