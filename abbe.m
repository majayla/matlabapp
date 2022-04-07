function [hyp] = abbe(x,n,q)
    total=0;
    for i= 1:n
        total = total + (mass(i+1) - mass(i))^2;
    end
    Q = 1/(2*(n-1))*total;  %����� ��������� �������� �������� �� ������� ���������
    
    %var(x) - ���������
    V = Q/var(x);
    
    % Import the data
    [~, ~, raw] = xlsread('C:\Users\ISMAGILOV\OneDrive\������� ����\AppMatlab\abbe_table.xlsx','����1','A3:C18');
    % Create output variable
    abbetable = reshape([raw{:}],size(raw));
    % Clear temporary variables
    clearvars raw;
    
    %���������� ������ ������ � ������� �� �������
    i = n - 5;
    if q == 0.001
        j = 1;
    elseif q == 0.01
        j = 2;
    elseif q == 0.05
        j = 3;
    end
    
    if V < abbetable(i,j)
        hyp = true;     %������������ ��������������� �����������
    else
        hyp = false;    %���������� ��������������� �����������
    end
    
end

