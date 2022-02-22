function p_exp = P4_DiceSolution(n)
    num_experiment = 1e5;
    E = randi([1, 6], [n, num_experiment]);
    p_exp = sum(sum(E == 2) > 1) / num_experiment;
end