function TestCase2()
    N = strings(3, 5, 2);
    N(:, :, 1) = ["Burak", "Batuhan", "Hasan", "Mehmet", "Okan";
                  "Emir", "Emre", "Samed", "Göker", "Yakup";
                  "Eren", "Hamza", "Fırat", "Ahmet", "Aytaç"];
    N(:, :, 2) = ["Merve", "Güzin", "Ceyda", "Ayşenur", "Seda";
                  "Emine", "Esra", "Cansu", "Selin", "Kader";
                  "Deniz", "Elif", "Zeynep", "Dilara", "Fatma"];
    
    A = randperm(30) + 22;
    A = reshape(A, [3, 5, 2]);
    
    P = Age(N, A);
    P_truth = AgeSolution(N, A);
    
    is_equal = sum(sum(P == P_truth)) == 60;
    if is_equal
        fprintf("Congratulations! Test Case 2 has been succesfully passed.\n");
    else
        fprintf("Oops! Test Case 2 has been failed.\n");
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