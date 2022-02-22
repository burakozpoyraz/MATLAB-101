function P = P3_Age(N, A)
    num_people = numel(A);
    A_vec = reshape(A, [1, num_people]);
    sorted_A_vec = sort(A_vec);

    P = strings(num_people, 2);
    for i = 1 : num_people
        Ai = sorted_A_vec(i);
        P(i, 1) = N(find(A == Ai));
        P(i, 2) = Ai;
    end
end