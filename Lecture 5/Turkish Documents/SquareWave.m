function wave_sum = SquareWave(x, n)
    wave_sum = zeros(1, length(x));
    for i = 1 : 2 : n
        wave_sum = wave_sum + (1 / i) * sin(i * x);
    end
end