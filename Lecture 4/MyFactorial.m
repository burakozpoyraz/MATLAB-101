function f = MyFactorial(x)
     if x < 0
         error("Please enter a non-negative integer.");
     elseif x == 0
         f = 1;
     else
         f = 1;
         for i = 1 : x
             f = f * i;
         end
     end
end