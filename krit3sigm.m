function[result] = krit3sigm(x, n)

    x_sr = sum(x)/n;

    total = 0;
    for i = 1:n 
        total = total + ((x(i) - x_sr) ^ 2 ) / (n - 1) ;
    end
    Sx = sqrt(total);  %СКО

    sigma = 0;   %значения из таблицы
    if n > 20 && n < 51
        sigma = Sx * 3;
    elseif n > 50 && n < 101
        sigma = Sx * 4;
    elseif n > 100 && n < 1001
        sigma = Sx * 4.5;
    elseif n > 1000 && n < 10001
        sigma = Sx * 5;
    end

        %определяем элементы, удовлетворяющие критерию
    x_temp = zeros(n); 
    count = 1;
    for i = 1:n
        if abs(x(i) - x_sr) < sigma
            x_temp(count) = x(i);
            count = count + 1;
        end
    end
     %перезаписываем результат в массив   
     result = zeros(count - 1);
     for k = 1:(count - 1)
         result(k) = x_temp(k);
     end
    
end
