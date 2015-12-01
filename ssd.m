function [ D ] = ssd( S, T, M )
%SSD Summary of this function goes here
%   Detailed explanation goes here

D = zeros(size(S));

S2 = conv2(S .* S, rot90(M, 2), 'same');
ST = 2 * conv2(S, rot90(T .* M, 2), 'same');
T2 = sum(sum((T .* M) .^ 2));


D = S2 - ST + (ones(size(D)) * T2); 

end

