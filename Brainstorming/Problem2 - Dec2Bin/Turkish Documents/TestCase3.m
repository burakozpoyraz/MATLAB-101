function TestCase3()
    d = 12;
    n = 4;
    
    b = Dec2Bin(d, n);
    b_truth = de2bi(d, n, "left-msb");
    
    num_bit_errors = sum(xor(b, b_truth));
    if num_bit_errors == 0
        fprintf("Congratulations! Test Case 3 has been succesfully passed.\n");
    else
        fprintf("Oops! Test Case 3 has been failed.\n");
    end
end