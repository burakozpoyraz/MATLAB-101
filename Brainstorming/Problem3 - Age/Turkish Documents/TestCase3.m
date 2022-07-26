function TestCase3()
    N = strings(1, 7, 1);
    N(:, :, 1) = ["Batuhan", "Selin", "Emre", "Emir", "Göker", "Samed", "Ahmet"];
    
    A = randperm(7) + 22;
    A = reshape(A, [1, 7, 1]);
    
    P = Age(N, A);
    P_truth = AgeSolution(N, A);
    
    is_equal = sum(sum(P == P_truth)) == 14;
    if is_equal
        fprintf("Congratulations! Test Case 3 has been succesfully passed.\n");
    else
        fprintf("Oops! Test Case 3 has been failed.\n");
    end
end

function P = AgeSolution(N, A)
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