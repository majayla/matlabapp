function [hyp] = acsending_descending(x,n)
    
    %создание временного массива нужным способом
    x_temp = x;

    for i = 1:n
        if (x(i) > x(i+1))
            x_temp(i) = -1;
        elseif (x(i) < x(i+1))
            x_temp(i) = 1;
        end
    end

    t = 0;          %максимальная длина серии
    count_series = 0;       %количество серий
    length = 0;
    for i = 2:n
        if (x_temp(i) == x_temp(i-1) )
            length = length + 1;
            else
                count_series = count_series + 1;
                if (length > t)
                    t = length;
                    length = 0;
                end
        end
    end

    t0 = 8;
    if (n <= 26)
        t0 = 5;
    elseif (26 < n) && (n <= 153)
        t0 = 6;
    elseif (153 < n) && (n <= 1170)
        t0 = 7;
    end

    if (count_series > (1/3 * (2 * n - 1) - 1.96 * sqrt((16 * n - 29) / 90))) && (t < t0) 
        hyp = false;    %отсутствет систематическая погрешность
    else
        hyp = true;     %присутствует систематическая погрешность
    end
end

