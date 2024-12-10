num_game = 0;
num_win = 0;
num_lose = 0;

new_game = 1;
while new_game
    difficulty = -1;
    while difficulty < 0 || difficulty > 5
        difficulty = input("Lütfen 1 ile 5 arasında bir zorluk seviyesi seçiniz, " + ...
            "kendi zorluk seviyenizi seçmek için 0 tuşlayınız: ");
    end
    
    switch difficulty
        case 0
            x = -1;
            while x <= 1
                x = input("Lütfen tahmin edeceğiniz sayının üst limiti için 1'den büyük bir sayı giriniz: ");
            end
    
            L = -1;
            while L == 1 || L < 0
                L = input("Lütfen maksimum tahmin sayınızı 1'den büyük bir sayı olarak seçiniz, " + ...
                    "eğer limit koymak istemiyorsanız 0 seçiniz: ");
            end

            if L == 0
                L = 1e6;
            end
        case 1
            x = 10;
            L = 1e6;
        case 2
            x = 10;
            L = 6;
        case 3
            x = 50;
            L = 5;
        case 4
            x = 100;
            L = 4;
        case 5
            x = 500;
            L = 3;
    end
    if L == 1e6
        fprintf("Oyun başlıyor... 1 ile %d arasında bir sayı tahmin etmeye çalışacaksınız ve " + ...
        "toplamda sonsuz tahmin hakkınız var.\n", x);
    else
        fprintf("Oyun başlıyor... 1 ile %d arasında bir sayı tahmin etmeye çalışacaksınız ve " + ...
        "toplamda %d tahmin hakkınız var.\n", x, L);
    end
    
    rand_int = randi([1, x], [1, 1]);
    true_guess = 0;
    guess_count = 1;
    while true_guess == 0 && guess_count <= L
        guess = input("Lütfen bir tahmin yapınız: ");
        if guess == rand_int
            true_guess = 1;
            num_win = num_win + 1;
            fprintf("Doğru bildiniz!!!\n");
        elseif guess < rand_int
            fprintf("Bilemediniz :( Daha büyük bir sayı tahmin etmeniz gerekiyor. Geriye %d tahmin hakkınız kaldı.\n", L - guess_count);
        else
            fprintf("Bilemediniz :( Daha küçük bir sayı tahmin etmeniz gerekiyor. Geriye %d tahmin hakkınız kaldı.\n", L - guess_count);
        end
        guess_count = guess_count + 1;
    end
    num_game = num_game + 1;
    
    if true_guess == 0
        num_lose = num_lose +  1;
        fprintf("Oyunu kaybettiniz :(( Gerçek sayı: %d\n", rand_int);
    end

    new_game = -1;
    while new_game < 0 || new_game > 1
        new_game = input("Yeniden oynamak istiyorsanız 1, istemiyorsanız 0 seçiniz: ");
    end
end
fprintf("Toplam oynadığınız oyun sayısı: %d\n", num_game);
fprintf("Toplam kazandığınız oyun sayısı: %d\n", num_win);
fprintf("Toplam kaybettiğiniz oyun sayısı: %d\n", num_lose);