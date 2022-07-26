function f = MyRecFactorial(x)
    if x < 0
        error("Please enter a non-negative integer.");
    elseif x == 0
        f = 1;
    else
        f = x * MyRecFactorial(x - 1);
    end
end