function[result] = roman(x, n, q) %x - выборка n - кол-во элементов выборки q - довер. вероятность

x_sr = sum(x)/n; %среднее
total = 0;
for i = 1:n 
     total = total + ((x(i) - x_sr) ^ 2 ) / n ;  
end
sigma = sqrt(total);  %СКО                      



%ЗАГРУЗКА ТАБЛИЦЫ КРИТЕРИЯ

%% Import the data
[~, ~, raw] = xlsread('F:\[study]\[Matlab Lessons]\AppMatlab\матлаб\roma_table.xlsx','Лист1');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
%% Create output variable
romatable = reshape([raw{:}],size(raw));
%% Clear temporary variables
clearvars raw R;

%определяем положение в таблице критериев
if q == 0.99
    j = 2;
elseif q == 0.98
    j = 4;
elseif q == 0.95
    j = 4;
elseif q == 0.9
    j = 5;
end
    
i = 0;
for k = 1:6
    if n >= romatable(1, k) && n < romatable(1, k + 1)
        i = romatable(k);
        break;
    end
end
t = romatable(i, j);

%определяем элементы, удовлетворяющие критерию
x_temp = zeros(n); 
count = 1;
for i = 1:n
    betta = abs((x_sr - mass(i))/ sigma);
    if betta <= t
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

        
    
    
    