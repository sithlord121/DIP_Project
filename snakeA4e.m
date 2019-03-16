function A = snakeA4e(K, alpha, beta)

D = zeros(K, K);
D1 = zeros(K, K);
D2 = zeros(K, K);
for i=1:K
    for j=1:K
        if i==j
            D1(i,j) = -2;
            D2(i,j) = 6;
        elseif abs(i-j) == 1  
            D1(i,j) = 1;
            D2(i,j) = -4;
        elseif abs(i-j) == 2
            D2(i,j) = 1;
        elseif (i == 1 && j == K) || (j == 1 && i == K)
            D1(i, j) = 1;
            D2(i, j) = -4;
        elseif (j == 1 && i == K-1) || (j == 2 && i == K)
            D2(i, j) = 1;
        elseif (i == 1 && j == K-1) || (i == 2 && j == K)
            D2(i, j) = 1;    
        end    
    end
end

D = alpha * D1 - beta * D2;
A = (1-D) ^ (-1);
end
