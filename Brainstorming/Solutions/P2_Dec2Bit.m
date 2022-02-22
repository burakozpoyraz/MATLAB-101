function b = P2_Dec2Bit(d, n)
    decreasing_pow_array = (n - 1 : -1 : 0);
    b = zeros(1, n);
    for bit_index = 1 : n
        pow_val = decreasing_pow_array(bit_index);
        comparison = (d / 2^pow_val) >= 1;
        b(bit_index) = comparison;
        d = d - comparison * 2^pow_val;
    end
end