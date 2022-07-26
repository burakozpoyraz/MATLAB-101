function f = MyFactorial(x)
     if x < 0
         error("Please enter a non-negative integer.");
     elseif x == 0
         f = 1;
     else
         f = prod(1 : x);
     end
end