function [ D ] = ssd( S, T, M )
% SSD Computes the sum of squared differences for an image S, 
% using template T with mask M.

D = zeros(size(S));

S2 = conv2(S .* S, rot90(M, 2), 'same');
ST = 2 * conv2(S, rot90(T .* M, 2), 'same');
T2 = sum(sum((T .* M) .^ 2));

D = S2 - ST + (ones(size(D)) * T2); 

end