function fact = MyFactorial(x)
     fact = 1;
     if x < 0
         fact = -1;
     elseif x == 0
         fact = 1;
     else
         for i = x : -1 : 1
             fact = fact * i;
         end
     end
end