function [hyp] = mediana(x,n)
    %алгоритм поиска медианы
    array_temp = sort(x);
    if (rem(n,2) == 0)
        x_med = array_temp(n/2);
    else 
        x_med = (array_temp(n/2 + 1) + array_temp(n/2 + 1))/2;
    end

    
    x_temp = zeros(1,n);    %создание временного массива 

    %заполение массива указанным способом
    for i = 1:n
        if (mass_temp(i) > x_med)
            x_temp(i) = -1;
        elseif (mass_temp(i) < x_med)
            x_temp(i) = 1;
        else
            x_temp(i) = 0;
        end
    end
    
    
    t = 0;         %максимальная длина серии
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
    if (count_series > (0.5*(n+1-1.96*sqrt(n-1)))) && (t < (3.3*log10(n+1))) 
        hyp = false;        %отсутствет систематическая погрешность
    else
        hyp = true;         %присутствует систематическая погрешность
    end

end

