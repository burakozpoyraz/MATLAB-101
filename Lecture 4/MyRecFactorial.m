function fact = MyRecFactorial(x)
    if x < 0
        fact = -1;
    elseif x == 0
        fact = 1;
    else
        fact = x * MyRecFactorial(x - 1);
    end
end