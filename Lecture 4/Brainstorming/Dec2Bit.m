function bit_array = Dec2Bit(decimal, n)
    max_dec_with_n_bits = sum(2.^(0 : n - 1));
    if decimal <= max_dec_with_n_bits
        new_decimal = decimal;
        decreasing_pow_array = (n - 1 : -1 : 0);
        bit_array = zeros(1, n);
        for bit_index = 1 : n
            pow_val = decreasing_pow_array(bit_index);
            if (new_decimal / 2^pow_val) >= 1
                bit_array(bit_index) = 1;
                new_decimal = new_decimal - 2^pow_val;
            else
                bit_array(bit_index) = 0;
            end
        end
    else
        error("%d can't be represented with %d bits!", decimal, n);
    end
end