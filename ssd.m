function [ D1, D2 ] = ssd( S, T, M )
%SSD Summary of this function goes here
%   Detailed explanation goes here

D1 = zeros(size(S));
D2 = D1;

n = floor(size(T, 1) / 2);

% Loop through image
for i = 1:size(S, 1)
    for j = 1:size(S, 2)
        for k = 1:size(T, 1)
            for l = 1:size(T, 2)
                idxX = i - n + k;
                idxY = j - n + l;
                
                if M(k, l) && ...
                    idxX <= size(S, 1) && idxX > 0 && ...
                    idxY <= size(S, 2) && idxY > 0
                    
                    D1(i,j) = D1(i, j) + (T(k, l) - S(idxX, idxY)) ^ 2;
        
                end;
            end;
        end;
    end;
end;

S2 = conv2(S .* S, rot90(M, 2), 'same');
ST = 2 * conv2(S, rot90(T .* M, 2), 'same');
T2 = sum(sum((T .* M) .^ 2));


D2 = S2 - ST + (ones(size(D2)) * T2); 

end

