function M = Money(m)
    M = [];
    banknote_array = [200 100 50 20 10 5 1];
    
    index = 1;
    while m ~= 0
        quo = floor(m / banknote_array(index));
        if quo > 0
            m = m - quo * banknote_array(index);
            col_vec = [banknote_array(index); quo];
            M = [M col_vec];
        end
        index = index + 1;
    end
end