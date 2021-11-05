function M = Digit(num)
    M = [];
    digit_num = 0;
    
    i = 1;
    while num ~= 0
        f = floor(num / 10^i);
        d = (num - f * 10^i) / 10^(i - 1);
        num = f * 10^i;
        col_vec = [10^(i - 1); d];
        M = [col_vec M];
        digit_num = digit_num + 1;
        i = i + 1;
    end
    col_vec = [0; digit_num];
    M = [col_vec M];
end