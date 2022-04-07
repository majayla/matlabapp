
n=100;
mass = randi(50, 1, n);



sigma = var(mass); %дисперсия
total=0;
for i= 1:n
    total = total + (mass(i+1) - mass(i))^2;
end
Q = 1/(2*(n-1))*total;

V = Q/sigma;
