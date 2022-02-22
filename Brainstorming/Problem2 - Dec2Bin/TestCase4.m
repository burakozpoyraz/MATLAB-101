function TestCase4()
    d = 61;
    n = 6;
    
    b = Dec2Bin(d, n);
    b_truth = de2bi(d, n, "left-msb");
    
    num_bit_errors = sum(xor(b, b_truth));
    if num_bit_errors == 0
        fprintf("Congratulations! Test Case 4 has been succesfully passed.\n");
    else
        fprintf("Oops! Test Case 4 has been failed.\n");
    end
end