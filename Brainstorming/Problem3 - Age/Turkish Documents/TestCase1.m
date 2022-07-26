function TestCase1()
    N = strings(3, 2, 2);
    N(:, :, 1) = ["Burak", "Batuhan"; "Emir", "Emre"; "Samed", "Eren"];
    N(:, :, 2) = ["Merve", "Güzin"; "Emine", "Esra"; "Cansu", "Selin"];
    
    A = randperm(12) + 22;
    A = reshape(A, [3, 2, 2]);
    
    P = Age(N, A);
    P_truth = AgeSolution(N, A);
    
    is_equal = sum(sum(P == P_truth)) == 24;
    if is_equal
        fprintf("Congratulations! Test Case 1 has been succesfully passed.\n");
    else
        fprintf("Oops! Test Case 1 has been failed.\n");
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